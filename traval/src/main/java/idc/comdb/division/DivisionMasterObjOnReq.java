package idc.comdb.division;

import javax.servlet.http.HttpServletRequest;

public class DivisionMasterObjOnReq {
	
	HttpServletRequest request;
	public DivisionMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public DivisionMaster createObj() {
		
		   DivisionMaster master = new DivisionMaster();
		   
		  try{
			  
			 master.setId(this.request.getParameter(DivisionCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(DivisionCommon.ID)));		    
			 master.setName(this.request.getParameter(DivisionCommon.NAME)==null?"":this.request.getParameter(DivisionCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
  }
