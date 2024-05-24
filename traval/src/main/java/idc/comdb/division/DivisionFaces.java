package idc.comdb.division;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DivisionFaces {
	
	 public ArrayList<DivisionMaster> getMasterList(Statement st, HashMap<String,String> hmap,String Status){
		  
		ArrayList<DivisionMaster> arrList = new ArrayList<DivisionMaster>();
		try {		
	     String query = "SELECT "+DivisionCommon.ID+" ,"+DivisionCommon.NAME+" , "+DivisionCommon.STATUS+" FROM "+DivisionCommon.TABLE_NAME;	     
	     arrList = new DivisionSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.comdb.division -> DivisionFaces -> "
			  		+ " ArrayList<DivisionMaster> getMasterList : "+ex.toString());	
	   }		
		return arrList;		
    }
	 
	public void setListMap(Statement st, HashMap<String,String> hmap){
			
	   try {
		   
		String query = "SELECT "+DivisionCommon.ID+" ,"+DivisionCommon.NAME+", "+DivisionCommon.STATUS+" FROM "+DivisionCommon.TABLE_NAME;	     
		new DivisionSearch(st, hmap).setMasterMap(query);
		   
		   }
	    catch(Exception ex){
				  System.out.println("Error in function  idc.comdb.changereason -> ChReasonFaces -> "
				  		+ " void setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
		} 
	 }
	
  }


