
public class FCS_RowStructure {
	
	FCS_CellStructure[] AminoAcid = new FCS_CellStructure[20]; 
	
	public FCS_RowStructure() {
		for(int i=0; i<20; i++) {
			FCS_CellStructure fcs_CS = new FCS_CellStructure();
			AminoAcid[i] = fcs_CS;
		}
	}
}
	
	

