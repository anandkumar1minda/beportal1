package idc.comdb.doc;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import idc.comdb.bv.BvCommon;

public class DocFaces {
	
public DocFaces(){} 
	
	Statement st;
	public DocFaces(Statement st) {
		this.st = st;
	}

	public ArrayList<DocMaster> getMasterList(int BvId){
		  
		ArrayList<DocMaster> arrList = new ArrayList<DocMaster>();
		try {		
	     String query = "SELECT "+DocCommon.ID+" , "+DocCommon.NAME+", "
	     		+ " "+DocCommon.STATUS+""
	     		+ " FROM "+DocCommon.TABLE_NAME+" where "+BvCommon.ID+"='"+BvId+"' "
	     		+ " order by "+DocCommon.ID+" asc ";     
	     arrList = new DocSearch(this.st).getMasterList(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getMasterList : "+ex.toString());	
	    }
		
		return arrList;
		
	 }
	
	public void setListMap(HashMap<String,String> hmap){
		
		try {
		
		 String query = "SELECT "+DocCommon.ID+" ,"+DocCommon.NAME+","
		 		+ " "+DocCommon.STATUS+" FROM "+DocCommon.TABLE_NAME+""
		 		+ " order by "+DocCommon.ID+" asc ";	     
	     new DocSearch(this.st, hmap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".setListMap(Statement st, HashMap<String,String> hmap) : "+ex.toString());	
	    }		
	 }
	
	public HashMap<String,String> getMapAll(){
		  
		HashMap<String,String> hMap = new HashMap<String,String>();
		try {
			
			String query = "SELECT "+DocCommon.ID+" ,"+DocCommon.NAME+","+DocCommon.STATUS+" "
					+ " FROM "+DocCommon.TABLE_NAME+" "
			 		+ " order by "+DocCommon.ID+" asc ";
			
		     new DocSearch(this.st,hMap).setMasterMap(query);
	   
		 }
	    catch(Exception ex) {
			  System.out.println(" Error in function "+this.getClass().getName()+".getMapAll: "+ex.toString());	
	   }		
		return hMap;		
	 }
	
  }

