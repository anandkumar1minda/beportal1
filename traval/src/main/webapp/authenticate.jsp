<%
 if(request.getMethod().equalsIgnoreCase("POST")){
%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="idc.emp.*" %>
<jsp:useBean id="loginBean" scope="page" class="idc.login.LoginBean"></jsp:useBean>
<jsp:useBean id="EmpMaster" scope="page" class="idc.emp.EmpMaster"></jsp:useBean>
<jsp:useBean id="commonMaster" scope="page" class="idc.common.CommonMaster"></jsp:useBean>
 <%
 if(request.getParameter("empEmail")!=null && request.getParameter("token")!=null){
	if(request.getParameter("empEmail").trim().equalsIgnoreCase("") 
			|| request.getParameter("token").trim().equalsIgnoreCase("")){
		response.sendRedirect("./login.jsp");
	}
	else{		
		EmpMaster empMaster = loginBean.checkLoginAndUpdate(request);
		if(empMaster.getEmpId()!=0 || empMaster.getEmpName()!=null){
		
		session.setAttribute("EMAIL",empMaster.getEmpEmail());
		session.setAttribute("ID", empMaster.getEmpId());
		session.setAttribute("HASH", empMaster.getEmpHashKey());
		session.setAttribute("NAME", empMaster.getEmpName());
		session.setMaxInactiveInterval(6000);
		
		response.sendRedirect("./index.jsp");
		}
		else{		
		
		response.sendRedirect("./login.jsp?email="+request.getParameter("empEmail")+"&msg=token and email are not matched. Please check credential and try again.");
		
		   }	
	  }
 }
 else{
	 response.sendRedirect("./login.jsp");
   } 
}
%>




