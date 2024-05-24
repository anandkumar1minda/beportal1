<%
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>
<%@page import="idc.common.CommonMaster"%>
 <%
  CommonMaster commonMaster = new CommonMaster();
 %>
 
<div class="w3-bar w3-top w3-black w3-large" 
     style="z-index:4;background:#107fee !important;color:white !important;padding:2px;">
 <span>&nbsp;</span>
  <span><a href="../"><img src="../images/mindalogo1.png"></img></a></span>
  
 <span style="text-decoration: none;margin-top:5px;cursor:pointer;" title="Open Menu" id="ecrnMenuBars" onclick="showMenu()">
    <i class="fa fa-bars" style="font-size:24px"></i>
 </span>
 
 <span class="commonTextShadowWhite" style='color:yellow;font-size:20px !important;margin-left:20px;'><%=commonMaster.getUatMsg()%></span>
 
 <span class="w3-animate-left applogout">
 
    <span style="margin-right:50px; font-size:16px;font-weight: normal;">
    <a href="<%=commonMaster.getStartFileURL()%>core_team.png" style="text-decoration: none;" target="_new">Core Team</a> &nbsp; 
    <a href="<%=commonMaster.getStartFileURL()%>know_your_approvers.pptx" style="text-decoration: none;" target="_new">Know Your Approvers</a> &nbsp; 
    <a href="<%=commonMaster.getStartFileURL()%>ecrn_testers_manual.ppsx" style="text-decoration: none;" target="_new">Testers Manual</a> &nbsp; 
    <a href="<%=commonMaster.getStartFileURL()%>ecrn_user_tester_manual.pdf" style="text-decoration: none;" target="_new">Process Guidelines</a></span> 
    <a href="../logout.jsp" style="text-decoration: none;">Logout <i class="fa fa-sign-out"></i></a>
 </span>
  
  <button class="w3-bar-item w3-button w3-right w3-hide-large
          w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> Menu</button>
</div>

<% } 
else {
   response.sendRedirect("../login.jsp");
 }
%>
