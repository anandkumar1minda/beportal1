package idc.comdb.department;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DeptSearch {	

	private Statement st;	
	HashMap<String,String> hMap;
	
	public DeptSearch(Statement st) {
		this.st = st;			
	}
	public DeptSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public DeptMaster getMaster(String query) {		   
		   DeptMaster master = new DeptMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> DeptSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }

	public ArrayList<DeptMaster> getMasterList(String query) {	
		   
		   ArrayList<DeptMaster> arrayList = new ArrayList<DeptMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   DeptMaster master = new DeptMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.department -> DeptSearch -> getMasterList "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<DeptMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<DeptMaster> arrayList = new ArrayList<DeptMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   DeptMaster master = new DeptMaster();		
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
		   System.out.println("error in function idc.comdb.department -> DeptSearch -> getMasterList "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
  public void setMasterMap(String query) {		   
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   DeptMaster master = new DeptMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.department -> DeptSearch -> setMasterMap(String query,String status) "+ex.toString());
	   } 
   }
 
   public void setMap(DeptMaster master) {
	   this.hMap.put(DeptCommon.HASH_ABBR+master.getId(),master.getName());
   }
   
   public void setMaster(ResultSet rs, DeptMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(DeptCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(DeptCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setStatus(rs.getString(DeptCommon.STATUS));
		}catch(Exception sqlEx) {}
		
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.comdb.bv -> DeptSearch -> setMaster(ResultSet rs, DeptMaster master) "+ex.toString());
	   }
    }
   
 }

