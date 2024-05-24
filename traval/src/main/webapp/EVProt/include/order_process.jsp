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
<style>
<style>
.dropdown .w3-bar-item {
    margin-bottom: 5px; /* Adjust the value to control the amount of space */
}
/* Style for the dropdown container */
.dropdown {
    position: relative;
    display: inline-block;
    border: 1px solid #ccc; /* Add border to the dropdown container */
}

/* Style for the dropdown button */
.dropdown button {
    background-color: #007BFF;
    color: white;
    border: none;
    text-align: left;
    padding: 8px;
    width: 100%;
    cursor: pointer;
}

/* Style for the dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    border: 1px solid #ccc; /* Add border to the dropdown content */
    border-top: none; /* Remove top border to avoid double borders */
}

/* Style for the dropdown options */
.dropdown-content a {
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    color: #333;
}

/* Change color on hover */
.dropdown-content a:hover {
    background-color: #ddd;
}

/* Show the dropdown content when the dropdown button is hovered over */
.dropdown:hover .dropdown-content {
    display: block;
}


/* Style for the dropdown container */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Style for the dropdown button */
.dropdown button {
    background-color: #007BFF;
    color: white;
    border: none;
    text-align: left;
    padding: 8px;
    width: 100%;
    cursor: pointer;
}

/* Style for the dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Style for the dropdown options */
.dropdown-content a {
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    color: #333;
}

/* Change color on hover */
.dropdown-content a:hover {
    background-color: #ddd;
}

/* Show the dropdown content when the dropdown button is hovered over */
.dropdown:hover .dropdown-content {
    display: block;
}
</style>
 
<body class="w3-light-grey">

<form method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" style="display:none;">
  <input type="file" id="uploadFile" name="uploadFile" />
</form>

<!-- Top container -->
<jsp:include page="../header.jsp"></jsp:include>

<!-- Sidebar/menu -->

  <div class="w3-container">
       <h5><b>TRAVEL RECORD AUTOMATION (BV-5)</b> <i class="fa fa-remove fa-fw cursorPointer close" id="hideMenu"  
           style="float:right;" title="hide menu" onClick="hideMenu()"></i>
       </h5>
  </div>
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
       <h5><b>BV-5 DASHBOARD</b> <i class="fa fa-remove fa-fw cursorPointer close" id="hideMenu"  
           style="float:right;" title="hide menu" onClick="hideMenu()"></i>
       </h5>
  </div>
  <div class="w3-bar-block mainMenuLinkDiv">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><b><i class="fa fa-remove fa-fw"></i>Close Menu</b></a>
    
    <!-- Dropdown Menu 1 -->
    <a href="#" class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab" id="ecrnhome_LeftSideMenuTab" onClick="loadLinkContent('dashhome','contentDiv')"><b><i class="fa fa-home"></i> HOME</b></a>
    <div class="dropdown">
    
        <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-home"></i> TRAVEL DETAILS</b></button>
        <div class="dropdown-content">
            
            <a href="#" onClick="loadLinkContent('NewNewIndex','contentDiv')">ADD NEW TRAVEL</a>
            <a href="#" onClick="loadLinkContent('travel_retrive','contentDiv')">TRAVEL REPORT</a>
            <a href="#" onClick="loadLinkContent('plantVisitReport','contentDiv')">PLANT VISIT REPORT</a>
            <a href="#" onClick="loadSearch('totalSummery','contentDiv')">TOTAL SUMMERY</a>
        </div>
    </div>
    
    <!-- Dropdown Menu 2 -->
    <div class="dropdown">
        <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-user"></i> CUSTOMER CONNECT</b></button>
        <div class="dropdown-content">
            
            <a href="#" onClick="loadSearch('NewCustIndex','contentDiv')">ADD CUSTOMER DETAILS</a>
            <a href="#" onClick="loadSearch('Cust_Planned','contentDiv')">CUSTOMER PLANNED DATA</a>
            <a href="#" onClick="loadSearch('cust_retrive','contentDiv')">CUSTOMER ACTUAL DATA</a>
             <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')">MONTHLY DATA</a>
             <a href="#" onClick="loadSearch('Cust_Final','contentDiv')">FINAL DATA</a>
           

        </div>
    </div>
      <!-- Dropdown Menu 3 -->
    <div class="dropdown">
        <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-university"></i> GOVERNMENT RELATION</b></button>
        <div class="dropdown-content">
            
            <a href="#" onClick="loadSearch('NewCustIndex','contentDiv')"></a>
            <a href="#" onClick="loadSearch('cust_retrive','contentDiv')"></a>
             <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')"></a>
           

        </div>
    </div>  <!-- Dropdown Menu 4 -->
    <div class="dropdown">
        <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-calendar"></i> AWARD RECORD </b></button>
        <div class="dropdown-content">
            
            <a href="#" onClick="loadSearch('NewCustIndex','contentDiv')"></a>
            <a href="#" onClick="loadSearch('cust_retrive','contentDiv')"></a>
             <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')"></a>
           

        </div>
    </div>
      <!-- Dropdown Menu  5-->
    <div class="dropdown">
        <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-newspaper-o"></i> ORDER WON</b></button>
        <div class="dropdown-content">
            
            <a href="#" onClick="loadSearch('order_new','contentDiv')">ADD NEW ORDER</a>
            <a href="#" onClick="loadSearch('order_table','contentDiv')">TOTAL TABLE</a>
             <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')"></a>
           

        </div>
    </div>
    
    <!-- Additional Menu Items -->
    <!-- Add more dropdowns or menu items as needed -->
</div>

</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;" title="close side menu" id="myOverlay"></div>

</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
 <div style="margin-left:300px;margin-top:43px;" id="mainStartContentDiv">
  
  <div class="w3-container" id="contentDiv" style="padding-top:1px !important;margin-top:1px !important;">
  
  </div>
  <%
    String order_no = request.getParameter("order_no");
    String division = request.getParameter("division");
    String customer = request.getParameter("customer");
    String product_seg = request.getParameter("product_seg");
    String date_of_rec = request.getParameter("date_of_rec");
    String amount = request.getParameter("amount");
    String sop_date = request.getParameter("sop_date");
    
     Connection conn = null;
    PreparedStatement stmt = null;
    
     try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");
    
        String sql = "INSERT INTO travel.order_won  VALUES (?, ?, ?, ? ,? ,? ,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, order_no);
        stmt.setString(2, division);
        stmt.setString(3, customer);
        stmt.setString(4, product_seg);
        stmt.setString(5, date_of_rec);
        stmt.setString(6, amount);
        stmt.setString(7, sop_date);
        
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
</div>
</div>
</nav>

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


       
       
        
 
   