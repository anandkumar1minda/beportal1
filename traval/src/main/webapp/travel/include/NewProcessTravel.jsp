<%@page import="mailer.MailerMaster"%>
<%@page import="mailer.EcrnMailer"%>

<%@page import="org.apache.commons.mail.HtmlEmail" %>
<% 
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>

<%@page import="idc.emp.EmpMaster"%>
<%@page import="idc.common.CommonMaster"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title><%=new CommonMaster().getPageTitle()%></title>
<link rel="icon" href="" type="image/png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans|Spectral|Rubik|Sofia&effect=neon|outline|emboss|shadow-multiple'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css">
<link rel="stylesheet" href="../appcommon/app.css?1">
<link rel="stylesheet" href="./css/ecrn.css?24" />
<link rel="stylesheet" href="./css/menu.css?3" />
<link rel="stylesheet" href="./suggestion/css/suggestion.css?1" />
</head>
 
<body class="w3-light-grey">

<form method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" style="display:none;">
  <input type="file" id="uploadFile" name="uploadFile" />
</form>

<!-- Top container -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:1;width:300px;background:#000 !important;color:#fff !important;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="../images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span class="commonTextShadowWhite" style="font-weight: normal !important">Welcome, <%=session.getAttribute("NAME")%></span><br>
   <!-- <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a> -->
    </div>
  </div>
  <hr>
  <div class="w3-container">
       <h5><b>TRAVEL RECORD AUTOMATION (BV-5)</b> <i class="fa fa-remove fa-fw cursorPointer close" id="hideMenu"  
           style="float:right;" title="hide menu" onClick="hideMenu()"></i>
       </h5>
  </div>
  <div class="w3-bar-block mainMenuLinkDiv">
  
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><b><i class="fa fa-remove fa-fw"></i>Close Menu</b></a>
    <a href="#" class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab" id="ecrnhome_LeftSideMenuTab" onClick="loadLinkContent('ecrnhome','contentDiv')"><b><i class="fa fa-home"></i> HOME</b></a>
<!-- <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="dashboard_LeftSideMenuTab"   onClick="loadLinkContent('dashboard','contentDiv')"><b><i class="fa fa-hand-o-right"></i> ECRN DASHBOARD</b></a> -->
     <!--<a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="dashboard_LeftSideMenuTab"   onClick="loadLinkContent('ecrndeptapprovalmatrix','contentDiv')"><b><i class="fa fa-hand-o-right"></i>APPROVAL MATRIX</b></a>
     <!--<a href="#" class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab" id="ecrnreqform_LeftSideMenuTab" onClick="loadLinkContent('ecrnreqform','contentDiv')"><b><i class="fa fa-hand-o-right"></i>
     INITIATION STAGE<br/><span style='margin-left:20px;'>(ECRN NEW REQUEST)</span></b></a>
     
     <!--<a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="mypendings_LeftSideMenuTab"  onClick="loadLinkContent('mypendings','contentDiv')"><b><i class="fa fa-hand-o-right"></i> MY PENDING ACTIONS</b></a>
     <!--<a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="hodpendings_LeftSideMenuTab"  onClick="loadLinkContent('hodpendings','contentDiv')"><b><i class="fa fa-hand-o-right"></i>HOD STAGE</b></a>     
     <!--<a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="feasibility_LeftSideMenuTab"  onClick="loadLinkContent('feasibility','contentDiv')"><b><i class="fa fa-hand-o-right"></i> LIVE NOTIFICATION STAGE</b></a>
     <!--<a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="myapprovers_LeftSideMenuTab"  onClick="loadLinkContent('myapprovers','contentDiv')"><b><i class="fa fa-hand-o-right"></i> FEASIBILITY STAGE</b></a>
   <!-- <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="searchecrn_LeftSideMenuTab"   onClick="loadLinkContent('searchecrn','contentDiv')"><b><i class="fa fa-search-plus"></i> SEARCH</b></a>-->
<!-- <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="ecrnreqform_LeftSideMenuTab" onClick="loadLinkContent('dashboardecrn','contentDiv_test')"><i class="fa fa-diamond fa-fw"></i> Dashboard</a> -->   
    <!--  <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="myecrnreq_LeftSideMenuTab"    onClick="loadSearch('myecrnreq','contentDiv')"><b><i class="fa fa fa-user-o"></i> MY CHANGE REQUEST</b></a>-->
    <!--  <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="suggestion_LeftSideMenuTab"   onClick="loadLinkContent('suggestion','contentDiv')"><b><i class="fa fa-hand-o-right"></i> SUGGESTION BOX</b></a>-->
    <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="travel_LeftSideMenuTab"   onClick="loadLinkContent('NewNewIndex','contentDiv')"><b><i class="fa fa-hand-o-right"></i> Travel</b></a>
     <a href="#" class="w3-bar-item w3-button w3-padding LeftSideMenuTab" id="travelData_LeftSideMenuTab"   onClick="loadLinkContent('travel_retrive','contentDiv')"><b><i class="fa fa-hand-o-right"></i> Travel Report </b></a>
        
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
 <div style="margin-left:300px;margin-top:43px;" id="mainStartContentDiv">
  
  <div class="w3-container" id="contentDiv" style="padding-top:1px !important;margin-top:1px !important;">
  
  </div>
  <!-- Footer --> 
  <%
    String user_id = request.getParameter("user_id");
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    String days = request.getParameter("days");
    String location = request.getParameter("location");
    String purpose = request.getParameter("purpose");
    
    HtmlEmail email=new HtmlEmail();
    MailerMaster mailerMaster = new MailerMaster();
    mailerMaster.setHtmlEmail(email);
    mailerMaster.setSubject("New Travel Journey Added");
    String greetingMessage = "Hope you're having a great day, A new travel has been added to the BV-5 Dashboard, the details have been added below:";
    String returnStr = "<html>"
        + "<head>"
        + "<style>"
        + "table {"
        + "width: 100%;"
        + "border-collapse: collapse;"
        + "margin-top: 20px;"
        + "}"
        + "th, td {"
        + "padding: 10px;"
        + "text-align: left;"
        + "border-bottom: 1px solid #ddd;"
        + "}"
        + "th {"
        + "background-color: #f2f2f2;"
        + "font-weight: bold;"
        + "}"
        + "tr:hover {"
        + "background-color: #f5f5f5;"
        + "}"
        + "</style>"
        + "</head>"
        + "<body>"
        + "<p>" + greetingMessage + "</p>"
        + "<table border='1'>"
        + "<tr>"
        + "<th>fromDate</th>"
        + "<th>toDate</th>"
        + "<th>days</th>"
        + "<th>location</th>"
        + "<th>purpose</th>"
        + "</tr>"
        + "<tr>"
        + "<td>" + fromDate + "</td>"
        + "<td>" + toDate + "</td>"
        + "<td>" + days + "</td>"
        + "<td>" + location + "</td>"
        + "<td>" + purpose + "</td>"
        + "</tr>"
        + "</table>"
        + "</body>"
        + "</html>";


    
    
    
   mailerMaster.setFullMailContent(returnStr);
   mailerMaster.setToList("siddharth.joshi@mindacorporation.com");
   new EcrnMailer().sendCommonEcrnHtmlMail(mailerMaster);
   
    

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");

        // Create the SQL query
        String sql = "INSERT INTO travel.travel_request  VALUES (?, ?, ?, ? ,? ,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, user_id);
        stmt.setString(2, fromDate);
        stmt.setString(3, toDate);
        stmt.setString(4, days);
        stmt.setString(5, location);
        stmt.setString(6, purpose);
       // (userid, From, To, Days,)
        

        // Execute the query
        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Data successfully inserted into the database.");
        } else {
            out.println("Error inserting data into the database.");
        }
       out.println("<div style=\"margin-top: 20px;\">");
       out.println("<button onclick=\"goBack()\">Go Back</button>");
        
        
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        // Close resources
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>    
  <!-- End page content -->  
</div>

<!--<jsp:include page="../include/modal.jsp"></jsp:include>-->

<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript" 
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous">
</script>

<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="./js/fileupload.js?1"></script>
<script type="text/javascript" src="./js/coordinator.js?11"></script>
<script type="text/javascript" src="./suggestion/js/suggestion.js?6"></script>
<script type="text/javascript" src="./js/ecrn.js?36"></script> 
<script type="text/javascript" src="./js/fixheader.js?4"></script>

<script>
    function goBack() {
        window.history.back();
    }
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");
// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");
// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block'){
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }  
}

// Close the sidebar with the close button
 function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
 }

$('#uploadFile').on('change', uploadFile);

$(document).ready(function(){ 
	 
	 const url = new URL(window.location.href);
	 const urlPage = url.searchParams.get('main');	
	
	if(urlPage==null){	
	   loadLinkContent('ecrnhome','contentDiv');
	}
	else{
	 	   
	 const ecrnId = url.searchParams.get('ecrnid');	
	 const updateAction = url.searchParams.get('updateAction');	
	
   if(ecrnId){
	 if(updateAction==='myFeasibility'){
		 loadLinkContent(urlPage,'contentDiv');
		 updateEcrn(ecrnId,updateAction);
	   }	
	else if(updateAction==='myApprovals'){
		 hilightTab("LeftSideMenuTab",urlPage+"_LeftSideMenuTab","w3-blue");
		 openapprovals(ecrnId,updateAction);
	     }
	   }
    else{
	     loadLinkContent(urlPage,'contentDiv');
       }
    }
	
	url.searchParams.delete('main');
	url.searchParams.delete('ecrnid');
	url.searchParams.delete('updateAction');
	
	window.history.replaceState(null, null, url);
	
 });

</script>

</body>
</html>
<% %>
<% 
  } 
else{  
  response.sendRedirect("../login.jsp");
}
%>

