import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;


public class NJ_Progressive_Approach {
	
	//-------------------------Neighbor Joining------------------------------------
	public FCS_DataStructure NJ(ArrayList<FCS_DataStructure> fcs_ds_List, ReadMutationMatrix mm) {
		
		LocalAlignment LA = new LocalAlignment();
			
		while(fcs_ds_List.size()>1) {
			int seqIndex1 =-1, seqIndex2=-1;
			double bestDistance = Double.MIN_VALUE;
			FCS_DataStructure best_NeighbourSequence = new FCS_DataStructure();
			for(int l=0; l<fcs_ds_List.size(); l++) {
				for(int m=l+1; m<fcs_ds_List.size(); m++) {
					
					//-----------Call Global Alignment-------------
					FCS_DataStructure tempResult_NeighbourSequence = new FCS_DataStructure();						
					tempResult_NeighbourSequence = LA.ApplyLocalAlignment(fcs_ds_List.get(l), fcs_ds_List.get(m), mm);
					//Check is this temp_NeighbourSequence is Best Neighbor sequence or not
					if(tempResult_NeighbourSequence.maxValue > bestDistance) {
						bestDistance = tempResult_NeighbourSequence.maxValue;
						best_NeighbourSequence = tempResult_NeighbourSequence;
						seqIndex1 = l;
						seqIndex2 = m;
					}
				}//end of inner for loop
			}// end of outer for loop
			//Remove the best pair and add the merged FCS
			fcs_ds_List.remove(seqIndex2);
			fcs_ds_List.remove(seqIndex1);
			fcs_ds_List.add(best_NeighbourSequence);
		}//end of while loop	
	//------------------------------------------------------------------
	
	return fcs_ds_List.get(0);
	}
	
	//-------------------------Immediate Joining------------------------------------
	public FCS_DataStructure ImmediateJoin(ArrayList<FCS_DataStructure> fcs_ds_List, ReadMutationMatrix mm) {
			
			LocalAlignment LA = new LocalAlignment();
				
			while(fcs_ds_List.size()>1) {
				
				FCS_DataStructure tempResult_NeighbourSequence = new FCS_DataStructure();						
				tempResult_NeighbourSequence = LA.ApplyLocalAlignment(fcs_ds_List.get(0), fcs_ds_List.get(1), mm);
				fcs_ds_List.remove(1);
				fcs_ds_List.remove(0);
				fcs_ds_List.add(tempResult_NeighbourSequence);
			}//end of while loop	
		//------------------------------------------------------------------
		
		return fcs_ds_List.get(0);
	}
	//-------------------------Maximum Spanning Tree Joining------------------------------------
	
	//Calculate Distance
	public double CalDistance(String FCS){
		double distance = 0.0;
		int length = FCS.length();
		
		for(int i=0; i< length; i++)
			if(FCS.charAt(i) == '*')
				distance++;
		
		return (distance);
	}
	
	public static <K, V extends Comparable<V>> Map<K, V> 
	    sortByValues(final Map<K, V> map) {
	    Comparator<K> valueComparator = 
	             new Comparator<K>() {
	    	@Override 
	    	public int compare(K k1, K k2) {
	    		int compare = map.get(k1).compareTo(map.get(k2));
	    		return compare != 0 ? compare : 1;
	      }
	    };
	 
	    Map<K, V> sortedByValues = 
	      new TreeMap<K, V>(valueComparator);
	    sortedByValues.putAll(map);
	    return sortedByValues;
	}
	
	public FCS_DataStructure EffectivepanningTreeJoin(ArrayList<FCS_DataStructure> fcs_ds_List, ReadMutationMatrix mm) {
		
		LocalAlignment LA = new LocalAlignment();
		//System.out.println("Control at EffectivepanningTreeJoin");
		Map<String, Double> KeyValuePair = new HashMap<String, Double>();
		TreeMap<String, FCS_DataStructure> result = new TreeMap<String, FCS_DataStructure>();
		
		ArrayList<String> KeyToIndex = new ArrayList<String>();
		int [] IndexValue = new int [fcs_ds_List.size()];
		
		//-1 indicates objects are from Initial DS and other values are from KeyToIndex 
		for(int x=0; x<fcs_ds_List.size(); x++) {
			IndexValue[x] = -1;
		}
		
		
		for(int l=0; l<fcs_ds_List.size(); l++) {
			for(int m=l+1; m<fcs_ds_List.size(); m++) {
				Double value = CalDistance(LA.ApplyLocalAlignment(fcs_ds_List.get(l), fcs_ds_List.get(m), mm).FCS);
//				JoiningTree.put("("+l+"-"+m+")", value);
				KeyValuePair.put(l+"-"+m, value);
			}
		}
		
		Map sortedMap = sortByValues(KeyValuePair);
		Set set = sortedMap.entrySet();
		Iterator i = set.iterator();
		int  KIindex =0;
		String Final_Tree="";
		
		while(i.hasNext()) {
		      Map.Entry me = (Map.Entry)i.next();
		      String key = me.getKey().toString();
		      String[] temp = key.split("-");
		      int left = Integer.parseInt(temp[0]);
		      int right = Integer.parseInt(temp[1]);
		      
		      FCS_DataStructure tempResult_NeighbourSequence = new FCS_DataStructure();	
		      
		      if(IndexValue[left] == -1 && IndexValue[right] == -1) {
		    	  FCS_DataStructure FCS_DataStructure_left = fcs_ds_List.get(left);
		    	  FCS_DataStructure FCS_DataStructure_right = fcs_ds_List.get(right);
		    	  tempResult_NeighbourSequence = LA.ApplyLocalAlignment(FCS_DataStructure_left, FCS_DataStructure_right, mm);
		    	  
		    	  fcs_ds_List.remove(left); fcs_ds_List.add(left, null);
			      fcs_ds_List.remove(right); fcs_ds_List.add(right, null);
			      
			      String TreeKey = "("+left+"-"+right+")";
			      Final_Tree = TreeKey;
			      result.put(TreeKey, tempResult_NeighbourSequence);			      
			      KeyToIndex.add(KIindex, TreeKey);			      
			      IndexValue[left] = KIindex;
			      IndexValue[right] = KIindex;
			      KIindex++;		    	  
		      }
		      
		      else if(IndexValue[left] == -1 && IndexValue[right] != -1) {
		    	  FCS_DataStructure FCS_DataStructure_left = fcs_ds_List.get(left);
		    	  int indval = IndexValue[right];
		    	  String rightKey = KeyToIndex.get(indval);		    	  
		    	  FCS_DataStructure FCS_DataStructure_right = result.get(rightKey);		    	  
		    	  result.remove(rightKey);
		    	  
		    	  tempResult_NeighbourSequence = LA.ApplyLocalAlignment(FCS_DataStructure_left, FCS_DataStructure_right, mm);
		    	  
		    	  fcs_ds_List.remove(left); fcs_ds_List.add(left, null);
		    	  
		    	  String TreeKey = "("+left+"-"+rightKey+")";
		    	  Final_Tree = TreeKey;
		    	  result.put(TreeKey, tempResult_NeighbourSequence);
			      KeyToIndex.add(KIindex, TreeKey);
			      
			      IndexValue[left] = KIindex;
			      
			      //RightKey Value might be nested so updating all values
			      String trk = rightKey.replaceAll("\\(", "");
			      trk = trk.replaceAll("\\)", "");
			      String [] trka = trk.split("-");
			      for(int t=0;t<trka.length; t++)
			    	  IndexValue[Integer.parseInt(trka[t])] = KIindex;
			      
			      KIindex++;		    	  
		      }		      
		      
		      else if(IndexValue[left] != -1 && IndexValue[right] == -1) {
		    	  
		    	  int indval = IndexValue[left];
		    	  String leftKey = KeyToIndex.get(indval);		    	  
		    	  FCS_DataStructure FCS_DataStructure_left = result.get(leftKey);		    	  
		    	  result.remove(leftKey);
		    	  FCS_DataStructure FCS_DataStructure_right = fcs_ds_List.get(right);
		    	  
		    	  tempResult_NeighbourSequence = LA.ApplyLocalAlignment(FCS_DataStructure_left, FCS_DataStructure_right, mm);
		    	  fcs_ds_List.remove(left); fcs_ds_List.add(left, null);
		    	  
		    	  String TreeKey = "("+leftKey+"-"+right+")";
		    	  Final_Tree = TreeKey;
		    	  result.put(TreeKey, tempResult_NeighbourSequence);
			      KeyToIndex.add(KIindex, TreeKey);
			      
			    //LeftKey Value might be nested so updating all values
			      String tlk = leftKey.replaceAll("\\(", "");
			      tlk = tlk.replaceAll("\\)", "");
			      String [] tlka = tlk.split("-");
			      for(int t=0;t<tlka.length; t++)
			    	  IndexValue[Integer.parseInt(tlka[t])] = KIindex;
			      
			      IndexValue[right] = KIindex;
			      KIindex++;		    	  
		      }
		      else if(IndexValue[left] != -1 && IndexValue[right] != -1) {
		    	  
		    	  if(IndexValue[left] == IndexValue[right])
		    		  continue;
		    	  
		    	  int indval = IndexValue[left];
		    	  String leftKey = KeyToIndex.get(indval);		    	  
		    	  FCS_DataStructure FCS_DataStructure_left = result.get(leftKey);		    	  
		    	  result.remove(leftKey);
		    	  int indvalr = IndexValue[right];
		    	  String rightKey = KeyToIndex.get(indvalr);		    	  
		    	  FCS_DataStructure FCS_DataStructure_right = result.get(rightKey);		    	  
		    	  result.remove(rightKey);
		    	  
		    	  tempResult_NeighbourSequence = LA.ApplyLocalAlignment(FCS_DataStructure_left, FCS_DataStructure_right, mm);
		    	  String TreeKey = "("+leftKey+"-"+rightKey+")";
		    	  Final_Tree = TreeKey;
		    	  result.put(TreeKey, tempResult_NeighbourSequence);
			      KeyToIndex.add(KIindex, TreeKey);

			    //LeftKey Value might be nested so updating all values
			      String tlk = leftKey.replaceAll("\\(", "");
			      tlk = tlk.replaceAll("\\)", "");
			      String [] tlka = tlk.split("-");
			      for(int t=0;t<tlka.length; t++)
			    	  IndexValue[Integer.parseInt(tlka[t])] = KIindex;

			    //RightKey Value might be nested so updating all values
			      String trk = rightKey.replaceAll("\\(", "");
			      trk = trk.replaceAll("\\)", "");
			      String [] trka = trk.split("-");
			      for(int t=0;t<trka.length; t++)
			    	  IndexValue[Integer.parseInt(trka[t])] = KIindex;
			      
			      KIindex++;		    	  
		      }
		      else
		    	  System.out.println("OFSD");	   
		      
		    
//		      System.out.println(Final_Tree);
		    }
	//------------------------------------------------------------------	
	return result.get(Final_Tree);
	}
	

}
