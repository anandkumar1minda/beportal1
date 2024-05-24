package idc.location.city;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.common.AppDbCommon;

public class CityFaces {
	
    Statement st;
	
	public CityFaces(Statement st){
		this.st = st;
	}
	
	public CityMaster getMasterById(int id){
		  
		   CityMaster master = new CityMaster();
		   
		try {
			
	     String query = "SELECT "+CityCommon.QUERY_PARAM+" FROM "
	     		+ " "+AppDbCommon.DB+"."+CityCommon.TABLE_NAME_SEARCH+" "
	     		+ " WHERE "+CityCommon.ID+"='"+id+"'";
	     
	     master = new CitySearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterById(String id) : "+ex.toString());	
	   }		
		return master;		
	}
	
	public CityMaster getMasterByName(String AppName){
		  
		   CityMaster master = new CityMaster();
		   
		try {
			
		String query = "SELECT "+CityCommon.QUERY_PARAM+" FROM "
			    + " "+AppDbCommon.DB+"."+CityCommon.TABLE_NAME_SEARCH+" "
	     		+ " WHERE "+CityCommon.NAME+"='"+AppName+"' ";
	     
	     master = new CitySearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterByName(String name) : "+ex.toString());	
	   }		
		return master;		
	}
	
	public ArrayList<CityMaster> getAllMasterList(){
		  
		ArrayList<CityMaster> arrList = new ArrayList<CityMaster>();
		try {
			
			String query = "SELECT "+CityCommon.QUERY_PARAM+" FROM "
		     	 + " "+AppDbCommon.DB+"."+CityCommon.TABLE_NAME_SEARCH+" ";
	     
	        arrList = new CitySearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll() : "+ex.toString());	
	   }		
		return arrList;		
	}
	
	
	public ArrayList<CityMaster> getActiveMasterList(){
		  
		ArrayList<CityMaster> arrList = new ArrayList<CityMaster>();
		try {
			
			String query = "SELECT "+CityCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+CityCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+CityCommon.STATUS+"='Active' ";
	     
	             arrList = new CitySearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getActiveMasterList() : "+ex.toString());	
	   }		
		return arrList;		
	}
	
	public HashMap<String,String> getAllMasterMap(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try{
			
			String query = "SELECT "+CityCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+CityCommon.TABLE_NAME_SEARCH+" ";
	     
	                hMap = new CitySearch(st).getMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			System.out.println(" Error in function "+this.getClass().getName()+".getAllMasterMap() : "+ex.toString());	
	     }
		
		return hMap;
		
	  }	
	
  }



