package idc.comdb.bv;

import javax.servlet.http.HttpServletRequest;

public class BvMasterObjOnReq {
	
	HttpServletRequest request;
	public BvMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}
	
	public BvMaster createObj() {
		
		   BvMaster master = new BvMaster();
		   
		  try{
			  
		    master.setId(this.request.getParameter(BvCommon.ID)==null?0:Integer.parseInt(this.request.getParameter(BvCommon.ID)));		    
		    master.setName(this.request.getParameter(BvCommon.NAME)==null?"":this.request.getParameter(BvCommon.NAME));	
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".BvMasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
	
 }


