<jsp:useBean id="commonMaster"  scope="page"  class="idc.common.CommonMaster"></jsp:useBean>
 
<header class="w3-container w3-blue" style="padding:2px;">
  <span>&nbsp;</span>
  <span><a href=""><img src="./images/mindalogo1.png"></img></a></span>
  <span style='color:yellow;font-weight:bold;font-size:17px;margin-left:20px;'><%=commonMaster.getUatMsg()%></span>
  <% if(session.getAttribute("ID")!=null && session.getAttribute("NAME")!=null){ %>
  <span class="w3-animate-left applogout">
  <a href="./logout.jsp" style="text-decoration: none;">Logout <i class="fa fa-sign-out"></i></a>
  </span>
  <% } %>
</header>