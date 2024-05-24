 package idc.customer;

import javax.servlet.http.HttpServletRequest;

public class CustMasterObjOnReq {
	 
	 HttpServletRequest request;
	 public CustMasterObjOnReq(HttpServletRequest request){
			this.request = request;
		}
		
	    public CustMaster createObj() {
			
	    	CustMaster master = new CustMaster();
			  try{
				  
				 master.setId(request.getParameter(CustCommon.ID)==null?0:Integer.parseInt(request.getParameter(CustCommon.ID)));		    
				 master.setName(request.getParameter(CustCommon.NAME)==null?"":request.getParameter(CustCommon.NAME));
				 master.setAbbr(request.getParameter(CustCommon.ABBR)==null?"":request.getParameter(CustCommon.ABBR));
				 master.setCategory(request.getParameter(CustCommon.CAT)==null?"":request.getParameter(CustCommon.CAT));
				 master.setSubCategory(request.getParameter(CustCommon.SUBCAT)==null?"":request.getParameter(CustCommon.SUBCAT));
				 
				 }
				catch(Exception ex){
					System.out.println("Error in funciton "+this.getClass().getName()+".MasterObjOnReq -> createObj "+ex.toString());
				}
			  
			  return master;		  
	      }

 }
