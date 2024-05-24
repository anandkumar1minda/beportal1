package idc.comdb.changereason;

import javax.servlet.http.HttpServletRequest;

public class ChReasonMasterObjOnReq {
	
	HttpServletRequest request;
	public ChReasonMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public ChReasonMaster createObj() {
		
		   ChReasonMaster master = new ChReasonMaster();
		   
		  try{
			  
			 master.setId(this.request.getParameter(ChReasonCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(ChReasonCommon.ID)));		    
			 master.setName(this.request.getParameter(ChReasonCommon.NAME)==null?"":this.request.getParameter(ChReasonCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Erro in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
 }


