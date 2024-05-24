package idc.comdb.reqtype;

import javax.servlet.http.HttpServletRequest;

public class ReqTypeMasterObjOnReq {

	HttpServletRequest request;
	public ReqTypeMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public ReqTypeMaster createObj() {
		
		ReqTypeMaster master = new ReqTypeMaster();
		  try{
			  
			 master.setId(this.request.getParameter(ReqTypeCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(ReqTypeCommon.ID)));		    
			 master.setName(this.request.getParameter(ReqTypeCommon.NAME)==null?"":this.request.getParameter(ReqTypeCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".ReqTypeMasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
	
}
