import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;


public class WriteOutput {
	
	BufferedWriter bw = null;
	public void WriteAlignment(String fName, String Data) {
		
				
	    try {
	    		    	
			File fileName = new File(fName);

			// if file doesn't exists, then create it
			if (!fileName.exists()) {
				fileName.createNewFile();
			}

			FileWriter fw = new FileWriter(fileName,true);
			bw = new BufferedWriter(fw);
			bw.write(Data);
			bw.flush();          	
	    }
	    catch (Exception e) {
			System.out.println("Error in Writing data !!!");
			e.printStackTrace();
		}
		finally {
			try {
				bw.close();	
			}
			catch (IOException e) {
				System.out.println("Error while closing Writing data fileWriter !!!");
				e.printStackTrace();
			}
		}
	}
}
