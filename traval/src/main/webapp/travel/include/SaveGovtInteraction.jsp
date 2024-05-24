<%@page import="idc.emp.EmpMaster"%>
<%@page import="idc.common.CommonMaster"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="mailer.EcrnMailer"%>
<%@page import="mailer.MailerMaster"%>
<%@page import="org.apache.commons.mail.HtmlEmail" %>
<%@page import="mailer.MailerMaster"%>
<!DOCTYPE html>
<html>
<head>
    <title>Save Government Interaction</title>
</head>

<% 
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>

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
    .dropdown .w3-bar-item {
        margin-bottom: 5px;
    }

    /* Style for the dropdown container */
    .dropdown {
        position: relative;
        display: inline-block;
        border: 1px solid #ccc;
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
        border: 1px solid #ccc;
        border-top: none;
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
    
    /* Additional CSS for main content positioning */
    .main-content {
        margin-left: auto; /* Center-align content horizontally */
        margin-top: auto;  /* Center-align content vertically */
        padding: 20px;
    }
</style>

<body class="w3-light-grey">
    <form method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" style="display:none;">
        <input type="file" id="uploadFile" name="uploadFile" />
    </form>

    <!-- Top container -->
    <jsp:include page="../header.jsp"></jsp:include>

    <!-- Sidebar/menu -->
  <!--   <div class="w3-container">
        <h5><b>DASHBOARD (BV-5)</b> <i class="fa fa-remove fa-fw cursorPointer close" id="hideMenu"  
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
                <a href="#" onClick="loadSearch('NewGovtIndex','contentDiv')">ADD GOVERNMENT RELATIONS</a>
                <a href="#" onClick="loadSearch('Govt_table','contentDiv')">GOVERNMENT DATA</a>
            </div>
        </div>

        <!-- Dropdown Menu 4 -->
        <div class="dropdown">
            <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-calendar"></i> EVENT PARTICIPATION</b></button>
            <div class="dropdown-content">
                <a href="#" onClick="loadSearch('NewCustIndex','contentDiv')"></a>
                <a href="#" onClick="loadSearch('cust_retrive','contentDiv')"></a>
                <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')"></a>
            </div>
        </div>

        <!-- Dropdown Menu 5 -->
        <div class="dropdown">
            <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab"><b><i class="fa fa-newspaper-o"></i> MEDIA PARTICIPATION</b></button>
            <div class="dropdown-content">
                <a href="#" onClick="loadSearch('NewCustIndex','contentDiv')"></a>
                <a href="#" onClick="loadSearch('cust_retrive','contentDiv')"></a>
                <a href="#" onClick="loadSearch('Cust_Monthly','contentDiv')"></a>
            </div>
        </div>

        <!-- Additional Menu Items -->
        <!-- Add more dropdowns or menu items as needed -->
  
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
 <div class="center-content" style="margin-left: 300px; margin-top: 43px; padding: 20px; text-align: center;" id="mainStartContentDiv">
    <%
    Connection conn = null;
    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "FGh%4#45ndF32");

        // Get form parameters
        String date = request.getParameter("date");
        String type = request.getParameter("type");
        String GovtPart = request.getParameter("GovtPart");
        String GovtMind = request.getParameter("GovtMind");
        String Loc = request.getParameter("Loc");
        String Desc	= request.getParameter("Desc");
        

        // Create SQL INSERT statement
        String insertSQL = "INSERT INTO govt_interaction (date, type, GovtPart, GovtMind, Loc, `Desc`) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(insertSQL);
        preparedStatement.setString(1, date);
        preparedStatement.setString(2, type);
        preparedStatement.setString(4, GovtPart);
        preparedStatement.setString(3, GovtMind);
        preparedStatement.setString(5, Loc);
        preparedStatement.setString(6, Desc);
      
		
        // Execute the INSERT statement
        preparedStatement.executeUpdate();
    %>
    <h1>Data Saved Successfully</h1>
    <%
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
        e.printStackTrace();

    %>
    <h1>Error Saving Data</h1>
    <%
    } finally {
        // Close the database connection
        if (conn != null) {
            conn.close();
        }
    }
    }
    %>
  <button onclick="goBack()" class="w3-button w3-blue w3-hover-light-blue w3-round-xxlarge">
    Go Back
</button>
</div>

</body>
<script>
function goBack() {
    window.history.back(); // This will take you to the previous page in the browsing history.
}
</script>
</html>
                