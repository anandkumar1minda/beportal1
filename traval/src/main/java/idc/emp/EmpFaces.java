package idc.emp;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class EmpFaces {	

	public EmpMaster getMaster(Statement st, String empEmail){
		  
		   EmpMaster empMaster = new EmpMaster();
		try{
			
	     String query = "SELECT "+EmpCommon.ID+" ,"+EmpCommon.NAME+" , "+EmpCommon.EMAIL+" "
	     		+ "FROM "+EmpCommon.TABLE_NAME+" WHERE "+EmpCommon.EMAIL+"='"+empEmail+"' AND "
	     		+ ""+EmpCommon.STATUS+"='Active' ";	     
	     
	     empMaster = new EmpSearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.emp -> EmpFaces -> "
			  		+ " EmpMaster getMaster(Statement st, String empEmail) : "+ex.toString());	
	   }	
		return empMaster;		
	}
	
  public boolean isActiveEmp(Statement st, String empEmail){
		  
	     boolean isActive = false;
		try{
			
	     String query = "SELECT "+EmpCommon.ID+" ,"+EmpCommon.NAME+" , "+EmpCommon.EMAIL+" "
	     		+ "FROM "+EmpCommon.TABLE_NAME+" WHERE "+EmpCommon.EMAIL+"='"+empEmail+"' AND "
	     		+ ""+EmpCommon.STATUS+"='Active' ";	     
	     
	     EmpMaster empMaster = new EmpSearch(st).getMaster(query);
	     
	     if(empMaster.getEmpId()!=0) {	    
	    	 isActive = true;	    	 
	      }	     
		}
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.emp -> EmpFaces -> "
			  		+ " EmpMaster isActiveEmp(Statement st, String empEmail) : "+ex.toString());			  
			return false;
	   }	
		return isActive;	
   }
	
  public EmpMaster getMasterAll(Statement st, String empEmail){
		  
		   EmpMaster empMaster = new EmpMaster();
		try{
			
	     String query = "SELECT "+EmpCommon.ID+" ,"+EmpCommon.NAME+" , "+EmpCommon.EMAIL+" "
	     		+ "FROM "+EmpCommon.TABLE_NAME+" WHERE "+EmpCommon.EMAIL+"='"+empEmail+"' ";	     
	     
	     empMaster = new EmpSearch(st).getMaster(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.emp -> EmpFaces -> "
			  		+ " EmpMaster getMaster(Statement st, String empEmail) : "+ex.toString());	
	   }		
		return empMaster;		
   }
	
  public ArrayList<EmpMaster> getMasterListAll(Statement st, HashMap<String,String> hmap,String Status){
		  
		 ArrayList<EmpMaster> arrList = new ArrayList<EmpMaster>();
		try {
			
	     String query = "SELECT "+EmpCommon.ID+" ,"+EmpCommon.NAME+" , "+EmpCommon.STATUS+" FROM "+EmpCommon.TABLE_NAME;	     
	     arrList = new EmpSearch(st, hmap).getMasterList(query,Status);
	     
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.emp -> EmpFaces -> "
			  		+ " ArrayList<EmpMaster> getMasterList(Statement st, HashMap<String,String> hmap,String Status) : "+ex.toString());	
	    }		
		return arrList;
   }
  
  public ArrayList<EmpMaster> getMasterListActive(Statement st, HashMap<String,String> hmap,String Status){
	  
		 ArrayList<EmpMaster> arrList = new ArrayList<EmpMaster>();
		try {
			
	     String query = "SELECT "+EmpCommon.ID+" ,"+EmpCommon.NAME+" , "+EmpCommon.STATUS+" "
	     		+ " FROM "+EmpCommon.TABLE_NAME+" WHERE "+EmpCommon.STATUS+"='Active' ";
	     
	     arrList = new EmpSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function  idc.emp -> EmpFaces -> "
			  		+ " ArrayList<EmpMaster> getMasterList(Statement st, HashMap<String,String> hmap,String Status) : "+ex.toString());	
	    }		
		
		return arrList;
		
    }
  
 }

