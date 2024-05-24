package idc.location.country;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class CountrySearch {

	Statement st;
	
	public CountrySearch(){}
	public CountrySearch(Statement st){
		this.st = st;		
	}
	
	public CountryMaster getMaster(String query){		
		   CountryMaster master = new CountryMaster();
		
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
	
	public ArrayList<CountryMaster> getMasterList(String query){		
		
		ArrayList<CountryMaster> masterList = new ArrayList<CountryMaster>();
		try {			
		ResultSet rs = this.st.executeQuery(query);
		
		while(rs.next()) {
			CountryMaster master = new CountryMaster();
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
				CountryMaster master = new CountryMaster();
				updateMaster(rs,master);
				
				hMap.put(CountryCommon.HASH_MAP_ID+master.getId(), master.getName());
			}
			
		}catch(Exception ex){
		  System.out.println(" Error in funciton "+this.getClass().getSimpleName()+".getMasterMap(String query) "
					+ " "+ex.toString());
		}		
		return hMap;
	}
	
	public void updateMaster(ResultSet rs, CountryMaster master) {
		try {
		
		try {
			master.setId(rs.getInt(CountryCommon.ID));
		}catch(Exception sqlEx) {} 
		try {
			master.setName(rs.getString(CountryCommon.NAME));
		}catch(Exception sqlEx) {}
		try {
			master.setStatus(rs.getString(CountryCommon.STATUS));
		}catch(Exception sqlEx) {}		
		
		}catch(Exception ex){
			System.out.println("Error in funciton "+this.getClass().getSimpleName()+".updateMaster(ResultSet rs, Master master) "+ex.toString());
		}
    }
	
 }


