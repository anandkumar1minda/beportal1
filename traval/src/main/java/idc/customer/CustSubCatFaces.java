package idc.customer;

 import java.sql.Statement;
 import java.util.ArrayList;
 import idc.comdb.bv.BvCommon;

 public class CustSubCatFaces {
	
	 Statement st;
	
  public CustSubCatFaces(Statement st){
		 this.st=st;
	}
	
  public ArrayList<CustMaster> getMasterListAll(int bvId){
		
		 ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
	  try{
		  
	     String query = "SELECT DISTINCT "+CustCommon.SUBCAT+" "
	     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+BvCommon.ID+"='"+bvId+"' "
	     		+ " order by "+CustCommon.SUBCAT;
	     
	 	  arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
		  System.out.println("Error in function "+this.getClass().getName()+".getMasterListAll(Statement st) "
		  		+ " : "+ex.toString());	
	   }	  
		 return arrList;		
	}
	
	public ArrayList<CustMaster> getActiveMasterList(int bvId){
		  
		ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
		try {
			
			String query = "SELECT DISTINCT "+CustCommon.SUBCAT+" "
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+CustCommon.STATUS+"='Active' "
		     		+ " AND "+BvCommon.ID+"='"+bvId+"' "
		     		+ " order by "+CustCommon.SUBCAT;		
		
	     arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
		   System.out.println("Error in function "+this.getClass().getName()+".getMasterListActive(Statement st) : "+ex.toString());	
	   }		
		return arrList;		 
	}
	
	public ArrayList<CustMaster> getActiveMasterList(int bvId, String custCat){
		  
		ArrayList<CustMaster> arrList = new ArrayList<CustMaster>();
		try {
			
		   String query = "SELECT DISTINCT "+CustCommon.SUBCAT+" "
		     		+ " FROM "+CustCommon.TABLE_NAME+" WHERE "+CustCommon.STATUS+"='Active' "
		     		+ " AND "+BvCommon.ID+"='"+bvId+"' AND "+CustCommon.CAT+"='"+custCat+"' "
		     		+ " order by "+CustCommon.SUBCAT;		
		
	       arrList = new CustSearch(st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
		   System.out.println(" Error in function "+this.getClass().getName()+".getActiveMasterList(Statement st) : "+ex.toString());	
	   }
		
		return arrList;
		
	 }
	
 }


