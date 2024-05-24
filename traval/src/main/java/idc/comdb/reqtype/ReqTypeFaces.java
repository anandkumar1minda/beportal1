package idc.comdb.reqtype;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.comdb.bv.BvCommon;

public class ReqTypeFaces {
	
	Statement st;
	
	public ReqTypeFaces() {}
	
	public ReqTypeFaces(Statement st) {
		this.st = st;
	}

	public ArrayList<ReqTypeMaster> getMasterList(Statement st, int BvId, HashMap<String,String> hmap, String Status){
		  
		 ArrayList<ReqTypeMaster> arrList = new ArrayList<ReqTypeMaster>();
		try {
			
	     String query = "SELECT "+ReqTypeCommon.ID+" , "+ReqTypeCommon.NAME+", "+ReqTypeCommon.DESC+", "
	     		+ " "+ReqTypeCommon.STATUS+" FROM "+ReqTypeCommon.TABLE_NAME+" "
	     		+ " WHERE "+BvCommon.ID+"='"+BvId+"' ";	     
	          arrList = new ReqTypeSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	   }
		
		return arrList;
	}
	
	public ArrayList<ReqTypeMaster> getActiveMasterList(int BvId){
		  
		 ArrayList<ReqTypeMaster> arrList = new ArrayList<ReqTypeMaster>();
		try {
			
	     String query = "SELECT "+ReqTypeCommon.ID+" , "+ReqTypeCommon.NAME+", "+ReqTypeCommon.DESC+", "
	     		+ " "+ReqTypeCommon.STATUS+" FROM "+ReqTypeCommon.TABLE_NAME+" "
	     		+ " WHERE "+ReqTypeCommon.STATUS+"='Active' AND "+BvCommon.ID+"='"+BvId+"' ";
	     
	          arrList = new ReqTypeSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	    }		
		
		return arrList;
		
	}
	
	public void setListMap(Statement st, HashMap<String,String> hmap){
		
		try {		
	     String query = "SELECT "+ReqTypeCommon.ID+" ,"+ReqTypeCommon.NAME+", "+ReqTypeCommon.DESC+","
	     		+ " "+ReqTypeCommon.STATUS+" FROM "+ReqTypeCommon.TABLE_NAME;	     
	     new ReqTypeSearch(st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, "
			  		+ " HashMap<String,String> hmap) : "+ex.toString());	
	   }		
    }
	
	public HashMap<String,String> getMapAll(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
			String query = "SELECT "+ReqTypeCommon.ID+" ,"+ReqTypeCommon.NAME+","
					+ " "+ReqTypeCommon.DESC+", "+ReqTypeCommon.STATUS+""
					+ " FROM "+ReqTypeCommon.TABLE_NAME;
			
		     new ReqTypeSearch(this.st, hMap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getMapAll: "+ex.toString());	
	   }		
		return hMap;		
	 }
	
 }


