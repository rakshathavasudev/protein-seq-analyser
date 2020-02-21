//======================================================================
/* Author: 		Sanjay Bankapur
 * Created: 	Nov 2016
 * Description:   
 * 1) 			Reads N # of amino acid string from file for MSA
 * 2) 			Builds FuzzyConsensusSequences Data Structure for all the given input sequences
 * 3)			Follow Progressive Alignment using UPGMA method
 * 4)			Using Pairwise Global Alignment overall FCS is been built  
 * 5) 			PAM250 for mismatch/match score and for gap =-1 (as of now to check the output) 
 * */
//======================================================================
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.io.File;

public class Main {
	
	public static long timeSecond = 0;

	public static void main(String[] args) {

		//----------------------Declare File/Folder Variables------------------------

		String inputFilePath = "../Input/";
		String fileName = args[0];
		String fileNameInput = inputFilePath + fileName;
		
		System.out.print(fileName+": ");
		
		String filePAM = "../MutationMatrix/PAM250";
//		String fileBLOSUM = "../MutationMatrix/BLOSUM45";
//		String fileBLOSUM = "../MutationMatrix/BLOSUM45_Normalised";
		String fileBLOSUM = "../MutationMatrix/BLOSUM62_Normalised";
//		String fileBLOSUM = "../MutationMatrix/BLOSUM62";
//		String fileBLOSUM = "../MutationMatrix/GONNET";
//		String fileBLOSUM = "../MutationMatrix/GONNET_Normalised";
		
		//-----------------Read Mutation Matrix information-------------	
		ReadMutationMatrix mm = new ReadMutationMatrix(); 
		mm.readBLOSUM62(fileBLOSUM);				
		
		//-----------------Output Path Details & Creation-------------
		String outputFilePathName = "../Output/"+fileName;

		//----------------------Read input sequences------------------------
		List<String> inputSeqs;	
		ReadTestInputFiles TestSequences = new ReadTestInputFiles();
		
		inputSeqs = TestSequences.ReadSequences(fileNameInput);
		//------------------------------------------------------------------
		//Valid Amino Acid Data
		if(inputSeqs==null) {
			while(TestSequences.key.size()>0)
				TestSequences.key.remove(0);
			TestSequences = null;
			System.out.println("------------\nInvalid File: "+fileName+"\n------------");
		}								
		//------------Build FCS DS for each input sequences-----------------
		ArrayList<FCS_DataStructure> fcs_ds_List;
		BuildFCS_ForInputs buildIputFCSDS = new BuildFCS_ForInputs();			
		fcs_ds_List = buildIputFCSDS.BuildFCSForEachSequence(inputSeqs);
		buildIputFCSDS=null;
		
		//------------Call Progressive Alignment using NJ/UPGMA Approach----------	
		
		
		
//				Build_GuideTree BGT= new Build_GuideTree();
//				long startSec = System.currentTimeMillis();
//				final_FCSDS = BGT.CalAllPairwiseSimilarity(fcs_ds_List, mm);
//				long endSec = System.currentTimeMillis();
//				BGT=null;

		FCS_DataStructure final_FCSDS;
		NJ_Progressive_Approach paNJ = new NJ_Progressive_Approach();				
		long startSec = System.currentTimeMillis();
//		final_FCSDS = paNJ.ImmediateJoin(fcs_ds_List, mm);
		final_FCSDS = paNJ.EffectivepanningTreeJoin(fcs_ds_List, mm);
		long endSec = System.currentTimeMillis();
		paNJ=null;
		
		timeSecond += (endSec-startSec);
		System.out.println("Time-Mili-Sec="+(endSec-startSec));

		int numofSeq = inputSeqs.size();
		int seqLength = final_FCSDS.FCS.length();
		char [][] result = new char[numofSeq][seqLength];
		WriteOutput writeOutput = new WriteOutput();
		Display_PMSA_Result prepareResult = new Display_PMSA_Result();

		result = prepareResult.PrintResults(TestSequences, numofSeq, seqLength, result, final_FCSDS, writeOutput, outputFilePathName);

		
		fcs_ds_List.clear();

		System.out.println("TotalTimeSec="+(timeSecond/1000));

		File sFile = new File(fileNameInput);

		mm.moveFileToDirectory(sFile, "../Archived");
	
	}
}
