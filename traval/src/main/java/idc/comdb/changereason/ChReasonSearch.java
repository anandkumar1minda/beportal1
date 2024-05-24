package idc.comdb.changereason;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class ChReasonSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public ChReasonSearch(Statement st) {
		this.st = st;			
	}
	public ChReasonSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public ChReasonMaster getMaster(String query) {		   
		   ChReasonMaster master = new ChReasonMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function "+this.getClass().getName()+".getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<ChReasonMaster> getMasterList(String query) {	
		   
		   ArrayList<ChReasonMaster> arrayList = new ArrayList<ChReasonMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   ChReasonMaster master = new ChReasonMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function "+this.getClass().getName()+".getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<ChReasonMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<ChReasonMaster> arrayList = new ArrayList<ChReasonMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   ChReasonMaster master = new ChReasonMaster();		
		   setMaster(rs,master);
		   
		   if(master.getStatus()!=null ){
			  if(master.getStatus().equalsIgnoreCase(status)){
				  arrayList.add(master); 
			   }
		    }
		   else{
			  arrayList.add(master);   
		    }
		   
		   setMap(master);
		   
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".getMasterList(String query,String status) "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
 public void setMasterMap(String query) {	   
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   ChReasonMaster master = new ChReasonMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".setMasterMap(String query,String status) "+ex.toString());
	   }	 
   }
 
   public void setMap(ChReasonMaster master) {
	   this.hMap.put(ChReasonCommon.HASH_ABBR+master.getId(),master.getName());
   }
   
   public void setMaster(ResultSet rs, ChReasonMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(ChReasonCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(ChReasonCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setDesc(rs.getString(ChReasonCommon.DESC));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(ChReasonCommon.STATUS));
		}catch(Exception sqlEx) {}
	    
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".setMaster(ResultSet rs, ChReasonMaster master) "+ex.toString());
	   }
   }


}
