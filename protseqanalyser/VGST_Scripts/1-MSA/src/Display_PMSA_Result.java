import java.util.Iterator;


public class Display_PMSA_Result {
	
	public char [][] PrintResults(ReadTestInputFiles TestSequences, int numofSeq, int seqLength, char [][] result, FCS_DataStructure final_FCSDS, WriteOutput writeOutput, String outputFilePathName) {
		
		Mapping m = new Mapping();
		
		//int seqLength = final_FCSDS.FCS.length();
		//char [][] result = new char[numofSeq][seqLength];
		
		for(int a=0; a<numofSeq; a++)
			for(int b=0; b<seqLength; b++)
				result[a][b] = '-';
		
		for(int y=0; y<seqLength; y++) {			
			for(int z=0; z<20; z++) {
				
				Iterator<Integer> iterator = final_FCSDS.frs.get(y).AminoAcid[z].ListOfSequencesAtCell.iterator();
				while (iterator.hasNext()) {
					int seqNum = iterator.next();
					if(result[seqNum][y] == '-')
						result[seqNum][y] = m.GetAminoAcidMolecule(z);
					else if(result[seqNum][y] != m.GetAminoAcidMolecule(z))
						result[seqNum][y] = '*';
					else
						result[seqNum][y] = '$';
				}//end of while	loop		
			}//end of inner for loop		
		}//end of outer for loop
		
		//Print in FASTA as well NORMAL format for comparison and QScore calculation
//		String alignedData ="\n";
		String alignedDataFasta = "";
		for(int a=0; a<numofSeq; a++) {
			alignedDataFasta= alignedDataFasta+TestSequences.key.get(a)+"\n";
			for(int b=0; b<seqLength; b++) {				
//				alignedData += result[a][b]+"";
				alignedDataFasta += result[a][b]+"";
			}
			alignedDataFasta += "\n";
			writeOutput.WriteAlignment(outputFilePathName, alignedDataFasta);
			alignedDataFasta = "";
//			alignedData += "\n";
		}
//		writeOutput.WriteAlignment(outputFilePathName, alignedData);			
//		writeOutput.WriteAlignment(outputFilePathName+"_N", alignedDataFasta);
//		writeOutput.WriteAlignment(outputFilePathName, alignedDataFasta);
		
		outputFilePathName = null;
		alignedDataFasta = null;
		m = null;
		TestSequences.key.clear();
		
		return result;
	}
}
