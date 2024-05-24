package idc.location.office;

import javax.servlet.http.HttpServletRequest;

public class OfficeMasterObjOnReq {

	HttpServletRequest request;
	public OfficeMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
    public OfficeMaster createObj() {
		
    	OfficeMaster master = new OfficeMaster();
		  try{
			  
			 master.setId(request.getParameter(OfficeCommon.ID)==null?0:Integer.parseInt(request.getParameter(OfficeCommon.ID)));		    
			 master.setName(request.getParameter(OfficeCommon.NAME)==null?"":request.getParameter(OfficeCommon.NAME));
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }

}
