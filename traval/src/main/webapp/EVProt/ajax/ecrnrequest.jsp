<%@page import="idc.common.CommonMaster" %>
<%
   CommonMaster commonMaster = new CommonMaster();
if(request.getScheme().equals(commonMaster.getServerScheme()) &&
	 request.getServerName().equals(commonMaster.getServerName()) &&
	    request.getServerPort()==commonMaster.getServerPort()){	

if(request.getMethod().equalsIgnoreCase("POST")){
 if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>

<jsp:useBean id="ecrnCommonFaces" scope="page" class="ecrn.ops.EcrnCommonFaces"></jsp:useBean>

<% 
    out.println(ecrnCommonFaces.getJsonResult(request));

    }
  }
}
%>
