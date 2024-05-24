package idc.comdb.doc;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DocSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public DocSearch(Statement st) {
		this.st = st;			
	}
	public DocSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public DocMaster getMaster(String query) {		   
		   DocMaster master = new DocMaster();
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

	public ArrayList<DocMaster> getMasterList(String query) {	
		   
		   ArrayList<DocMaster> arrayList = new ArrayList<DocMaster>();
		   try {
			   
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   DocMaster master = new DocMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function "+this.getClass().getName()+".getMasterList "+ex.toString());
		   }		   
		   return arrayList;
	   }
	   
	
   public ArrayList<DocMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<DocMaster> arrayList = new ArrayList<DocMaster>();
	   try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()) {		
		   DocMaster master = new DocMaster();		
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
		   DocMaster master = new DocMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+"."
		   		+ " setMasterMap(String query,String status) "+ex.toString());
	   }	 
   }
 
  public HashMap<String,String> getMasterMap(String query) {
	 
	    HashMap<String,String> returnMap = new HashMap<String,String>();
	    try {
		
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   DocMaster master = new DocMaster();		
		   setMaster(rs,master);
		   setMap(master);		     
	      }
	   
	    returnMap =  this.hMap;
	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".getMasterMap(String query) "+ex.toString());
	   }	   
	   return returnMap;
   } 
 
   public void setMap(DocMaster master) {
	   this.hMap.put(DocCommon.HASH_ABBR+master.getId(),master.getName());
   }
   
   public void setMaster(ResultSet rs, DocMaster master) {	   
	   try {
		   
	    try{
			master.setId(rs.getInt(DocCommon.ID));
		}catch(Exception sqlEx) {}
	    try{
			master.setName(rs.getString(DocCommon.NAME));
		}catch(Exception sqlEx) {}	  
	    try{
			master.setStatus(rs.getString(DocCommon.STATUS));
		}catch(Exception sqlEx) {}
	    
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+".setMaster(ResultSet rs, DocMaster master) "+ex.toString());
	   }
   }
   
}
