package idc.comdb.phase;

import javax.servlet.http.HttpServletRequest;

public class PhaseMasterObjOnReq {

	HttpServletRequest request;
	public PhaseMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public PhaseMaster createObj() {
		
		   PhaseMaster master = new PhaseMaster();
		   
		  try{
			  
			 master.setId(this.request.getParameter(PhaseCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(PhaseCommon.ID)));		    
			 master.setName(this.request.getParameter(PhaseCommon.NAME)==null?"":this.request.getParameter(PhaseCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".PhaseMasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
 }


