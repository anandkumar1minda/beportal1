package idc.location.state;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import idc.common.AppDbCommon;

public class StateFaces {	
	  
	  Statement st;
		
	  public StateFaces(Statement st){
		     this.st = st;
	   }
		
	 public StateMaster getMasterById(int id){
			  
			StateMaster master = new StateMaster();
			   
			try {
				
		     String query = "SELECT "+StateCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+StateCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+StateCommon.ID+"='"+id+"'";
		     
		     master = new StateSearch(st).getMaster(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterById(String id) : "+ex.toString());	
		   }		
			return master;		
		}
		
		public StateMaster getMasterByName(String name){
			  
			   StateMaster master = new StateMaster();
			   
			try {
				
			String query = "SELECT "+StateCommon.QUERY_PARAM+" FROM "
				    + " "+AppDbCommon.DB+"."+StateCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+StateCommon.NAME+"='"+name+"' ";
		     
		     master = new StateSearch(st).getMaster(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterByName(String name) : "+ex.toString());	
		   }		
			return master;		
		}
		
		public ArrayList<StateMaster> getAllMasterList(){
			  
			ArrayList<StateMaster> arrList = new ArrayList<StateMaster>();
			try {
				
				String query = "SELECT "+StateCommon.QUERY_PARAM+" FROM "
			     	 + " "+AppDbCommon.DB+"."+StateCommon.TABLE_NAME_SEARCH+" ";
		     
		        arrList = new StateSearch(st).getMasterList(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll() : "+ex.toString());	
		   }
			
			return arrList;		
		}
		
		
		public ArrayList<StateMaster> getActiveMasterList(){
			  
			ArrayList<StateMaster> arrList = new ArrayList<StateMaster>();
			try {
				
				String query = "SELECT "+StateCommon.QUERY_PARAM+" FROM "
			     		+ " "+AppDbCommon.DB+"."+StateCommon.TABLE_NAME_SEARCH+" "
			     		+ " WHERE "+StateCommon.STATUS+"='Active' ";
		     
		             arrList = new StateSearch(st).getMasterList(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println(" Error in function "+this.getClass().getName()+".getActiveMasterList() : "+ex.toString());	
		   }		
			return arrList;		
		}
		
	public HashMap<String,String> getAllMasterMap(){
			  
			HashMap<String,String> hMap = new HashMap<String,String>();
			try {
				
				String query = "SELECT "+StateCommon.QUERY_PARAM+" FROM "
			     		+ " "+AppDbCommon.DB+"."+StateCommon.TABLE_NAME_SEARCH+" ";
		     
		                hMap = new StateSearch(st).getMasterMap(query);
		   
			 }
		    catch(Exception ex) {
				System.out.println(" Error in function "+this.getClass().getName()+".getAllMasterMap() : "+ex.toString());	
		     }
			
		return hMap;
		
	  }
		
 }




