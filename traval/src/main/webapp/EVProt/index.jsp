<%
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>

<%@page import="idc.emp.EmpMaster"%>
<%@page import="idc.common.CommonMaster"%>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title><%= new CommonMaster().getPageTitle() %></title>
    <link rel="icon" href="" type="image/png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans|Spectral|Rubik|Sofia&effect=neon|outline|emboss|shadow-multiple">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css">
    <link rel="stylesheet" href="../appcommon/app.css?1">
    <link rel="stylesheet" href="./css/ecrn.css?24" />
    <link rel="stylesheet" href="./css/menu.css?3" />
    <link rel="stylesheet" href="./suggestion/css/suggestion.css?1" />
    <link rel="stylesheet" href="styles.css"> <!-- Add your custom styles here -->
</head>
<style>
.dropdown .w3-bar-item {
    margin-bottom: 5px; /* Adjust the value to control the amount of space */
}
/* Style for the dropdown container */
.dropdown {
    position: relative;
    display: inline-block;
    z-index: 2; /* Ensure dropdowns appear above other content */
}

/* Style for the dropdown button */
.dropdown button {
    background-color: #007BFF;
    color: grey;
    border: none;
    text-align: left;
    padding: 8px;
    width: 100%;
    cursor: pointer;
}



/* Show the dropdown content when the dropdown button is hovered over */



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
    
.dropdown button:active{
    background-color: lime;
}
/* Style for the dropdown content (hidden by default) */


/* Style for the dropdown options */
.dropdown-content {
    
    display:none;
   
     
    
   
}

/* Change color on hover */

/* Show the dropdown content when the dropdown button is hovered over */

.dropdown-wrapper {
    position: relative;
}
.LeftSideMenuTab.highlighted {
    background-color: #007BFF !important; /* Highlight color */
    color: white !important;
}
</style>

 
<body class="w3-light-grey">

    <form method="post" id="uploadForm" name="uploadForm" enctype="multipart/form-data" style="display:none;">
        <input type="file" id="uploadFile" name="uploadFile" />
    </form>

<!-- Top container -->
<jsp:include page="./header.jsp"></jsp:include>

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
            <h5><b>BV-5 DASHBOARD</b>
                <i class="fa fa-remove fa-fw cursorPointer close" id="hideMenu" style="float:right;" title="hide menu" onClick="hideMenu()"></i>
            </h5>

  </div>
  
 <div class="w3-bar-block mainMenuLinkDiv"></div>
             <a href="#" class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab" id="ecrnhome_LeftSideMenuTab" onClick="loadLinkContent('dashhome','contentDiv')">
                <b><i class="fa fa-home"></i> HOME</b>
            </a> &nbsp;&nbsp;<br>
    <!-- Dropdown Menu 1 -->
   
 <!-- Dropdown Menu 1 -->
<div class="dropdown-wrapper">
   <div class="dropdown">
    <button class="w3-bar-item w3-button w3-padding w3-blue LeftSideMenuTab" onclick="toggleDropdown('travelDropdown','travelTab')">
        <b><i class="fa fa-home"></i> PORTFOLIO DETAILS</b>
    </button>
    <div class="dropdown-content" id="travelDropdown">
        <button class="w3-white" onClick="loadLinkContent('EvInput','contentDiv')">ADD EV MOTOR DETAILS</button>
        <button class="w3-white" onClick="loadLinkContent('EvTable','contentDiv')">EXECUTIVE SUMMARY</button>
       
    </div>

    </div>
</div>




<% } %>


     

</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
 <div style="margin-left:300px;margin-top:43px;" id="mainStartContentDiv">
  
  <div class="w3-container" id="contentDiv" style="padding-top:1px !important;margin-top:1px !important;">
  
  </div>
  <!-- Footer -->     
  <!-- End page content -->  
</div>

<!--<jsp:include page="./include/modal.jsp"></jsp:include>-->

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

function toggleDropdown(dropdownId, tabId) {
    var dropdownContent = document.getElementById(dropdownId);

    // Remove 'highlighted' class from all tabs
    var tabs = document.querySelectorAll('.LeftSideMenuTab');
    tabs.forEach(function (tab) {
        tab.classList.remove('highlighted');
    });

    // Toggle 'highlighted' class for the clicked tab
    var clickedTab = document.getElementById(tabId);
    clickedTab.classList.toggle('highlighted');

    // Toggle dropdown content visibility
    if (dropdownContent.style.display === 'none' || dropdownContent.style.display === '') {
        dropdownContent.style.display = 'block';
    } else {
        dropdownContent.style.display = 'none';
    }
}
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
	   loadLinkContent('dashhome','contentDiv');
	   
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

