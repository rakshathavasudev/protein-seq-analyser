import java.util.Iterator;
import java.util.Stack;

public class LocalAlignment {
	
//	private static final double MAX_DOUBLE * -1 = 0;
	
	public FCS_DataStructure ApplyLocalAlignment(FCS_DataStructure seq1, FCS_DataStructure seq2, ReadMutationMatrix mm) {
		
		int rows, cols;
		rows=seq1.FCS.length()+1;
		cols=seq2.FCS.length()+1;
		
		AligmentCellMatrix Matrix[][] = new AligmentCellMatrix[rows][cols];
		
		for(int i = 0; i < rows; i++) 
			for(int j = 0; j< cols; j++) {
				AligmentCellMatrix acm = new AligmentCellMatrix();
				Matrix[i][j]=acm;
			}

		//Initialize the first Row With Gap Penalty Equal to Zero and Sequence character
		for (int i = 0; i < cols; i++) {
			Matrix[0][i].value = 0;
			if(i!=0) {
				Matrix[0][i].trackback = "L";
				Matrix[0][i].seqChar = seq2.FCS.charAt(i-1);
			}
		}
		
		//Initialize the first Column With Gap Penalty Equal to Zero and Sequence character
		for (int i = 0; i < rows; i++) {
			Matrix[i][0].value = 0;
			if(i!=0) {
				Matrix[i][0].trackback = "T";
				Matrix[i][0].seqChar = seq1.FCS.charAt(i-1);
			}
		}
		
		// Fill Matrix with each cell has a value result from method Get_Max
		for (int i = 1; i < rows; i++)
			for (int j = 1; j < cols; j	++)
				Matrix[i][j] = Get_Max(i, j, seq1, seq2, mm, Matrix);
		
		FCS_DataStructure FCS_merge = null;
		FCS_merge = Trace_Back(Matrix, rows, cols, seq1, seq2);
		
		return FCS_merge;
	}
	
	//====================================================================================================
	public AligmentCellMatrix Get_Max(int i, int j, FCS_DataStructure Seq1, FCS_DataStructure Seq2, ReadMutationMatrix mm, AligmentCellMatrix[][] Matrix) {
		
		double Sim=0;
		double tempSim = 0;
		int leftCount=0, topCount=0;
		
		//Average Gap Penalty based on Amino Acid Sequences
		double leftGapPenalty =0.0, topGapPenalty=0.0;
		double PSDGOP =0.0;
		
		
		Mapping m = new Mapping();
		//Look up from BLOSUM62 matrix
		char left = Seq1.FCS.charAt(i-1);
		char top = Seq2.FCS.charAt(j-1);
		
		//4 possible option 			
		//---------------Case 1:left AAM & top AAM---------------
		if(left != '*' && top != '*') {
			int indexL = m.GetIndex(left);	
			int indexR = m.GetIndex(top);
			
			leftCount = Seq1.frs.get(i-1).AminoAcid[indexL].Count;
			topCount = Seq2.frs.get(j-1).AminoAcid[indexR].Count;
			int count = leftCount * topCount;
			
			tempSim = (mm.GetBLOSUMScore(left, top) * count);
//			int totalSeqs = Seq1.numOfSeq + Seq2.numOfSeq;
			int totalSeqs = count;
			Sim = (tempSim/totalSeqs);	
			
			//Cal Average Gap Penalty based on Amino Acid Sequences
			leftGapPenalty = (mm.GetBLOSUMScore(top, top) * topCount / topCount) * -1;
			topGapPenalty = (mm.GetBLOSUMScore(left, left) * leftCount / leftCount) * -1;
			
			//Cal PSDGP
			PSDGOP = (mm.GetBLOSUMScore(top, top)) * -1;
		}
		
		//---------------Case 2:left AAM & top *---------------
		else if(left != '*' && top == '*') {
			
			leftCount = Seq1.frs.get(i-1).AminoAcid[m.GetIndex(left)].Count;
			
			FCS_RowStructure temp_FCSRS = new FCS_RowStructure();
			temp_FCSRS = Seq2.frs.get(j-1);
			
			int totalSeqs = 0;
			for(int a=0; a<20; a++) {	
				int localTopCount = temp_FCSRS.AminoAcid[a].Count;
				if(localTopCount > 0) {
					char localTopAAM = m.GetAminoAcidMolecule(a);
					tempSim = tempSim + (mm.GetBLOSUMScore(left, localTopAAM) * (localTopCount * leftCount));
					totalSeqs += (localTopCount * leftCount);
					
					//Dynamic Gap Penalty
					leftGapPenalty += (mm.GetBLOSUMScore(localTopAAM, localTopAAM) * localTopCount);
					topCount += localTopCount;
					
					//PSDGP
					PSDGOP += leftCount * ( localTopCount * ((mm.GetBLOSUMScore(localTopAAM, localTopAAM) + mm.GetBLOSUMScore(left, left))/2));
//					PSDGOP += leftCount * ( localTopCount * (((mm.GetBLOSUMScore(localTopAAM, localTopAAM) + mm.GetBLOSUMScore(left, left))/2))- mm.GetBLOSUMScore(localTopAAM, left));
				}
			}
//			Sim = (tempSim/totalSeqs);
			int totalSeq = Seq1.numOfSeq + Seq2.numOfSeq;
			Sim = (tempSim/totalSeq);
			
			//Cal Average Gap Penalty based on Amino Acid Sequences	
//			leftGapPenalty = (leftGapPenalty / topCount) * -1;	
//			topGapPenalty = (mm.GetBLOSUMScore(left, left) * leftCount / leftCount) * -1;	
			
			//Cal PSDGP
			PSDGOP = PSDGOP/(Seq1.numOfSeq * Seq2.numOfSeq) * -1;
					
		}
		
		//---------------Case 3:left * & top AAM---------------
		else if(left == '*' && top != '*') {
			
			topCount = Seq2.frs.get(j-1).AminoAcid[m.GetIndex(top)].Count;
			
			FCS_RowStructure temp_FCSRS = new FCS_RowStructure();
			temp_FCSRS = Seq1.frs.get(i-1);
			
			int totalSeqs = 0;	
			for(int a=0; a<20; a++) {	
				int localLeftCount = temp_FCSRS.AminoAcid[a].Count;
				if(localLeftCount > 0) {
					char localLeftAAM = m.GetAminoAcidMolecule(a);
					tempSim = tempSim + (mm.GetBLOSUMScore(localLeftAAM, top) * (localLeftCount * topCount));
					totalSeqs += (localLeftCount * topCount);
					
					//Dynamic Gap Penalty
					topGapPenalty += (mm.GetBLOSUMScore(localLeftAAM, localLeftAAM) * localLeftCount);
					leftCount += localLeftCount;
					
					//PSDGP
					PSDGOP += topCount * ( localLeftCount * ((mm.GetBLOSUMScore(localLeftAAM, localLeftAAM) + mm.GetBLOSUMScore(top, top))/2));
//					PSDGOP += topCount * ( localLeftCount * (((mm.GetBLOSUMScore(localLeftAAM, localLeftAAM) + mm.GetBLOSUMScore(top, top))/2))- mm.GetBLOSUMScore(localLeftAAM, top));
				}
			}
//			Sim = (tempSim/totalSeqs);
			int totalSeq = Seq1.numOfSeq + Seq2.numOfSeq;
			Sim = (tempSim/totalSeq);
			
			//Cal Average Gap Penalty based on Amino Acid Sequences
//			leftGapPenalty = (mm.GetBLOSUMScore(top, top) * topCount / topCount) * -1;
//			topGapPenalty = (topGapPenalty / leftCount) * -1;
			
			//Cal PSDGP
			PSDGOP = PSDGOP/(Seq1.numOfSeq * Seq2.numOfSeq) * -1;
		}
		
		//---------------Case 4:left * & top *---------------
		else if(left == '*' && top == '*') {
			
			FCS_RowStructure tempLeft_FCSRS = new FCS_RowStructure();
			tempLeft_FCSRS = Seq1.frs.get(i-1);
			
			FCS_RowStructure tempTop_FCSRS = new FCS_RowStructure();
			tempTop_FCSRS = Seq2.frs.get(j-1);
			
			int totalSeqs = 0;
					
			for(int a=0; a<20; a++) {
				int localLeftCount = tempLeft_FCSRS.AminoAcid[a].Count;
				for(int b=0; b<20; b++) {	
					int localTopCount = tempTop_FCSRS.AminoAcid[b].Count;
					if(localLeftCount > 0 && localTopCount > 0) {
						
						char leftAAM = m.GetAminoAcidMolecule(a);
						char topAAM = m.GetAminoAcidMolecule(b);
						tempSim = tempSim + (mm.GetBLOSUMScore(leftAAM, topAAM) * (localLeftCount * localTopCount));
						totalSeqs += (localLeftCount * localTopCount);
						
						//Dynamic Gap Penalty
						topGapPenalty += (mm.GetBLOSUMScore(leftAAM, leftAAM) * localLeftCount);
						leftCount += localLeftCount;
						leftGapPenalty += (mm.GetBLOSUMScore(topAAM, topAAM) * localTopCount);
						topCount += localTopCount;
						
						//PSDGP
						PSDGOP += localLeftCount * ( localTopCount * ((mm.GetBLOSUMScore(topAAM, topAAM) + mm.GetBLOSUMScore(leftAAM, leftAAM))/2));
//						PSDGOP += localLeftCount * ( localTopCount * (((mm.GetBLOSUMScore(topAAM, topAAM) + mm.GetBLOSUMScore(leftAAM, leftAAM))/2)) - mm.GetBLOSUMScore(topAAM, leftAAM));
					
					}
				}
			}
//			Sim = (tempSim/totalSeqs);
			int totalSeq = Seq1.numOfSeq + Seq2.numOfSeq;
			Sim = (tempSim/totalSeq);
			
			//Cal Average Gap Penalty based on Amino Acid Sequences
//			leftGapPenalty = (leftGapPenalty / topCount) * -1;	
//			topGapPenalty = (topGapPenalty / leftCount) * -1;
			
			//Cal PSDGP
			PSDGOP = PSDGOP/(Seq1.numOfSeq * Seq2.numOfSeq) * -1;
		}
		
		double M1, M2, M3;
		//-----Position Specific Dynamic Gap Penalties 10:1 ratio for Gap Open and Gap Extention
		M1 = Matrix[i-1][j-1].value + Sim;

		//Left to Right
		if(Matrix[i][j-1].gap != 'L')
			M2 = Matrix[i][j-1].value + PSDGOP;
		else
			M2 = Matrix[i][j-1].value + 0.1;//(PSDGOP * 0.1);
		//Top to Down
		if(Matrix[i-1][j].gap != 'R')
			M3 = Matrix[i - 1][j].value + PSDGOP; 	
		else
			M3 = Matrix[i - 1][j].value +  0.1;//(PSDGOP * 0.1);
		
		
//		//---Look Back Ahead Wrong(Old) Logic------
////		//Diagonal Down 
//		M1 = Matrix[i-1][j-1].value + Sim;
//		//Left to Right
//		if(Matrix[i][j-1].gap != 'L')
////			M2 = Matrix[i][j-1].value + topGapPenalty; 		//--22.69/9.74
//			M2 = Matrix[i][j-1].value + leftGapPenalty; 	//--22.89/9.34
//		else
//			M2 = Matrix[i][j-1].value + GapExtend;
//		//Top to Down
//		if(Matrix[i-1][j].gap != 'R')
////			M3 = Matrix[i - 1][j].value + leftGapPenalty; 	//--22.69/9.74
//			M3 = Matrix[i - 1][j].value + topGapPenalty; 	 //--22.89/9.34
//		else
//			M3 = Matrix[i - 1][j].value + GapExtend;
		
		
		//----Look Back Ahead Logic(New)--------
		//Diagonal Down
//		M1 = Matrix[i-1][j-1].value + Sim;
//		//Left to Right
//		if(Matrix[i][j-1].gap == 'L')
//			M2 = Matrix[i][j-1].value + GapOpen[0];
//		else
//			M2 = Matrix[i][j-1].value + GapExtend;
//		//Top to Down
//		if(Matrix[i-1][j].gap == 'R')
//			M3 = Matrix[i - 1][j].value + GapOpen[0];
//		else
//			M3 = Matrix[i - 1][j].value + GapExtend;
		
//		//-----------Normal Logic-----------------------
//		//Diagonal Down
//		M1 = Matrix[i-1][j-1].value + Sim;
//		//Left to Right
//		M2 = Matrix[i][j-1].value + GapOpen[0];
//		//Top to Down
//		M3 = Matrix[i - 1][j].value + GapOpen[0];
		
		/*//Old Approach
			
		AligmentCellMatrix Temp = new AligmentCellMatrix(); 
				
		double Mmax = Math.max(Math.max(M3, M2), M1);		
		Temp.value = Math.max(Mmax, 0);
		
		if (Mmax == M1)			
		{	Temp.trackback = "D"; 
			Temp.gap = '=';		
		}
	
		else if (Mmax == M2)
		{	Temp.trackback = "L"; 
			Temp.gap = 'L';	
		}
		
		else 
		{	Temp.trackback = "T"; 
			Temp.gap = 'T';	
		}
		*/
		
		
		AligmentCellMatrix Temp = new AligmentCellMatrix(); 
		
		double D = Matrix[i-1][j-1].value;
		double L = Matrix[i][j-1].value;
		double T = Matrix[i-1][j].value;
		double Mmax = 0.0;
				
		if(M1 == M2 && M2 == M3){			
			
			Mmax = Math.max(Math.max(T, L), D);	
			
			if (Mmax == D) {
				Temp.trackback = "D"; 
				Temp.gap = '=';					
				Temp.value = Math.max(M1, 0);				
			}
			else if (Mmax == L){
				Temp.trackback = "L"; 
				Temp.gap = 'L';	
				Temp.value = Math.max(M2, 0);	
			}
			else {
				Temp.trackback = "T"; 
				Temp.gap = 'T';	
				Temp.value = Math.max(M3, 0);
			}
			
//			System.out.println("M1:M2:M3");
		}
		else if (M1 == M2 && M1 > M3){
			
			Mmax = Math.max(L, D);	
		
			if (Mmax == D) {
				Temp.trackback = "D"; 
				Temp.gap = '=';					
				Temp.value = Math.max(M1, 0);
			}
			else {
				Temp.trackback = "L"; 
				Temp.gap = 'L';	
				Temp.value = Math.max(M2, 0);
			}
//			System.out.println("M1:M2");
		}
		else if (M1 == M3 && M1 > M2){
			
			Mmax = Math.max(T, D);
		
			if (Mmax == D) {
				Temp.trackback = "D"; 
				Temp.gap = '=';	
				Temp.value = Math.max(M1, 0);
			}
			else {
				Temp.trackback = "T"; 
				Temp.gap = 'T';	
				Temp.value = Math.max(M3, 0);
			}
//			System.out.println("M1:M3");
		}
		else if (M2 == M3 && M2 > M1){
			
			Mmax = Math.max(T, L);
			
			if (Mmax == L){
				
				Temp.trackback = "L"; 
				Temp.gap = 'L';	
				Temp.value = Math.max(M2, 0);
			}
			else {
				Temp.trackback = "T"; 
				Temp.gap = 'T';	
				Temp.value = Math.max(M3, 0);
			}
//			System.out.println("M2:M3");
		}
		else if (M1 > M2 && M1 > M3){
			
			Temp.trackback = "D"; 
			Temp.gap = '=';	
			Temp.value = Math.max(M1, 0);
			
		}
		else if (M2 > M1 && M2 > M3){
			
			Temp.trackback = "L"; 
			Temp.gap = 'L';	
			Temp.value = Math.max(M2, 0);			
		}
		else if (M3 > M1 && M3 > M2){
			
			Temp.trackback = "T"; 
			Temp.gap = 'T';	
			Temp.value = Math.max(M3, 0);		
		}
		else
			System.out.println("Serious Danger");
				
		return Temp;
	}

	//====================================================================================================
	public FCS_DataStructure Trace_Back(AligmentCellMatrix[][] Matrix, int rows, int cols, FCS_DataStructure Seq1, FCS_DataStructure Seq2) {
		
		Stack<String> stk1 = new Stack<String>();
		Stack<String> stk2 = new Stack<String>();
		
//		System.out.println("START");
//		for(int a=0; a<rows; a++){
//			for(int b=0; b<cols; b++)
//					System.out.print(Matrix[a][b].value+", ");
//			System.out.println();
//		}
//		System.out.println("END");
		
		int i=rows-1, j=cols-1, finalIndexRow1=-1, finalIndexRow2=-1, finalIndexCol1=-1, finalIndexCol2=-1;
		double maxyRow=0, maxyCol=0;		
			
		for(int x=0;x<cols;x++)
			if(Matrix[rows-1][x].value>maxyRow){
				maxyRow=Matrix[rows-1][x].value;
				finalIndexRow1=rows-1;
				finalIndexRow2=x;
			}
		for(int x=0;x<rows;x++)
			if(Matrix[x][cols-1].value>maxyCol){
				maxyCol=Matrix[x][cols-1].value;
				finalIndexCol1=x;
				finalIndexCol2=cols-1;
			}
		
		i = rows-1; j = cols-1;
		if(maxyRow>=maxyCol) 
			while(finalIndexRow2 != j) {
				stk2.push(Matrix[0][j].seqChar+"");
				stk1.push("-");
				j--; 
			}
		
		else	
			while(finalIndexCol1 != i) {
				stk2.push("-");
				stk1.push(Matrix[i][0].seqChar+"");
				i--; 
			}
				
		
//		if(rows<cols) {
//			
//			for(int x=0;x<cols;x++)
//				if(Matrix[rows-1][x].value>maxy){
//					maxy=Matrix[rows-1][x].value;
//					finalIndex1=rows-1;
//					finalIndex2=x;
//				}
//			i = rows-1; j = cols-1;
//			while(finalIndex2 != j) {
//				stk2.push(Matrix[0][j].seqChar+"");
//				stk1.push("-");
//				j--; 
//			}
//		}
//		else if(rows>cols) {
//			
//			for(int x=0;x<rows;x++)
//				if(Matrix[x][cols-1].value>maxy){
//					maxy=Matrix[x][cols-1].value;
//					finalIndex1=x;
//					finalIndex2=cols-1;
//				}
//			i = rows-1; j = cols-1;
//			while(finalIndex1 != i) {
//				stk2.push("-");
//				stk1.push(Matrix[i][0].seqChar+"");
//				i--; 
//			}
//		}
//		else {
//			i = rows-1; j = cols-1;;
//		}
		
//		double maxValue=0;
//		//Find the maxValue and its indices.
//		for(i = rows-1; i > 0; i--)
//			for(j = cols-1; j > 0; j--)
//				if(Matrix[i][j].value > maxValue) {
//					maxValue = Matrix[i][j].value;
//					finalIndex1 = i;
//					finalIndex2 = j;
//				}
		
		//Based on maxValue and its indices, push respective seq character and/or - appropriately.
//		i = rows-1; j = cols-1;
//		while(finalIndex1 != i && finalIndex2 != j) {
//			
//			if(Matrix[i][j].trackback.equals("D")) {
//				stk2.push(Matrix[0][j].seqChar+"");
//				stk1.push(Matrix[i][0].seqChar+"");
//				i--; j--;
//			}
//			else if(Matrix[i][j].trackback.equals("T")) {
//				stk2.push("-");
//				stk1.push(Matrix[i][0].seqChar+"");
//				i--; 
//			}				
//			else {
//				stk2.push(Matrix[0][j].seqChar+"");
//				stk1.push("-");
//				j--; 
//			}	
//		}
		
		
		//Start tracing back from maxValue indices to origin.
				
		while(Matrix[i][j].trackback!="NULL") {
			
			if(Matrix[i][j].trackback.equals("D")) {
				stk2.push(Matrix[0][j].seqChar+"");
				stk1.push(Matrix[i][0].seqChar+"");
				i--; j--;
			}
			else if(Matrix[i][j].trackback.equals("T")) {
				stk2.push("-");
				stk1.push(Matrix[i][0].seqChar+"");
				i--; 
			}
			else {
				stk2.push(Matrix[0][j].seqChar+"");
				stk1.push("-");
				j--; 
			}
		}
					
		String s1="", s2="";
		while(!stk2.empty())
		{	String temp = stk2.pop(); s2=s2+temp; 	}
			
		while(!stk1.empty())
		{	String temp = stk1.pop(); s1=s1+temp; 	}
		
		FCS_DataStructure result;
		result = merge_FCS(Seq1, Seq2, s1, s2);
		result.maxValue = Matrix[rows-1][cols-1].value;
		
		return result;			
	}
	
	//====================================================================================================
	public FCS_DataStructure merge_FCS(FCS_DataStructure Seq1, FCS_DataStructure Seq2, String s1, String s2) {
		
		FCS_DataStructure result = new FCS_DataStructure();
		int p=0, q=0;
		//Resulted data structure has total number of sequences merged
		result.numOfSeq = Seq1.numOfSeq + Seq2.numOfSeq;
		for(int i=0; i<s1.length(); i++) {
			
			//No gap in the for both sequences at respective column
			if(s1.charAt(i) != '-' && s2.charAt(i) != '-' )	{ //&& s1.charAt(i) != '*'
				
				//Update FCS String
//				result.FCS = result.FCS+s1.charAt(i);
				
				if(s1.charAt(i) == s2.charAt(i))
					result.FCS = result.FCS+s1.charAt(i);
				else
					result.FCS = result.FCS+'*';
				
				//Create FCSRS and add it FCSDS
				FCS_RowStructure temp_FCSRS = new FCS_RowStructure();
				for(int j=0; j<20; j++) {
					
					//Add the AAM Count from both Seq1 and Seq2
					temp_FCSRS.AminoAcid[j].Count = Seq1.frs.get(p).AminoAcid[j].Count + Seq2.frs.get(q).AminoAcid[j].Count;
					//Add the sequence numbers from seq1 cell
					Iterator<Integer> iterator1 = Seq1.frs.get(p).AminoAcid[j].ListOfSequencesAtCell.iterator();
					while (iterator1.hasNext())
						temp_FCSRS.AminoAcid[j].ListOfSequencesAtCell.add(iterator1.next());
					//Add the sequence numbers from seq2 cell
					Iterator<Integer> iterator2 = Seq2.frs.get(q).AminoAcid[j].ListOfSequencesAtCell.iterator();
					while (iterator2.hasNext())
						temp_FCSRS.AminoAcid[j].ListOfSequencesAtCell.add(iterator2.next());					
					
				}
				result.frs.add(temp_FCSRS);	
				p++;
				q++;
			}
			//Gap in 1st sequence at respective column
			else if(s1.charAt(i) != s2.charAt(i)  &&  s1.charAt(i) == '-')	{ //&& s1.charAt(i) != '*'
				
				//Update FCS String
				result.FCS = result.FCS+'*';
				
				//Create FCSRS and add it FCSDS
				FCS_RowStructure temp_FCSRS = new FCS_RowStructure();
				for(int j=0; j<20; j++) {
					
					//Add the AAM Counts from Seq2
					temp_FCSRS.AminoAcid[j].Count = Seq2.frs.get(q).AminoAcid[j].Count;
					
					//Add the sequence numbers from seq2 cell
					Iterator<Integer> iterator2 = Seq2.frs.get(q).AminoAcid[j].ListOfSequencesAtCell.iterator();
					while (iterator2.hasNext())
						temp_FCSRS.AminoAcid[j].ListOfSequencesAtCell.add(iterator2.next());					
					
				}
				result.frs.add(temp_FCSRS);	
				q++;
			}
			//Gap in 2nd sequence at respective column
			else if(s1.charAt(i) != s2.charAt(i)  &&  s2.charAt(i) == '-')	{ //&& s1.charAt(i) != '*'
				
				//Update FCS String
				result.FCS = result.FCS+'*';
				
				//Create FCSRS and add it FCSDS
				FCS_RowStructure temp_FCSRS = new FCS_RowStructure();
				for(int j=0; j<20; j++) {
					
					//Add the AAM Count from both Seq1 and Seq2
					temp_FCSRS.AminoAcid[j].Count = Seq1.frs.get(p).AminoAcid[j].Count;
					//Add the sequence numbers from seq1 cell
					Iterator<Integer> iterator1 = Seq1.frs.get(p).AminoAcid[j].ListOfSequencesAtCell.iterator();
					while (iterator1.hasNext())
						temp_FCSRS.AminoAcid[j].ListOfSequencesAtCell.add(iterator1.next());					
				}
				result.frs.add(temp_FCSRS);	
				p++;
			}
			else
				System.out.println("Danger");
		}//end of for loop
		return result;
	}
	//====================================================================================================	`		
}
