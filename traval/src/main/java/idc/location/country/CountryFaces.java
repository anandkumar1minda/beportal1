package idc.location.country;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.common.AppDbCommon;

public class CountryFaces {
	
    Statement st;
	
	public CountryFaces(Statement st){
		this.st = st;
	}
	
	public CountryMaster getMasterById(int id){
		  
		   CountryMaster master = new CountryMaster();
		   
		try {
			
	     String query = "SELECT "+CountryCommon.QUERY_PARAM+" FROM "
	     		+ " "+AppDbCommon.DB+"."+CountryCommon.TABLE_NAME_SEARCH+" "
	     		+ " WHERE "+CountryCommon.ID+"='"+id+"'";
	     
	     master = new CountrySearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterById(String id) : "+ex.toString());	
	   }		
		return master;		
	}
	
	public CountryMaster getMasterByName(String AppName){
		  
		   CountryMaster master = new CountryMaster();
		   
		try {
			
		String query = "SELECT "+CountryCommon.QUERY_PARAM+" FROM "
			    + " "+AppDbCommon.DB+"."+CountryCommon.TABLE_NAME_SEARCH+" "
	     		+ " WHERE "+CountryCommon.NAME+"='"+AppName+"' ";
	     
	     master = new CountrySearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterByName(String name) : "+ex.toString());	
	   }		
		return master;		
	}
	
	public ArrayList<CountryMaster> getAllMasterList(){
		  
		ArrayList<CountryMaster> arrList = new ArrayList<CountryMaster>();
		try {
			
			String query = "SELECT "+CountryCommon.QUERY_PARAM+" FROM "
		     	 + " "+AppDbCommon.DB+"."+CountryCommon.TABLE_NAME_SEARCH+" ";
	     
	        arrList = new CountrySearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll() : "+ex.toString());	
	   }		
		return arrList;		
	}
	
	
	public ArrayList<CountryMaster> getActiveMasterList(){
		  
		ArrayList<CountryMaster> arrList = new ArrayList<CountryMaster>();
		try {
			
			String query = "SELECT "+CountryCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+CountryCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+CountryCommon.STATUS+"='Active' ";
	     
	             arrList = new CountrySearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getActiveMasterList() : "+ex.toString());	
	   }		
		return arrList;		
	}
	
	public HashMap<String,String> getAllMasterMap(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
			String query = "SELECT "+CountryCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+CountryCommon.TABLE_NAME_SEARCH+" ";
	     
	                hMap = new CountrySearch(st).getMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			System.out.println(" Error in function "+this.getClass().getName()+".getAllMasterMap() : "+ex.toString());	
	     }
		
		return hMap;
		
	  }	

}
