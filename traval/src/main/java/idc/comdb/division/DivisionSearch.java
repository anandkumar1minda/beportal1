package idc.comdb.division;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DivisionSearch {

	private Statement st;	
	HashMap<String,String> hMap;
	
	public DivisionSearch(Statement st) {
		this.st = st;			
	}
	public DivisionSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public DivisionMaster getMaster(String query) {		   
		   DivisionMaster master = new DivisionMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> DivisionSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<DivisionMaster> getMasterList(String query) {	
		   
		   ArrayList<DivisionMaster> arrayList = new ArrayList<DivisionMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   DivisionMaster master = new DivisionMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> DivisionSearch -> getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<DivisionMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<DivisionMaster> arrayList = new ArrayList<DivisionMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   DivisionMaster master = new DivisionMaster();		
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
		   System.out.println("error in function idc.comdb.bv -> DivisionSearch -> getMasterList "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
  public void setMasterMap(String query) {	
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   DivisionMaster master = new DivisionMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.department -> DeptSearch -> setMasterMap(String query,String status) "+ex.toString());
	   } 
  }
 
   public void setMap(DivisionMaster master) {
	   this.hMap.put(DivisionCommon.HASH_ABBR+master.getId(),master.getName());
   }
   
   public void setMaster(ResultSet rs, DivisionMaster master) {
	   try {
		   
	    try{
			master.setId(rs.getInt(DivisionCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(DivisionCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(DivisionCommon.STATUS));
		}catch(Exception sqlEx) {}
		
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.bv -> DivisionSearch -> setMaster(ResultSet rs, DivisionMaster master) "+ex.toString());
	   }
   }
   
}
