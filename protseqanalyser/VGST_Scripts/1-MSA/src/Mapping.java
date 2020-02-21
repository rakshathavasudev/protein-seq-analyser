
public class Mapping {
	
	//Index to Amino Acid Molecule Mapping.
	public char GetAminoAcidMolecule(int index) {
		
		char returnAAM = ' ';
		
		switch(index){
			case 0: returnAAM = 'A'; break;
			case 1: returnAAM = 'C'; break;
			case 2: returnAAM = 'D'; break;
			case 3: returnAAM = 'E'; break;
			case 4: returnAAM = 'F'; break;
			case 5: returnAAM = 'G'; break;
			case 6: returnAAM = 'H'; break;
			case 7: returnAAM = 'I'; break;
			case 8: returnAAM = 'K'; break;
			case 9: returnAAM = 'L'; break;
			case 10: returnAAM = 'M'; break;
			case 11: returnAAM = 'N'; break;
			case 12: returnAAM = 'P'; break;
			case 13: returnAAM = 'Q'; break;
			case 14: returnAAM = 'R'; break;
			case 15: returnAAM = 'S'; break;
			case 16: returnAAM = 'T'; break;
			case 17: returnAAM = 'V'; break;
			case 18: returnAAM = 'W'; break;
			case 19: returnAAM = 'Y'; break;
			default: returnAAM = ' '; break;
			
		}
		return returnAAM;
	}
	
	//Ascending Amino Acid Molecule to Index Mapping.	
	public int GetIndex(char AminoMolecule) {
		
		int returnIndex = -1;
		
		switch(AminoMolecule){
			case 'A': returnIndex = 0; break;
			case 'C': returnIndex = 1; break;
			case 'D': returnIndex = 2; break;
			case 'E': returnIndex = 3; break;
			case 'F': returnIndex = 4; break;
			case 'G': returnIndex = 5; break;
			case 'H': returnIndex = 6; break;
			case 'I': returnIndex = 7; break;
			case 'K': returnIndex = 8; break;
			case 'L': returnIndex = 9; break;
			case 'M': returnIndex = 10; break;
			case 'N': returnIndex = 11; break;
			case 'P': returnIndex = 12; break;
			case 'Q': returnIndex = 13; break;
			case 'R': returnIndex = 14; break;
			case 'S': returnIndex = 15; break;
			case 'T': returnIndex = 16; break;
			case 'V': returnIndex = 17; break;
			case 'W': returnIndex = 18; break;
			case 'Y': returnIndex = 19; break;
			default: returnIndex = -1; break;
			
		}
		return returnIndex;
	}



}
