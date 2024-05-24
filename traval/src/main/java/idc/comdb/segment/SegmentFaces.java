package idc.comdb.segment;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SegmentFaces {	
	
	public ArrayList<SegmentMaster> getMasterList(Statement st, HashMap<String,String> hmap,String status){
		  
		 ArrayList<SegmentMaster> arrList = new ArrayList<SegmentMaster>();
		try {		
			String query = "SELECT "+SegCommon.ID+" ,"+SegCommon.NAME+" , "+SegCommon.STATUS+" FROM "+SegCommon.TABLE_NAME;			
			arrList = new SegmentSearch(st, hmap).getMasterList(query,status);
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.comdb.segment -> SegmentFaces -> "
			  		+ " ArrayList<SegmentMaster> getMasterList( : "+ex.toString());	
	   }		
		return arrList;		
	}
	
   public void setListMap(Statement st, HashMap<String,String> hmap){
		
		try {		
	     String query = "SELECT "+SegCommon.ID+" ,"+SegCommon.NAME+", "+SegCommon.STATUS+" FROM "+SegCommon.TABLE_NAME;	     
	     new SegmentSearch(st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.comdb.segment -> SegmentFaces -> "
			  		+ " void setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	      }		
	  }	
 }

