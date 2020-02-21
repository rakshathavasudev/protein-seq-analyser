'''
This file is part of HHMFold, for the paper 'Advancing the Accuracy of Protein Fold
Recognition by Utilizing Profiles from Hidden Markov Models'
Code written by James Lyons, December 2014
This file is released under an MIT licence

parse_files.py - provides routines for parsing hmm files, pssm files and the label files
used in the paper for the TG, EDD and DD protein fold recognition datasets
'''


import sys
import numpy as np
from joblib import load
from parse_files import *
from features import monogram_features, bigram_features
from sklearn.preprocessing import scale
from gensim.models import Word2Vec

def maximum_index(a):
	max=0
	index=0
	for k in range(len(a[0])):
		if a[0][k] >max :
			max=a[0][k]
			index=k
	return index

def buildWordVector(tokens, size):
    vec = np.zeros(size).reshape((1, size))
    count = 0.
    for word in tokens:
#         print word
        try:
            vec += model[word].reshape((1, size))
            count += 1.
        except KeyError: # handling the case where the token is not
                         # in the corpus. useful for testing.
            continue
    if count != 0:
        vec /= count
    return vec

scaler =load('Scale')
ID=sys.argv[1]

print(ID)

PSSM_File="../PSI-BLAST/Datasets/WebRequests/pssm/"+ID+".txt"
HMM_File="../HHBlits/Datasets/WebRequests/hmm/"+ID+".txt"
PSIPRED_File="../PSIPRED/Datasets/WebRequests/psipred/"+ID+".sss"



################PSSM################
feature_func =bigram_features
parse_probabilities = parse_pssm_sigmoid
(seq,probs,lprob) = parse_probabilities(PSSM_File)
pssm=np.squeeze(np.asarray(feature_func(lprob)))
#print(pssm)
##############HMM###################
feature_func=bigram_features
parse_probabilities = parse_hmm
(seq,probs,lprob) = parse_probabilities(HMM_File)
hmm=np.squeeze(np.asarray(feature_func(probs)))
#print(hmm)
###################################
f=open(PSIPRED_File)
input_seq=f.readline()
dim=400
#print(input_seq)
model = Word2Vec(input_seq, size=dim, window=2, min_count=1, workers=4, sg=1)
feat_w2v=buildWordVector(input_seq,dim)
#print(feat_w2v,feat_w2v.shape)
#####################################
X=[pssm]
X=np.array(X)
X=scaler.transform(X)
classifier=load('SVMC')
pred_vec=classifier.predict(X)
pred_prob=classifier.predict_proba(X)
pred_vec=pred_vec.toarray()
pred_prob=pred_prob.toarray()
#print(pred_prob,pred_vec)
label=['envelope','stroma','lumen','thylakoid_membrane','plastoglobule']
prediction=[]
for i in range(len(pred_vec[0])):
    if pred_vec[0][i]==1:
        prediction.append(label[i])

if len(prediction)==0: # if no prediction made
	prediction.append(label[maximum_index(pred_prob)])
#print(prediction)

f = open("./Results/"+ID+".txt", "w")
f.write(str(prediction))
f.close()
