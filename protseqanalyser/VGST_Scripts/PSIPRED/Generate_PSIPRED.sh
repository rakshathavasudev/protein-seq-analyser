#!/bin/bash
# Expects Filename as input which must be in ".fasta" format.
# This is wrapped shell script to run PSIPRED for multiple fasta files

filename1="$1.fasta"
fastapath="/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Input/"
psipredpath="/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/"
processedpath="/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Archive"
logpath="/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Log"


filename2=`echo $filename1 | cut -d \. -f 1`
fastaFile="$fastapath$filename1"
echo "Processing: $fastaFile"       
output="`/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Input/runpsipredplus $fastaFile`"

`mv $fastaFile $processedpath`

tmpfiles="psitmp*"
`mv $tmpfiles $logpath`



