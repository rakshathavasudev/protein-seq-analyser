#!/bin/bash
# Expects Filename as input which must be in ".fasta" format.
# This is wrapped shell script to run PSIPRED for multiple fasta files


filename1="$1.fasta"
fastapath="/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/Input/"
pssmpath="/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/pssm/"
processedpath="/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/Archive"
blastdb="/home/psa/VGST_Scripts/PSI-BLAST/ncbi-blast-2.7.1+/bin/blastdb/nr"


filename2=`echo $filename1 | cut -d \. -f 1`
fastaFile="$fastapath$filename1"
destinationfile="$pssmpath$filename2.txt"
echo "Processing: $filename1"       
output="`psiblast -query $fastaFile -db $blastdb -evalue 0.001 -num_threads 24 -num_iterations 3 -out_ascii_pssm $destinationfile`"
`mv $fastaFile $processedpath`


