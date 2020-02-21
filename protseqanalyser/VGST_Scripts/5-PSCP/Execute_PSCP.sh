#!/bin/bash
# Master shell script to extract HMM, PSSM, and PSIPRED information to extract features for the prediction of Protein Sub-Chlorplast Location

START=$(date +%s)
filename1=$1

echo "$filename1 started at $START"

# Generate PSSM, HMM, and PSIPRED files
pssm=`/home/psa/VGST_Scripts/PSI-BLAST/Generate_PSSM.sh $filename1`
PT=$(date +%s)
PTD=$(( $PT - $START ))
echo "pssm took $PTD secs"

hmm=`/home/psa/VGST_Scripts/HHBlits/Generate_HMM.sh $filename1`
HT=$(date +%s)
HTD=$(( $HT - $PT ))
echo "hmm took $HTD secs"

psipred=`/home/psa/VGST_Scripts/PSIPRED/Generate_PSIPRED.sh $filename1`
PRDT=$(date +%s)
PRDTD=$(( $PRDT - $HT ))
echo "psipred took $PRDTD secs"

# Move ss, ss2, horiz files to psipred folder
`mv ./$filename1.ss /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred`
`mv ./$filename1.ss2 /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred`
`mv ./$filename1.horiz /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred`

# Execute Java code to extract Secondary Structural Sequence from horiz file
execute=`java Get_SSS $filename1`

#Execute python script to predict the Protein Sub-Chlorplast Location
output=`python3 Execute_PSCP.py $filename1`

result="/home/psa/VGST_Scripts/5-PSCP/Results/$filename1.txt"
echo `cat $result`

END=$(date +%s)
echo "$filename1 ended at $END"
DIFF=$(( $END - $START ))
echo "Overall it took $DIFF secs"

#`rm /home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/pssm/$filename1.txt`
#`rm /home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/hmm/$filename1.txt`
`rm /home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/hhr/$filename1.hhr`
`rm /home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/a3m/$filename1.a3m`
`rm /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/$filename1.ss`
`rm /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/$filename1.ss2`
`rm /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/$filename1.horiz`
#`rm /home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/$filename1.sss`
