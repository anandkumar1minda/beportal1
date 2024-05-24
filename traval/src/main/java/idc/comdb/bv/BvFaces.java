package idc.comdb.bv;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class BvFaces {
	
	public BvFaces(){} 
	
	Statement st;
	public BvFaces(Statement st) {
		this.st = st;
	}
	
	/*
	public ArrayList<BvMaster> getMasterList(Statement st, HashMap<String,String> hmap,String status){
		  
		ArrayList<BvMaster> arrList = new ArrayList<BvMaster>();
		try {
			
	     String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+" FROM "
	     		+ " "+BvCommon.TABLE_NAME+" order by "+BvCommon.NAME+" desc " ;     
	     arrList = new BvSearch(st, hmap).getMasterList(query,status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.comdb.changereason -> BvFaces -> "
			  		+ " ArrayList<BvMaster> getMasterList(Statement st, HashMap<String,String> hmap,String status) : "+ex.toString());	
	   }		
		return arrList;		
	 }
	*/
	
	public ArrayList<BvMaster> getMasterList(int BvId, HashMap<String,String> hmap,String status){
		  
		ArrayList<BvMaster> arrList = new ArrayList<BvMaster>();
		try {
			
	     String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+" FROM "
	     		+ " "+BvCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+BvId+"' order by "+BvCommon.NAME+" desc " ;     
	     arrList = new BvSearch(st, hmap).getMasterList(query,status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList(HashMap<String,String> hmap,String status) : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public ArrayList<BvMaster> getMasterList(int BvId){
		  
		ArrayList<BvMaster> arrList = new ArrayList<BvMaster>();
		try {
			
	     String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+" FROM "
	     		+ " "+BvCommon.TABLE_NAME+" WHERE"
	     		+ " "+BvCommon.ID+"='"+BvId+"' order by "+BvCommon.NAME+" desc " ;     
	     arrList = new BvSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList(HashMap<String,String> hmap,String status) : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public ArrayList<BvMaster> getMasterListAll(){
		  
		ArrayList<BvMaster>  arrList = new ArrayList<BvMaster>();
		try {
			
	     String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+" "
	     		+ " FROM "+BvCommon.TABLE_NAME+" order by "+BvCommon.NAME+" desc " ;
	     
	     arrList = new BvSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  "+this.getClass().getName()+".ArrayList<BvMaster> getMasterListAll() : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public ArrayList<BvMaster> getMasterListActive(){
		  
		ArrayList<BvMaster> arrList = new ArrayList<BvMaster>();
		try {
			
		 String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+""
			     	 + " FROM "+BvCommon.TABLE_NAME+" WHERE "+BvCommon.STATUS+"='Active'"
			     	 + " order by "+BvCommon.NAME+" desc " ;
	     
	     arrList = new BvSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterListActive() : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public HashMap<String,String> getBvMapAll(){
		  
		HashMap<String,String> deptAppMap = new HashMap<String,String>();
		try {
			
		String query = "SELECT "+BvCommon.ID+", "+BvCommon.NAME+", "+BvCommon.STATUS+" "
		     		+ " FROM "+BvCommon.TABLE_NAME+" order by "+BvCommon.NAME+" desc " ;
	     
	     new BvSearch(st,deptAppMap).setMasterMap(query);	     
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getBvMapAll: "+ex.toString());	
	   }		
		return deptAppMap;		
	}
	
	public HashMap<String,String> getBvMapActive(){
		  
		HashMap<String,String> deptAppMap = new HashMap<String,String>();
		try {
			
	     String query = "SELECT "+BvCommon.ID+" ,"+BvCommon.NAME+", "+BvCommon.STATUS+" "
			     	 + " FROM "+BvCommon.TABLE_NAME+" WHERE "+BvCommon.STATUS+"='Active' "
			     	 + " order by "+BvCommon.NAME+" desc ";
	     
	     new BvSearch(st,deptAppMap).setMasterMap(query);	    
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getBvMapActive(Statement st) : "+ex.toString());	
	   }
		
		 return deptAppMap;		
	 }
	
	public void setListMap(HashMap<String,String> hmap){
		
		   try {
			   
			String query = "SELECT "+BvCommon.ID+" , "+BvCommon.NAME+", "+BvCommon.STATUS+" "
					+ " FROM "+BvCommon.TABLE_NAME;	     
			new BvSearch(st, hmap).setMasterMap(query);
			   
			   }
		    catch(Exception ex){
			   System.out.println("Error in function "+this.getClass().getName()+".setListMap : "+ex.toString());	
			} 
		 }
}
