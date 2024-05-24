package idc.location.state;

import javax.servlet.http.HttpServletRequest;

public class StateMasterObjOnReq {
	
	HttpServletRequest request;
	public StateMasterObjOnReq(HttpServletRequest request){
		this.request = request;
	}

	public StateMaster createObj() {
		
		StateMaster master = new StateMaster();
		  try{
			  
			 master.setId(request.getParameter(StateCommon.ID)==null?0:Integer.parseInt(request.getParameter(StateCommon.ID)));		    
			 master.setName(request.getParameter(StateCommon.NAME)==null?"":request.getParameter(StateCommon.NAME));
			 
			 }
			catch(Exception ex){
				System.out.println("Error in funciton "+this.getClass().getName()+".StateMasterObjOnReq -> createObj "+ex.toString());
			}		  
		  
		  return master;		  
      }
}
