package idc.customer;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class CustSearch {
	
	private Statement st;	
	HashMap<String,String> hMap;
	
	public CustSearch(){}
	public CustSearch(Statement st) {
		this.st = st;			
	}
	public CustSearch(Statement st,HashMap<String,String> hMap) {
		this.st = st;
		this.hMap = hMap;
	}

	public CustMaster getMaster(String query){		   
		   CustMaster master = new CustMaster();
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

	public ArrayList<CustMaster> getMasterList(String query) {	
		   
		   ArrayList<CustMaster> arrayList = new ArrayList<CustMaster>();
		   try {
			
		   ResultSet rs = this.st.executeQuery(query);
		   
		   while(rs.next()) {		
			   CustMaster master = new CustMaster();		
			   setMaster(rs,master);			   
			   arrayList.add(master); 		
		      }	   
		   }
		   catch(Exception ex){
			   System.out.println("error in function "+this.getClass().getName()+".getMasterList "+ex.toString());
		   }		   
		   return arrayList;
	   }	   
	
   public ArrayList<CustMaster> getMasterList(String query,String status) {	
	   
	   ArrayList<CustMaster> arrayList = new ArrayList<CustMaster>();
	   try {
		
		//   System.out.println(query);
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   CustMaster master = new CustMaster();		
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
		   System.out.println("error in function "+this.getClass().getName()+".getMasterList(String query, String status) "+ex.toString());
	   }	   
	   return arrayList;
   }
   
   public void setMasterMap(String query) {		   
	   try {
		   
	   ResultSet rs = this.st.executeQuery(query);
	   
	   while(rs.next()){		
		   CustMaster master = new CustMaster();		
		   setMaster(rs,master);
		   setMap(master);		   
	      }	   
	   }
	   catch(Exception ex){
		   System.out.println("error in function "+this.getClass().getName()+"setMasterMap(String query,String status) "+ex.toString());
	   } 
   }   
   
   public void setMap(CustMaster master) {
	 
	   this.hMap.put(CustCommon.HASH_ABBR+master.getId(), master.getName());	   
	   this.hMap.put(CustCommon.HASH_ABBR_ABBR+master.getId(), master.getAbbr());
	   
   } 
   
 public void setMaster(ResultSet rs, CustMaster master){	   
   try{	   
	 try{	    	
		  master.setId(rs.getInt(CustCommon.ID));
	    }catch(Exception sqlEx){}    
	 try{	    	
		  master.setName(rs.getString(CustCommon.NAME));
	    }catch(Exception sqlEx){} 
	 try{	    	
		  master.setAbbr(rs.getString(CustCommon.ABBR));
	    }catch(Exception sqlEx){} 
	 try{	    	
		  master.setStatus(rs.getString(CustCommon.STATUS));
	  }catch(Exception sqlEx){} 
	 try{	    	
		  master.setCategory(rs.getString(CustCommon.CAT));
	    }catch(Exception sqlEx){} 
	 try{	    	
		  master.setSubCategory(rs.getString(CustCommon.SUBCAT));
	  }catch(Exception sqlEx){}
	
    }
       catch(Exception sqlEx){} 
    }
 
 }
