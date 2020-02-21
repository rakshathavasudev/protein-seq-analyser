import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class ReadTestInputFiles {	
	
	static List<String> key = new ArrayList<String>();
	
public List<String> ReadSequences(String fileName) {
		
		String  thisLine = null;
		BufferedReader br = null;
		List<String> inputSeqs = new ArrayList<String>();
		boolean valid = true;
		//key=null;
		
		try {
	        // Open input stream test.txt for reading purpose.
	    	br = new BufferedReader(new FileReader(fileName));
	    	int i=0;
	    	String validLastSeq = "";
	    	String validSeq = "";
	    	boolean pair = false;
	    	//Read all sequence and store in ArrayList	    	
	    	while ((thisLine = br.readLine()) != null) {
	    			    		    		
	    		if(thisLine.contains(">")) {
	    			
	    			key.add(thisLine.toString());
	    			if(i!=0)
	    				inputSeqs.add(validSeq);	
	    			i++;
	    			validSeq = "";
	    			validLastSeq = validSeq;
	    			pair = true;
	    			continue;
	    			
	    		}
	    		//Transform valid AAM 
	    		else {
	    			String temp="";
	    			//Convert to UpperCase
	    			temp = thisLine.toUpperCase();
	    			
	    			//Remove Spaces
	    			if(temp.contains(" "))
	    				temp = temp.replace(" ", "");
	    			if(temp.contains("."))
	    				temp = temp.replace(".", "-");	 
	    			if(temp.contains("-"))
	    				temp = temp.replace("-", "");
	    			if(temp.contains("\n"))
	    				temp = temp.replace("\n", "");
	    			
//	    			For Invalid Files
	    			if(temp.contains(" "))
	    				temp = temp.replace(" ", "");
	    			if(temp.contains("\n"))
	    				temp = temp.replace("\n", "");
	    			if(temp.contains("B"))
	    				temp = temp.replace("B", "L");
	    			if(temp.contains("J"))
	    				temp = temp.replace("J", "L");
	    			if(temp.contains("O"))
	    				temp = temp.replace("O", "L");
	    			if(temp.contains("U"))
	    				temp = temp.replace("U", "L");
	    			if(temp.contains("X"))
	    				temp = temp.replace("X", "L");
	    			if(temp.contains("Z"))
	    				temp = temp.replace("Z", "L");
	    			if(temp.contains("."))
	    				temp = temp.replace(".", "-");
	    			
	    			
	    			if(temp.contains("B")) {
	    				valid = false;
	    				break;
	    			}
	    			if(temp.contains("J")){
	    				valid = false;
	    				break;
	    			}
	    			if(temp.contains("O")){
	    				valid = false;
	    				break;
	    			}
	    			if(temp.contains("U")){
	    				valid = false;
	    				break;
	    			}
	    			if(temp.contains("X")){
	    				valid = false;
	    				break;
	    			}
	    			if(temp.contains("Z")){
	    				valid = false;
	    				break;
	    			}
	    			   			
	    			validSeq = validSeq+temp;   
	    			validLastSeq = validSeq;
	    			
	    		}	    		
	    	}
	    	if(validLastSeq != null)
    			inputSeqs.add(validLastSeq);
	    	
	    	if(!valid)
	    		inputSeqs = null;
	    		    	
	    }
	    catch (Exception e) {
			System.out.println("Error in Reading Input sequence data !!!"+e.getMessage());
			e.printStackTrace();
		}
		finally {
			try {
				 br.close();
			}
			catch (IOException e) {
				System.out.println("Error while closing Input sequence fileReader !!!");
				e.printStackTrace();
			}
		}
		return inputSeqs;
	}

}
