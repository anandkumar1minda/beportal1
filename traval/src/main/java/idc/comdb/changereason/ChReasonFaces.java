package idc.comdb.changereason;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.comdb.bv.BvCommon;

public class ChReasonFaces {
	
    public ChReasonFaces(){} 
	
	Statement st;
	public ChReasonFaces(Statement st) {
		this.st = st;
	}

	public ArrayList<ChReasonMaster> getMasterList(Statement st,int BvId, HashMap<String,String> hmap,String Status){
		  
		ArrayList<ChReasonMaster> arrList = new ArrayList<ChReasonMaster>();
		try {		
	     String query = "SELECT "+ChReasonCommon.ID+" ,"+ChReasonCommon.NAME+","
	     		+ " "+ChReasonCommon.DESC+", "+ChReasonCommon.STATUS+""
	     		+ " FROM "+ChReasonCommon.TABLE_NAME+" where "+BvCommon.ID+"='"+BvId+"' "
	     		+ " order by "+ChReasonCommon.ID+" asc ";     
	     arrList = new ChReasonSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	    }		
		return arrList;		
	 }
	
	public ArrayList<ChReasonMaster> getActiveMasterList(int BvId){
		  
		ArrayList<ChReasonMaster> arrList = new ArrayList<ChReasonMaster>();
		try {		
	     String query = "SELECT "+ChReasonCommon.ID+" ,"+ChReasonCommon.NAME+","
	     		+ " "+ChReasonCommon.DESC+", "+ChReasonCommon.STATUS+""
	     		+ " FROM "+ChReasonCommon.TABLE_NAME+" where "+BvCommon.ID+"='"+BvId+"' "
	     		+ " AND "+ChReasonCommon.STATUS+"='Active' "
	     		+ " order by "+ChReasonCommon.ID+" asc ";
	     
	     arrList = new ChReasonSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	    }		
		return arrList;		
	 }
	
	
	public void setListMap(Statement st, HashMap<String,String> hmap){
		
		try {
		
		 String query = "SELECT "+ChReasonCommon.ID+" ,"+ChReasonCommon.NAME+", "+ChReasonCommon.DESC+","
		 		+ " "+ChReasonCommon.STATUS+" FROM "+ChReasonCommon.TABLE_NAME+""
		 		+ " order by "+ChReasonCommon.ID+" asc ";	     
	     new ChReasonSearch(st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	    }		
	 }
	
	public HashMap<String,String> getMapAll(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
			String query = "SELECT "+ChReasonCommon.ID+" ,"+ChReasonCommon.NAME+", "+ChReasonCommon.DESC+","
			 		+ " "+ChReasonCommon.STATUS+" FROM "+ChReasonCommon.TABLE_NAME+""
			 		+ " order by "+ChReasonCommon.ID+" asc ";
			
		     new ChReasonSearch(this.st,hMap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getMapAll: "+ex.toString());	
	     }		
		return hMap;		
	 }
	
 }


