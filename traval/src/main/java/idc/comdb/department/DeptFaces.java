package idc.comdb.department;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

 public class DeptFaces {

	 public ArrayList<DeptMaster> getMasterList(Statement st, HashMap<String,String> hmap,String Status){
		  
		 ArrayList<DeptMaster> arrList = new ArrayList<DeptMaster>();
		try {		
	     String query = "SELECT DepartmentId , DepartmentName , DepartmentStatus FROM "+DeptCommon.TABLE_NAME;	     
	     arrList = new DeptSearch(st, hmap).getMasterList(query,Status);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+". ArrayList<DeptMaster> getMasterList : "+ex.toString());	
	   }		
		return arrList;		
	}
	 
	 public void setListMap(Statement st, HashMap<String,String> hmap){
			
			try {		
		     String query = "SELECT "+DeptCommon.ID+" ,"+DeptCommon.NAME+", "+DeptCommon.STATUS+" FROM "+DeptCommon.TABLE_NAME;	     
		     new DeptSearch(st, hmap).setMasterMap(query);
		   
			 }
		    catch(Exception ex) {
				  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	     }
	 }
			
	 
}
