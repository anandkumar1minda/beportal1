package idc.customer;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.comdb.bv.BvCommon;

public class CustFaces {
	
	Statement st;

	public CustFaces(Statement st){
		this.st = st;
	}
	
  public ArrayList<CustMaster> getMasterListAll(Statement st,int bvId){
		
		 ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
	  try{
			
	     String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+", "
	     		+ " "+CustCommon.ABBR+", "+CustCommon.STATUS+","
	     		+ " "+CustCommon.CAT+", "+CustCommon.SUBCAT+" "
	     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+bvId+"' "
	     		+ " order by "+CustCommon.NAME ;
	     
	     arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
		  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll(Statement st) : "+ex.toString());	
	   }		
		 return arrList;		
	}
	
	public ArrayList<CustMaster> getActiveMasterList(int bvId){
		  
		ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
		try {
			
			String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+", "
		     		+ " "+CustCommon.ABBR+","+CustCommon.STATUS+""
		     		+ ","+CustCommon.CAT+","+CustCommon.SUBCAT+" "
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+CustCommon.STATUS+"='Active' "
		     		+ " AND "+BvCommon.ID+"='"+bvId+"' order by "+CustCommon.NAME;
		
	
	     arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterListActive(Statement st) : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public ArrayList<CustMaster> getActiveMasterList(int bvId, String cat, String subCat){
		  
		ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
		try {
			
			String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+", "
		     		+ " "+CustCommon.ABBR+","+CustCommon.STATUS+""
		     		+ ","+CustCommon.CAT+","+CustCommon.SUBCAT+" "
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+CustCommon.STATUS+"='Active' "
		     		+ " AND "+BvCommon.ID+"='"+bvId+"' AND "+CustCommon.CAT+"='"+cat+"' "
		     		+ " AND "+CustCommon.SUBCAT+"='"+subCat+"' order by "+CustCommon.NAME ;			
		
	     arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterListActive(Statement st) : "+ex.toString());	
	   }		
		return arrList;		
	 }
	
	public HashMap<String,String> getCustMapAll(int bvId){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
		 String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+","+CustCommon.ABBR+","+CustCommon.STATUS+""
		 		+ ", "+CustCommon.CAT+","+CustCommon.SUBCAT+""
		 		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+bvId+"' order by "+CustCommon.NAME;
	     
	     new CustSearch(st,hMap).setMasterMap(query);	     
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getCustMapAll(Statement st) : "+ex.toString());	
	   }		
		return hMap;		
	}
	
	public HashMap<String,String> getCustMapActive(int bvId){
		  
		HashMap<String,String> deptAppMap = new HashMap<String,String>();
		try {
			
		  String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+","+CustCommon.ABBR+","+CustCommon.STATUS+","
				    + ""+CustCommon.CAT+","+CustCommon.SUBCAT+""
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+CustCommon.STATUS+"='Active' AND "
		     		+ " "+BvCommon.ID+"='"+bvId+"' "
		     		+ " order by "+CustCommon.NAME;
			
	      new CustSearch(st,deptAppMap).setMasterMap(query);	     
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getCustMapActive(Statement st) : "+ex.toString());	
	   }		
		return deptAppMap;		
	 }
	
  public void setListMap(int bvId, HashMap<String,String> hmap){
		
		try {
			
		String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+","+CustCommon.ABBR+","+CustCommon.STATUS+","
				    + ""+CustCommon.CAT+", "+CustCommon.SUBCAT+""
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+bvId+"' order by "+CustCommon.NAME;    
	     new CustSearch(st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	   }		
    }
  
  public ArrayList<CustMaster> getMasterList(int bvId, HashMap<String,String> hmap, String Status){
	  
		ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
		
		try {
			
		String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+","+CustCommon.ABBR+", "+CustCommon.STATUS+","
				    + ""+CustCommon.CAT+","+CustCommon.SUBCAT+""
					+ " FROM "+CustCommon.TABLE_NAME+""
					+ " WHERE "+BvCommon.ID+"='"+bvId+"' order by "+CustCommon.NAME;  
			
	          arrList = new CustSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	     }		
		return arrList;
		
	 }
  
   public HashMap<String,String> getMapAll(int bvId){
	  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
		 String query = "SELECT "+CustCommon.ID+", "+CustCommon.NAME+","+CustCommon.ABBR+","+CustCommon.STATUS+""
		 		+ ", "+CustCommon.CAT+","+CustCommon.SUBCAT+""
		 		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+bvId+"' order by "+CustCommon.NAME;
	     
	     new CustSearch(st,hMap).setMasterMap(query);	     
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getCustMapAll(Statement st) : "+ex.toString());	
	   }		
		return hMap;		
	 }
   
 }




