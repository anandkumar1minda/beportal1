package idc.comdb.reqtype;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class ReqTypeSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public ReqTypeSearch(Statement st) {
		this.st = st;			
	}
	public ReqTypeSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public ReqTypeMaster getMaster(String query) {		   
		   ReqTypeMaster master = new ReqTypeMaster();
		   
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		     }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.ReqType -> ReqTypeSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<ReqTypeMaster> getMasterList(String query) {	
		   
		   ArrayList<ReqTypeMaster> arrayList = new ArrayList<ReqTypeMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   ReqTypeMaster master = new ReqTypeMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.ReqType -> ReqTypeSearch -> getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
   }
	
   public ArrayList<ReqTypeMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<ReqTypeMaster> arrayList = new ArrayList<ReqTypeMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   ReqTypeMaster master = new ReqTypeMaster();		
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
		   System.out.println("error in function idc.comdb.ReqType -> ReqTypeSearch -> getMasterList "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
   public void setMasterMap(String query) {	
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   ReqTypeMaster master = new ReqTypeMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.reqtype -> ReqTypeMaster -> setMasterMap(String query,String status) "+ex.toString());
	   } 
  }
 
   public void setMap(ReqTypeMaster master) {
	    this.hMap.put(ReqTypeCommon.HASH_ABBR+master.getId(),master.getName());
		this.hMap.put(ReqTypeCommon.HASH_ABBR_DESC+master.getId(),master.getDesc());
   }
   
   public void setMaster(ResultSet rs, ReqTypeMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(ReqTypeCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(ReqTypeCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
	    	master.setDesc(rs.getString(ReqTypeCommon.DESC));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(ReqTypeCommon.STATUS));
		}catch(Exception sqlEx) {}
	    
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.ReqType -> ReqTypeSearch -> setMaster(ResultSet rs, ReqTypeMaster master) "+ex.toString());
	   }
   }


}
