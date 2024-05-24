package idc.location.city;

import javax.servlet.http.HttpServletRequest;

public class CityMasterObjOnReq {
	
	HttpServletRequest request;
	public CityMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public CityMaster createObj() {
		
		CityMaster master = new CityMaster();
		  try{
			  
			 master.setId(this.request.getParameter(CityCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(CityCommon.ID)));		    
			 master.setName(this.request.getParameter(CityCommon.NAME)==null?"":this.request.getParameter(CityCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".CityMasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
 }
