import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.File;
 

public class ReadMutationMatrix {
	
	private static final String COMMA_DELIMITER = ",";
	public static int[][] PAM250 = new int[20][20];
	public static int[][] BLOSUM62 = new int[20][20];
	public static char[] AAMPAM250 = new char[20];
	public static char[] AAMBLOSUM62 = new char[20];
	
	
	public int GetPAMScore(char left, char right) {
		
		int i=0, j=0;
		
		for(int k=0; k<20; k++)
			if(left == AAMPAM250[k])
				i = k;
		
		for(int k=0; k<20; k++)
			if(right == AAMPAM250[k])
				j = k;
				
		return PAM250[i][j];
	}
	
	public int GetBLOSUMScore(char left, char right) {
		
		int i=0, j=0;
		
		for(int k=0; k<20; k++)
			if(left == AAMBLOSUM62[k])
				i = k;
		
		for(int k=0; k<20; k++)
			if(right == AAMBLOSUM62[k])
				j = k;
				
		return BLOSUM62[i][j];
	}
	
	public void readPAM250(String fileName) {
			
		BufferedReader fileReader = null;
		
		try {
			
			String line = "";
			fileReader = new BufferedReader(new FileReader(fileName));
			
			//Read the CSV file header and assign to Amino Acid Mapping AAM array
			if((line = fileReader.readLine()) != null) {
				String[] tokens = line.split(COMMA_DELIMITER);
				if (tokens.length > 0) {
					for(int i=1; i<tokens.length; i++)
						AAMPAM250[i-1] = tokens[i].charAt(0);
				}
			}
			
			//Read the file line by line starting from the second line
			int i=0;
			while ((line = fileReader.readLine()) != null) {				
                //Get all tokens available in line
				String[] tokens = line.split(COMMA_DELIMITER);
				if (tokens.length > 0) {
					for(int j=0, k=1; k<tokens.length; j++, k++)
						PAM250[i][j] = Integer.parseInt(tokens[k]);
				}
				i++;
			}
		}
		catch (Exception e) {
			System.out.println("Error in Loading PAM250 Matrix data !!!");
			e.printStackTrace();
		}
		finally {
			try {
				 fileReader.close();
			}
			catch (IOException e) {
				System.out.println("Error while closing PAM250 fileReader !!!");
				e.printStackTrace();
			}
		}
		
	}
	
	public void readBLOSUM62(String fileName) {
		
		BufferedReader fileReader = null;
		
		try {
			
			String line = "";
			fileReader = new BufferedReader(new FileReader(fileName));
			
			//Read the CSV file header and assign to Amino Acid Mapping AAM array
			if((line = fileReader.readLine()) != null) {
				String[] tokens = line.split(COMMA_DELIMITER);
				if (tokens.length > 0) {
					for(int i=1; i<tokens.length; i++)
						AAMBLOSUM62[i-1] = tokens[i].charAt(0);
				}
			}
			
			//Read the file line by line starting from the second line
			int i=0;
			while ((line = fileReader.readLine()) != null) {
                //Get all tokens available in line
				String[] tokens = line.split(COMMA_DELIMITER);
				if (tokens.length > 0) {
					for(int j=0, k=1; k<tokens.length; j++, k++)
						BLOSUM62[i][j] = Integer.parseInt(tokens[k]);
				}
				i++;
			}
		}
		catch (Exception e) {
			System.out.println("Error in Loading BLOSUM62 Matrix data !!!");
			e.printStackTrace();
		}
		finally {
			try {
				 fileReader.close();
			}
			catch (IOException e) {
				System.out.println("Error while closing BLOSUM62 fileReader !!!");
				e.printStackTrace();
			}
		}
		
	}

	public boolean moveFileToDirectory(File sourceFile, String targetPath) {
    		File tDir = new File(targetPath);
    		if (tDir.exists()) {
        		String newFilePath = targetPath+File.separator+sourceFile.getName();
        		File movedFile = new File(newFilePath);
        		if (movedFile.exists())
            			movedFile.delete();
        		return sourceFile.renameTo(new File(newFilePath));
    		} 
		else {
        		//LOG.warn("unable to move file "+sourceFile.getName()+" to directory "+targetPath+" -> target directory does not exist");
        		return false;
    		}       
	}
}
