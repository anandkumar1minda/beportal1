package idc.comdb.phase;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.comdb.bv.BvCommon;

public class PhaseFaces {
	
	Statement st;
	public PhaseFaces() {}
	public PhaseFaces(Statement st) {
		this.st = st;
	}

	public ArrayList<PhaseMaster> getMasterList(Statement st,int BvId, HashMap<String,String> hmap,String Status){
		  
		 ArrayList<PhaseMaster> arrList = new ArrayList<PhaseMaster>();
		try {		
	     
		 String query = "SELECT "+PhaseCommon.ID+" ,"+PhaseCommon.NAME+", "+PhaseCommon.DESC+","
		 		+ " "+PhaseCommon.STATUS+" FROM "+PhaseCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+BvId+"'";	     
	     arrList = new PhaseSearch(st, hmap).getMasterList(query,Status);
	     
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+" ArrayList<PhaseMaster> getMasterList : "+ex.toString());	
	   }		
		return arrList;		
	 }

	
	public ArrayList<PhaseMaster> getActiveMasterList(int BvId){
		  
		 ArrayList<PhaseMaster> arrList = new ArrayList<PhaseMaster>();
		try {		
	     
		 String query = "SELECT "+PhaseCommon.ID+" ,"+PhaseCommon.NAME+", "+PhaseCommon.DESC+", "
		 		+ " "+PhaseCommon.STATUS+" FROM "+PhaseCommon.TABLE_NAME+" "
		 		+ " WHERE "+BvCommon.ID+"='"+BvId+"' AND "+PhaseCommon.STATUS+"='Active' ";	     
	     arrList = new PhaseSearch(st).getMasterList(query);
	     
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	   }		
		
		return arrList;
		
	 }

	
	public void setListMap(Statement st, HashMap<String,String> hmap){
		
		try {		
	     String query = "SELECT "+PhaseCommon.ID+" ,"+PhaseCommon.NAME+", "+PhaseCommon.DESC+","
	     		+ " "+PhaseCommon.STATUS+" FROM "+PhaseCommon.TABLE_NAME;	     
	     new PhaseSearch(st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	   }
		
	 }
	
	public HashMap<String,String> getMapAll(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
			String query = "SELECT "+PhaseCommon.ID+" ,"+PhaseCommon.NAME+", "+PhaseCommon.DESC+","
					+ " "+PhaseCommon.STATUS+" FROM "+PhaseCommon.TABLE_NAME ;	     
		     new PhaseSearch(st, hMap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getMapAll: "+ex.toString());	
	   }		
		return hMap;		
	}
	
	
}
