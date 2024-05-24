package idc.emp;

import javax.servlet.http.HttpServletRequest;

public class EmpMasterOnReq {

	public EmpMaster createObj(HttpServletRequest request) {
		
		EmpMaster master = new EmpMaster();
	  try{
			master.setEmpEmail(""+request.getSession().getAttribute("EMAIL"));
			master.setEmpHashKey(""+request.getSession().getAttribute("HASH"));
			master.setEmpId(Integer.parseInt(""+request.getSession().getAttribute("ID")));
			master.setEmpName(""+request.getSession().getAttribute("NAME"));
		 }
		catch(Exception ex){
			System.out.println("Error in funciton idc.emp -> EmpMasterOnReq -> createObj "+ex.toString());
		}
	  return master;
	 }
 }
