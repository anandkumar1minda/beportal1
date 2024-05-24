package idc.location;

import javax.servlet.http.HttpServletRequest;

import idc.location.city.CityMasterObjOnReq;
import idc.location.country.CountryMasterObjOnReq;
import idc.location.office.OfficeMasterObjOnReq;
import idc.location.state.StateMasterObjOnReq;

public class LocationMasterObjOnReq {

	HttpServletRequest request;
	 public LocationMasterObjOnReq(HttpServletRequest request){
			this.request = request;
		}
		
	    public LocationMaster createObj() {
			
	    	LocationMaster master = new LocationMaster();
			  try{
				  
				 master.setCityMaster(new CityMasterObjOnReq(request).createObj());
				 master.setCountryMaster(new CountryMasterObjOnReq(request).createObj());
				 master.setOfficeMaster(new OfficeMasterObjOnReq(request).createObj());
				 master.setStateMaster(new StateMasterObjOnReq(request).createObj());
				 
				 }
				catch(Exception ex){
					System.out.println("Error in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
				}
			  
			  return master;		  
	      }

}
