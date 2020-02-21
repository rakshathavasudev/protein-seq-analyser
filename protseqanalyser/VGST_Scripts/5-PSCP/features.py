'''
This file is part of HHMFold, for the paper 'Advancing the Accuracy of Protein Fold
Recognition by Utilizing Profiles from Hidden Markov Models'
Code written by James Lyons, December 2014
This file is released under an MIT licence

features.py - provides routines for computing monogram. bigram and trigram features from AA substitution probability matrices.
The trigram_features function is quite slow, because we have to loop explicitly. This could be sped up considerably by implementing
in e.g. C
'''
import numpy
from itertools import product
"""
compute monogram features
- prob is a numpy matrix of substitution probabilities N by 20
- returns 20 features
"""
def monogram_features(prob):
    return numpy.matrix(numpy.sum(prob,axis=0))

"""
compute bigram features
- prob is a numpy matrix of substitution probabilities N by 20
- returns 400 features
"""   
def bigram_features(prob):
    return numpy.matrix((prob[:-1,:].T*prob[1:,:]).flatten())

def bigram_features1(prob):
    return numpy.matrix((prob[:-2,:].T*prob[2:,:]).flatten())

def bigram_features2(prob):
    return numpy.matrix((prob[:-3,:].T*prob[3:,:]).flatten())

def bigram_features3(prob):
    return numpy.matrix((prob[:-4,:].T*prob[4:,:]).flatten())

def bigram_features4(prob):
    return numpy.matrix((prob[:-5,:].T*prob[5:,:]).flatten())

def bigram_features5(prob):
    return numpy.matrix((prob[:-6,:].T*prob[6:,:]).flatten())

def bigram_features6(prob):
    return numpy.matrix((prob[:-7,:].T*prob[7:,:]).flatten())
    
"""
compute trigram features
- prob is a numpy matrix of substitution probabilities N by 20
- returns 8000 features
- unfortunately not as efficient as mono and bi, had to use for loops
"""   
def trigram_features(prob):
    N,D = numpy.shape(prob)
    result = numpy.zeros((8000,1))
    for (i,j,k) in product(range(20),range(20),range(20)):
        for n in range(N-2):
            result[400*i + 20*j + k] += prob[n,i]*prob[n+1,j]*prob[n+2,k]
    return numpy.matrix(result).T
    
