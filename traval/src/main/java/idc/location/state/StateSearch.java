package idc.location.state;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class StateSearch {
	Statement st;
	
	 public StateSearch(){}
	 public StateSearch(Statement st){
			this.st = st;		
	 }
		
	  public StateMaster getMaster(String query){		
		     StateMaster master = new StateMaster();
			
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
		
		public ArrayList<StateMaster> getMasterList(String query){		
			
			ArrayList<StateMaster> masterList = new ArrayList<StateMaster>();
			try {			
			ResultSet rs = this.st.executeQuery(query);
			
			while(rs.next()) {
				StateMaster master = new StateMaster();
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
					StateMaster master = new StateMaster();
					updateMaster(rs,master);
					
					hMap.put(StateCommon.HASH_MAP_ID+master.getId(), master.getName());
				}
				
			}catch(Exception ex){
			  System.out.println(" Error in funciton "+this.getClass().getSimpleName()+".getMasterMap(String query) "
						+ " "+ex.toString());
			}		
			return hMap;
		}
		
		public void updateMaster(ResultSet rs, StateMaster master) {
			try {
			
			try {
				master.setId(rs.getInt(StateCommon.ID));
			}catch(Exception sqlEx) {} 
			try {
				master.setName(rs.getString(StateCommon.NAME));
			}catch(Exception sqlEx) {}
			try {
				master.setStatus(rs.getString(StateCommon.STATUS));
			}catch(Exception sqlEx) {}		
			
			}catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getSimpleName()+".updateMaster(ResultSet rs, Master master) "+ex.toString());
			}
	 }		
 }
