<%@page import="idc.common.CommonMaster"%>
<%
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){
%>    

<style>
/* Styles for the buttons */
.add-buttons {
    position: fixed;
    bottom: 40px; /* Adjust the distance from the bottom as needed */
    left: calc(50% + 120px);
    transform: translateX(-50%);
    text-align: center;
}

.add-buttons button {
    padding: 20px 40x;
    background-color: #007bff; /* Button background color */
    color: #fff; /* Button text color */
    border: 0px;
    border-radius: 10px;
    margin: 10px;
    cursor: pointer;
    font-size: 20	px;
}

/* Style for the "Add Customer" button */
.add-customer-button {
    background-color: #007bff; /* Customize the button color if needed */
}

/* Style for the "Add Travel" button */
.add-travel-button {
    background-color: #28a745; /* Customize the button color if needed */
}

/* Style for other buttons */
.add-govt-button,
.add-event-button,
.add-media-button {
    background-color: #ff4500; /* Customize the button color if needed */
}

#ecrnRequestForm {
    background-size: cover; /* You can adjust this property as needed */
}
</style>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<form id="ecrnRequestForm" class="w3-container w3-card-4 w3-text-black w3-margin" 
   style="background-color:white;box-shadow: 10px red !important;"> 
    <div class="w3-row w3-section">
        <img src="./css/image/DashHome.png" alt="Image not found" style="width:99%;margin:70px 0px;">
    </div>
</form>

<div class="add-buttons">
    <button class="add-customer-button" onclick="redirectToCustomerPage()">Add Customer</button>
    <button class="add-travel-button" onclick="redirectToTravelPage()">Add Travel</button>
    <button class="add-govt-button" onclick="redirectToGovtRelationsPage()">Add Government Relations</button>
    <button class="add-event-button" onclick="redirectToEventPage()">Add Event Participation</button>
    <button class="add-media-button" onclick="redirectToMediaPage()">Add Media Participation</button>
</div>

<script>
    function redirectToCustomerPage() {
        // Redirect to the "NewCustIndex.jsp" page within the same web application
        window.location.href = 'NewCustIndex.jsp';
    }

    function redirectToTravelPage() {
        // Redirect to the "NewNewIndex.jsp" page within the same web application
        window.location.href = 'NewNewIndex.jsp';
    }

    function redirectToGovtRelationsPage() {
        // Redirect to the Govt Relations page
        window.location.href = 'GovtRelations.jsp';
    }

    function redirectToEventPage() {
        // Redirect to the Event Participation page
        window.location.href = 'EventParticipation.jsp';
    }

    function redirectToMediaPage() {
        // Redirect to the Media Participation page
        window.location.href = 'MediaParticipation.jsp';
    }
</script>

</html>

<%
} else {
    // out.println("<div class='w3-row w3-section'>You are logged out please <a href='../login.jsp' style='color;blue;font-size:bold;'> here click to login again</a></div>");
}
%>
