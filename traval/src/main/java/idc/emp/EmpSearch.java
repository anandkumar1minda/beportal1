package idc.emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class EmpSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public EmpSearch(Statement st){
		this.st = st;			
	}
	public EmpSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public EmpMaster getMaster(String query) {		   
		   EmpMaster master = new EmpMaster();
		   try {			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   if(rs.next()){		   		
			   setMaster(rs,master);			 
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.comdb.bv -> EmpSearch -> getMaster(String query) "+ex.toString());
		   }		   
		   return master;
	   }
	public String getManagerMailList(String query){
		   
		   String returnList = "";
		   try {
			   
			   ResultSet rs = this.st.executeQuery(query);
			   
			   while(rs.next()){		
				   EmpMaster master = new EmpMaster();		
				   setMaster(rs,master);			 
				   returnList += returnList.equalsIgnoreCase("")?master.getManagerEmailId():","+master.getManagerEmailId();   
			       }	   
			   }
			   catch(Exception ex){
				   System.out.println("error in function "+this.getClass().getName()+".getMailList(String query) "+ex.toString());
			   }   
		   return returnList;	   
	   }

	public ArrayList<EmpMaster> getMasterList(String query) {	
		   
		   ArrayList<EmpMaster> arrayList = new ArrayList<EmpMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   EmpMaster master = new EmpMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function idc.emp -> EmpSearch -> ArrayList<EmpMaster> getMasterList(String query) "+ex.toString());
		   }
		   
		   return arrayList;
	   }
	   
	
   public ArrayList<EmpMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<EmpMaster> arrayList = new ArrayList<EmpMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   EmpMaster master = new EmpMaster();		
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
		   System.out.println("error in function idc.emp -> EmpSearch -> getMasterList "+ex.toString());
	   }
	   
	   return arrayList;
   }
   
  public void setMasterMap(String query) {	
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   EmpMaster master = new EmpMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.emp -> EmpSearch -> setMasterMap(String query,String status) "+ex.toString());
	   } 
  }
 
   public void setMap(EmpMaster master) {
	   this.hMap.put(EmpCommon.HASH_ABBR+master.getEmpId(),master.getEmpName());
   }
   
   public void setMaster(ResultSet rs, EmpMaster master) {
	   try {
		   
	    try{
			master.setEmpId(rs.getInt(EmpCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setEmpName(rs.getString(EmpCommon.NAME));
		}catch(Exception sqlEx) {}
	    try{
			master.setEmpEmail(rs.getString(EmpCommon.EMAIL));
		}
	    catch(Exception sqlEx) {}
	    try{
			master.setManagerEmailId(rs.getString(EmpCommon.MANAGER_EMAIL));
		}
	    catch(Exception sqlEx) {}
	    try{
			master.setManagerName(rs.getString(EmpCommon.MANANGER_NAME));
		}
	    catch(Exception sqlEx) {}
		
	   }
	   catch(Exception ex){
		   System.out.println("error in function idc.emp -> EmpSearch -> setMaster(ResultSet rs, EmpMaster master) "+ex.toString());
	   }
   }
   
}

