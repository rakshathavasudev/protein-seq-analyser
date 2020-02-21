#!/bin/bash
# Expects Filename as input which must be in ".fasta" format.
# Extracts hmm, a3m and hrr files with the same Filename (without .fasta extenstion) with corresponding extensions.


filename1="$1.fasta"
fastapath="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Input/"
hhrpath="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/hhr/"
a3mpath="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/a3m/"
hmmpath="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/hmm/"
processedpath="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Archive"
db="/home/psa/VGST_Scripts/HHBlits/Database/uniprot20_2016_02/uniprot20_2016_02"
#db="/home/psa/VGST_Scripts/HHBlits/Database/uniclust30_2016_03/uniclust30_2016_03"
hhblitsOutout="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Log/HHBlits.res"
hhmakeOutout="/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Log/HHMake.res"



#echo $filename1
filename2=`echo $filename1 | cut -d \. -f 1`
#echo $filename2
fastaFile="$fastapath$filename1"
hhrFile="$hhrpath$filename2.hhr"
a3mFile="$a3mpath$filename2.a3m"
hmmFile="$hmmpath$filename2.txt"
output1="`/home/psa/VGST_Scripts/HHBlits/hhsuite/bin/hhblits -i $fastaFile -o $hhrFile -oa3m $a3mFile -n 4 -d $db`"
`echo $output1 >> $hhblitsOutout`
output2="`/home/psa/VGST_Scripts/HHBlits/hhsuite/bin/hhmake -i $a3mFile -o $hmmFile`"	
`echo $output2 >> $hhmakeOutout`
sourceFile="$fastapath$filename1"
`mv $sourceFile $processedpath`
