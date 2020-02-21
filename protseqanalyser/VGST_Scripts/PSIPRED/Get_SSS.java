import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Get_SSS {
	
		public static void main(String[] args) {
		 
			
		 	String file = "/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/"+args[0]+".horiz";		 	
		 	File fileInputName = new File(file);
		 	
		 	String fileOutput = "/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/psipred/"+args[0]+".sss";
			File fileOutputName = new File(fileOutput);
			
		 	String Str_Sequence = "";
			String Str_Confidence = "A";
		 	BufferedReader fileReader = null;
		 	BufferedWriter bw = null;
		 	
		    try {
		    	String line = "";
				fileReader = new BufferedReader(new FileReader(fileInputName));
				while((line = fileReader.readLine()) != null){ 
					
					String [] Data = line.split(":");					
					if(Data[0].toString().equalsIgnoreCase("Conf"))
						Str_Confidence = Str_Confidence+Data[1].toString();
					else if(Data[0].toString().equalsIgnoreCase("Pred"))
						Str_Sequence = Str_Sequence+Data[1].toString();
					else;
				}
				Str_Confidence = Str_Confidence.replaceAll(" ", "");
				Str_Sequence = Str_Sequence.replaceAll(" ", "");
				
				if (fileOutputName.exists()){
					fileOutputName.delete();
					fileOutputName.createNewFile();
				 }
				else
					fileOutputName.createNewFile();			
				
				FileWriter fw = new FileWriter(fileOutputName,false);
				bw = new BufferedWriter(fw);
				bw.write(Str_Sequence);
				bw.flush();
				
		    }
		    catch (Exception e) {
				System.out.println("Error in Loading "+file+"data file!!!");
				e.printStackTrace();
			}
			finally {
				try {
					 fileReader.close();
				}
				catch (IOException e) {
					System.out.println("Error while closing data fileReader !!!");
					e.printStackTrace();
				}
			}		 	
	 }
}
