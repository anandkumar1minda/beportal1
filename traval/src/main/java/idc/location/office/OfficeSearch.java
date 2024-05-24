 package idc.location.office;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class OfficeSearch {

	 Statement st;
		
	 public OfficeSearch(){}
	 public OfficeSearch(Statement st){
			this.st = st;		
	 }
		
	  public OfficeMaster getMaster(String query){		
		     OfficeMaster master = new OfficeMaster();
			
			try {			
			ResultSet rs = this.st.executeQuery(query);
			
			if(rs.next()) {			
				updateMaster(rs,master);			
			  }
			}catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getSimpleName()+".getMaster "+ex.toString());
			}
			return master;
		}
		
		public ArrayList<OfficeMaster> getMasterList(String query){		
			
			ArrayList<OfficeMaster> masterList = new ArrayList<OfficeMaster>();
			try {			
			ResultSet rs = this.st.executeQuery(query);
			
			while(rs.next()) {
				OfficeMaster master = new OfficeMaster();
				updateMaster(rs,master);
				masterList.add(master);
			   }
		    }catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getSimpleName()+".getMasterList "+ex.toString());
			}
			return masterList;
		}
		
		public HashMap<String,String> getMasterMap(String query){
			
			HashMap<String,String> hMap = new HashMap<String,String>();
			try {
			
				ResultSet rs = this.st.executeQuery(query);
				
				while(rs.next()) {
					OfficeMaster master = new OfficeMaster();
					updateMaster(rs,master);
					
					hMap.put(OfficeCommon.HASH_MAP_ID+master.getId(), master.getName());
				}
				
			}catch(Exception ex){
			  System.out.println(" Error in funciton "+this.getClass().getSimpleName()+".getMasterMap(String query) "
						+ " "+ex.toString());
			}		
			return hMap;
		}
		
   public HashMap<String,Integer> getNameToIdMap(String query){
			
			HashMap<String,Integer> hMap = new HashMap<String,Integer>();
			try {
			
				ResultSet rs = this.st.executeQuery(query);
				
				while(rs.next()) {
					OfficeMaster master = new OfficeMaster();
					updateMaster(rs,master);
					
					hMap.put(master.getName(),master.getId());
				}
				
			}catch(Exception ex){
			  System.out.println(" Error in funciton "+this.getClass().getSimpleName()+".getMasterMap(String query) "
						+ " "+ex.toString());
			}		
			return hMap;
	  }		
       
	public void updateMaster(ResultSet rs, OfficeMaster master) {
	       try {
	    	   
			try {
				master.setId(rs.getInt(OfficeCommon.ID));
			}catch(Exception sqlEx) {} 
			try {
				master.setName(rs.getString(OfficeCommon.NAME));
			}catch(Exception sqlEx) {}
			try {
				master.setStatus(rs.getString(OfficeCommon.STATUS));
			}catch(Exception sqlEx) {}		
			
			}catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getSimpleName()+".updateMaster(ResultSet rs, Master master) "+ex.toString());
			}
	    }		
  }


