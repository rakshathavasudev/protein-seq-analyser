import java.util.ArrayList;
import java.util.List;


public class BuildFCS_ForInputs {
	
	public ArrayList<FCS_DataStructure> BuildFCSForEachSequence(List<String> inputSeqs) {
		
		ArrayList<FCS_DataStructure> fcs_ds_List = new ArrayList<FCS_DataStructure>();
		Mapping m = new Mapping();
		for(int i=0; i<inputSeqs.size(); i++) {
			
			FCS_DataStructure fcs_ds = new FCS_DataStructure();
			fcs_ds.numOfSeq = 1;
			String seq = inputSeqs.get(i);
			
			for(int j=0; j<seq.length(); j++) {
				FCS_RowStructure fcs_rs = new FCS_RowStructure();
				char AAM = seq.charAt(j);
				int index = m.GetIndex(AAM);
				fcs_rs.AminoAcid[index].Count = fcs_rs.AminoAcid[index].Count + 1;
				fcs_rs.AminoAcid[index].ListOfSequencesAtCell.add(i);
				fcs_ds.frs.add(fcs_rs);
				fcs_ds.FCS = fcs_ds.FCS + AAM;
			}
			fcs_ds_List.add(fcs_ds);
		}
		m =null;
		return fcs_ds_List;
	}

}
