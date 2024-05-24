package idc.location.office;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import idc.common.AppDbCommon;


public class OfficeFaces {
	
	 Statement st;
		
	  public OfficeFaces(Statement st){
			this.st = st;
	   }
		
	 public OfficeMaster getMasterById(int id){
			  
			OfficeMaster master = new OfficeMaster();
			   
			try {
				
		     String query = "SELECT "+OfficeCommon.QUERY_PARAM+" FROM "
		     		+ " "+AppDbCommon.DB+"."+OfficeCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+OfficeCommon.ID+" = '"+id+"'";
		     
		     master = new OfficeSearch(st).getMaster(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterById(String id) : "+ex.toString());	
		   }		
			return master;		
		}
		
		public OfficeMaster getMasterByName(String name){
			
			   OfficeMaster master = new OfficeMaster();
			   
			try {
				
			String query = "SELECT "+OfficeCommon.QUERY_PARAM+" FROM "
				    + " "+AppDbCommon.DB+"."+OfficeCommon.TABLE_NAME_SEARCH+" "
		     		+ " WHERE "+OfficeCommon.NAME+"='"+name+"' ";
		     
		     master = new OfficeSearch(st).getMaster(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterByName(String name)"
				  		+ " : "+ex.toString());	
		   }		
			return master;		
		}
		
		public ArrayList<OfficeMaster> getAllMasterList(){
			  
			ArrayList<OfficeMaster> arrList = new ArrayList<OfficeMaster>();
			try {
				
				String query = "SELECT "+OfficeCommon.QUERY_PARAM+" FROM "
			     	 + " "+AppDbCommon.DB+"."+OfficeCommon.TABLE_NAME_SEARCH+" order by "+OfficeCommon.NAME;
		     
		        arrList = new OfficeSearch(st).getMasterList(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll() : "+ex.toString());	
		   }		
			return arrList;		
		}
		
		
		public ArrayList<OfficeMaster> getActiveMasterList(){
			  
			ArrayList<OfficeMaster> arrList = new ArrayList<OfficeMaster>();
			try {
				
				String query = "SELECT "+OfficeCommon.QUERY_PARAM+" FROM "
			     		+ " "+AppDbCommon.DB+"."+OfficeCommon.TABLE_NAME_SEARCH+" "
			     		+ " WHERE "+OfficeCommon.STATUS+"='Active' order by "+OfficeCommon.NAME;
		     
		             arrList = new OfficeSearch(st).getMasterList(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println(" Error in function "+this.getClass().getName()+".getActiveMasterList() : "+ex.toString());	
		   }		
			return arrList;		
		}
		
		public HashMap<String,String> getAllMasterMap(){
			  
			HashMap<String,String> hMap = new HashMap<String,String>();
			try {
				
				String query = "SELECT "+OfficeCommon.QUERY_PARAM+" FROM "
			     		+ " "+AppDbCommon.DB+"."+OfficeCommon.TABLE_NAME_SEARCH+" order by "+OfficeCommon.NAME;
		     
		        hMap = new OfficeSearch(st).getMasterMap(query);
		   
			 }
		    catch(Exception ex) {
				System.out.println(" Error in function "+this.getClass().getName()+".getAllMasterMap() : "+ex.toString());	
		     }
			
			return hMap;
			
		}
		
  }


