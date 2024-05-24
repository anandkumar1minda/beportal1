package idc.location.country;

import javax.servlet.http.HttpServletRequest;

public class CountryMasterObjOnReq {
	
	HttpServletRequest request;
	public CountryMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
    public CountryMaster createObj() {
		
    	CountryMaster master = new CountryMaster();
		  try{
			  
			 master.setId(request.getParameter(CountryCommon.ID)==null?0:Integer.parseInt(request.getParameter(CountryCommon.ID)));		    
			 master.setName(request.getParameter(CountryCommon.NAME)==null?"":request.getParameter(CountryCommon.NAME));
			 
			 }
		  catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
			}
		  
		  return master;		  
      }
    
 }
