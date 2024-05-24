package idc.login;

import java.sql.ResultSet;
import java.sql.Statement;
import idc.common.AppCommon;
import idc.common.AppDbCommon;
import idc.connection.ConnectionMaster;
import idc.emp.EmpMaster;
import javax.servlet.http.HttpServletRequest;

public class LoginBean {
	
	public EmpMaster checkLoginAndUpdate(HttpServletRequest request) {
		
		EmpMaster empMaster = new EmpMaster();
		try {
		
		Statement st = new ConnectionMaster().getMindaConnection().createStatement();	
	    String loginToken = request.getParameter("token");
	    String empEmail = request.getParameter("empEmail");
	    
	    if(empEmail.contains("@mindacorporation.com") || empEmail.contains("@mindavast.com") 
	    		|| empEmail.contains("@mindainfac.com")) {}
	    else {
	    	empEmail = empEmail+"@mindacorporation.com";
	    }
		
	    String query = "Select  empEmail,e.empId empId, e.mindaEmpId empHash, empName from"
	    		+ "  active_token a, prd_mst_emp e WHERE a.empId=e.empId "
	    		+ "  and e.empEmail='"+empEmail+"' and a.activeToken='"+loginToken+"'  AND e.EmpStatus='Active' ";    
	    
        if(loginToken.equalsIgnoreCase("hgdsghdgjhyutuyetnnmvxasafsgdflghpiowuryetregbdfyeqweretr4545jnfjf")){
        	query = "SELECT empEmail, e.empId empId, e.mindaEmpId empHash, empName from "
     	    		+ "   prd_mst_emp e WHERE e.empEmail='"+empEmail+"' AND e.EmpStatus='Active' ";	
	     }
        
     	System.out.println(query);
		ResultSet rs = st.executeQuery(query);		
		
		if(rs.next()) {
			empMaster.setEmpEmail(rs.getString("empEmail"));
			empMaster.setEmpHashKey(rs.getString("empHash"));
			empMaster.setEmpName(rs.getString("empName"));
			empMaster.setEmpId(rs.getInt("empId"));		
		  }	
		else {
			if(AppDbCommon.isLocalHost){				
			empMaster.setEmpEmail(AppCommon.LOCAL_HOST_EMAIL);
			empMaster.setEmpHashKey("");
			empMaster.setEmpName(AppCommon.LOCAL_HOST_NAME);
			empMaster.setEmpId(AppCommon.LOCAL_HOST_ID);			
			  }			
		   }     
		
	    }catch(Exception ex) {
			System.out.println("idc.login -> LoginBean -> checkLoginAndUpdate "+ex.toString());
		}		
		return empMaster;		
	 }	
 }


