package idc.location;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import idc.connection.ConnectionMaster;
import idc.location.city.CityFaces;
import idc.location.country.CountryFaces;
import idc.location.office.OfficeFaces;
import idc.location.state.StateFaces;

public class LocationFaces {

	Statement st;
	public LocationFaces() {}
	
	public LocationFaces(Statement st) {
		this.st = st;
	}
	
	public ArrayList<LocMaster> getCityArr(){
		
		ArrayList<LocMaster> locArr = new ArrayList<LocMaster>();
		try {
		 Connection conn = new ConnectionMaster().getMindaConnection();
		 Statement st = conn.createStatement();
		 
		 String query = "SELECT cityId, cityName FROM prd_mst_city WHERE CityStatus='A' order by cityName";
		 ResultSet rs = st.executeQuery(query);
		 
		 while(rs.next()) {
		
			 LocMaster locMaster = new LocMaster();
			 City city = new City();
			 
			 city.setId(rs.getInt("cityId"));
			 city.setName(rs.getString("cityName"));
			
			 locMaster.setCity(city);
			 locArr.add(locMaster);
		 }
		 
		 st.close();
		 conn.close();
		}catch(Exception ex) {
		  System.out.println("Error in function :: "+this.getClass().getName()+".getLocationArr "+ex.toString());	
		}		
		return locArr;
	}
	
	public HashMap<String,String> getLocMap(){
		
		HashMap<String,String> locMap =  new HashMap<String,String>();
		try {
		
		Connection conn = new ConnectionMaster().getMindaConnection();
	    Statement st = conn.createStatement();
			 
		String query = "SELECT cityId, StateId, cityName , CityStatus from prd_mst_city ";
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next()){
			locMap.put("SID-"+rs.getInt("StateId")+"-"+rs.getInt("cityId"), rs.getString("cityName"));
			locMap.put("CITY-"+rs.getInt("cityId"), rs.getString("cityName"));
		}
		
		      query = "SELECT BvId, BvNAME from prd_mst_bu_vertical ";
		      rs = st.executeQuery(query);
		
		while(rs.next()){
			locMap.put("BV-"+rs.getInt("BvId"), rs.getString("BvNAME"));			
		}
		
		 st.close();
		 conn.close();
		}catch(Exception ex) {
			System.out.println("Error in function "+this.getClass().getName()+".getLocMap "+ex.toString());
		}		
		return locMap;
	}
	
  public HashMap<String,String> getMapAll(){
		
		HashMap<String,String> locMap =  new HashMap<String,String>();
		try {
				 
	    locMap.putAll(new CountryFaces(this.st).getAllMasterMap());
	    locMap.putAll(new StateFaces(this.st).getAllMasterMap());
	    locMap.putAll(new CityFaces(this.st).getAllMasterMap());
	    locMap.putAll(new OfficeFaces(this.st).getAllMasterMap());
	    
	//  System.out.println(locMap);
		
		}catch(Exception ex) {
			System.out.println("Error in function "+this.getClass().getName()+".getLocMap "+ex.toString());
		}
		
		return locMap;
		
	 }  
  
  public LocationMaster getActiveMasterList(){
		
	     LocationMaster locMaster = new LocationMaster();
		try {				 
			
			locMaster.setCountryMasterList(new CountryFaces(st).getActiveMasterList());
			locMaster.setStateMasterList(new StateFaces(st).getActiveMasterList());
			locMaster.setCityMasterList(new CityFaces(st).getActiveMasterList());
			locMaster.setOfficeMasterList(new OfficeFaces(st).getActiveMasterList());
			
		
		}catch(Exception ex) {
			System.out.println("Error in function "+this.getClass().getName()+".getLocMap "+ex.toString());
		}
		
		return locMaster;
		
	 }  
  
 }



