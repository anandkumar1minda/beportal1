 package idc.comdb.segment;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SegmentSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public SegmentSearch(Statement st) {
		this.st = st;			
	}
	public SegmentSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public SegmentMaster getMaster(String query) {		   
		   SegmentMaster master = new SegmentMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> SegmentSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<SegmentMaster> getMasterList(String query) {	
		   
		   ArrayList<SegmentMaster> arrayList = new ArrayList<SegmentMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   SegmentMaster master = new SegmentMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> SegmentSearch -> getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<SegmentMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<SegmentMaster> arrayList = new ArrayList<SegmentMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   SegmentMaster master = new SegmentMaster();		
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
		   System.out.println("error in function idc.comdb.bv -> SegmentSearch -> getMasterList "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
   public void setMasterMap(String query) {	
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   SegmentMaster master = new SegmentMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.department -> DeptSearch -> setMasterMap(String query,String status) "+ex.toString());
	   } 
  }
 
   public void setMap(SegmentMaster master) {
	   this.hMap.put(SegCommon.HASH_ABBR+master.getId(),master.getName());
   }
 
   
   public void setMaster(ResultSet rs, SegmentMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(SegCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(SegCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(SegCommon.STATUS));
		}catch(Exception sqlEx) {}
		
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.bv -> SegmentSearch -> setMaster(ResultSet rs, SegmentMaster master) "+ex.toString());
	   }
   }
   
 }
