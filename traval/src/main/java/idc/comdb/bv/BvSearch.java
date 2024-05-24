package idc.comdb.bv;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class BvSearch {	

	private Statement st;	
	HashMap<String,String> hMap;
	
	public BvSearch(Statement st) {
		this.st = st;			
	}
	public BvSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public BvMaster getMaster(String query) {		   
		   BvMaster master = new BvMaster();
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
	
	public ArrayList<BvMaster> getMasterList(String query) {	
		   
		   ArrayList<BvMaster> arrayList = new ArrayList<BvMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   BvMaster master = new BvMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function "+this.getClass().getName()+".ArrayList<BvMaster> getMasterList(String query) "+ex.toString());
		   }		   
		   return arrayList;
     }
	
   public ArrayList<BvMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<BvMaster> arrayList = new ArrayList<BvMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   BvMaster master = new BvMaster();		
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
		   System.out.println("error in function "+this.getClass().getName()+".ArrayList<BvMaster> getMasterList(String query,String status) "+ex.toString());
	   }	   
	   return arrayList;
   }
 
   public void setMasterMap(String query) {		   
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   BvMaster master = new BvMaster();		
		   setMaster(rs,master);
		   setMap(master);		   
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".setMasterMap(String query) "+ex.toString());
	   } 
   }   
   
 public void setMap(BvMaster master) {
	this.hMap.put(BvCommon.HASH_ABBR+master.getId(),master.getName());
  }  

 public void setMaster(ResultSet rs, BvMaster master) {	
	 
	   try {
		   
	    try{
			master.setId(rs.getInt(BvCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(BvCommon.NAME));
		}catch(Exception sqlEx) {}	    
	    try{
			master.setStatus(rs.getString(BvCommon.STATUS));
		}catch(Exception sqlEx) {}
	    
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".setMaster(ResultSet rs, BvMaster master) "+ex.toString());
	   }
	   
    }
 
 }



