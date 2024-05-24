package idc.comdb.phase;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class PhaseSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public PhaseSearch(Statement st) {
		this.st = st;			
	}
	public PhaseSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public PhaseMaster getMaster(String query) {		   
		   PhaseMaster master = new PhaseMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.phase -> PhaseSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<PhaseMaster> getMasterList(String query) {	
		   
		   ArrayList<PhaseMaster> arrayList = new ArrayList<PhaseMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   PhaseMaster master = new PhaseMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.phase -> PhaseSearch -> getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<PhaseMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<PhaseMaster> arrayList = new ArrayList<PhaseMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   PhaseMaster master = new PhaseMaster();		
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
		   System.out.println("error in function idc.comdb.phase -> PhaseSearch -> getMasterList(String query,String status) "+ex.toString());
	   }	   
	   return arrayList;
   }
   
   public void setMasterMap(String query) {	
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   PhaseMaster master = new PhaseMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.reqtype -> ReqTypeMaster -> setMasterMap(String query,String status) "+ex.toString());
	   } 
  }
 
   public void setMap(PhaseMaster master){
	   this.hMap.put(PhaseCommon.HASH_ABBR+master.getId(),master.getName());
	   this.hMap.put(PhaseCommon.HASH_ABBR_DESC+master.getId(),master.getDesc());
   }
   
   public void setMaster(ResultSet rs, PhaseMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(PhaseCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(PhaseCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setDesc(rs.getString(PhaseCommon.DESC));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(PhaseCommon.STATUS));
		}catch(Exception sqlEx) {}
	    
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.phase -> PhaseSearch -> setMaster(ResultSet rs, PhaseMaster master) "+ex.toString());
	   }
   }

}
