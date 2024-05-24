 package idc.location.city;
    
 import java.sql.ResultSet;
 import java.sql.Statement;
 import java.util.ArrayList;
 import java.util.HashMap;

  public class CitySearch {

	Statement st;
		
		public CitySearch(){}
		public CitySearch(Statement st){
			this.st = st;		
		}
		
		public CityMaster getMaster(String query){		
			   CityMaster master = new CityMaster();
			
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
		
		public ArrayList<CityMaster> getMasterList(String query){		
			
			ArrayList<CityMaster> masterList = new ArrayList<CityMaster>();
			try {			
			ResultSet rs = this.st.executeQuery(query);
			
			while(rs.next()) {
				CityMaster master = new CityMaster();
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
					CityMaster master = new CityMaster();
					updateMaster(rs,master);
					
					hMap.put(CityCommon.HASH_MAP_ID+master.getId(), master.getName());
				}
				
			}catch(Exception ex){
			  System.out.println(" Error in funciton "+this.getClass().getSimpleName()+".getMasterMap(String query) "
						+ " "+ex.toString());
			}		
			return hMap;
		}
		
		public void updateMaster(ResultSet rs, CityMaster master) {
			try {
			
			try {
				master.setId(rs.getInt(CityCommon.ID));
			}catch(Exception sqlEx) {} 
			try {
				master.setName(rs.getString(CityCommon.NAME));
			}catch(Exception sqlEx) {}
			try {
				master.setStatus(rs.getString(CityCommon.STATUS));
			}catch(Exception sqlEx) {}		
			
			}catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getSimpleName()+".updateMaster(ResultSet rs, Master master) "+ex.toString());
			}
	    }
  }
