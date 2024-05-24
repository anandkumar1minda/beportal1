<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>BV-5 Travel Data</title>
    <style>
        h1 {
            text-align: center;
            font-size: 40px;
            color: black;
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        /* Add CSS styles for the table */
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Style for the filter form container */
        .filter-form {
        	
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007BFF;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        /* Style for each filter input container */
        .filter-input {
            flex: 1;
            margin-right: 10px;
        }

        /* Style for labels */
        label {
            font-weight: bold;
            color: #fff; /* White text color for labels */
        }

        /* Style for input fields */
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #007BFF; /* Blue border color */
            border-radius: 3px;
            font-size: 14px;
            color: #333; /* Dark text color */
            background-color: #fff; /* White background color */
        }

        /* Placeholder text color */
        input[type="text"]::placeholder,
        input[type="date"]::placeholder {
            color: #aaa; /* Light gray placeholder text color */
        }

        /* Style for the Location filter dropdown */
        .select-wrapper {
            position: relative;
        }

        .select-wrapper select {
            width: 100%;
            padding: 8px;
            border: 1px solid #007BFF;
            border-radius: 3px;
            font-size: 14px;
            color: #333;
            background-color: #fff;
            appearance: none; /* Remove default dropdown arrow */
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        /* Style for the custom dropdown arrow */
        .select-wrapper::after {
            content: '\25BC'; /* Unicode code for a downward arrow */
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            color: #007BFF;
            pointer-events: none; /* Prevent the arrow from being clickable */
        }
    </style>

    <!-- Include TableExport.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
</head>
<body>
    <h1>Data Display</h1>
    <%
        String fromDate = request.getParameter("fromDate") == null ? "" : request.getParameter("fromDate");
        String toDate = request.getParameter("toDate") == null ? "" : request.getParameter("toDate");
        String days = request.getParameter("days") == null ? "" : request.getParameter("days");
        String location = request.getParameter("location") == null ? "" : request.getParameter("location");
    %>
    <button onclick="exportTableToExcel()">Export table</button>
    <div class="filter-form">
        <div class="filter-input">
            <label for="fromFilter">From:</label>
            <input type="date" id="fromFilter" name="fromFilter" value="<%=fromDate %>" onchange="loadSearchTravel('travel_retrive')" placeholder="Filter by From">
        </div>
        <div class="filter-input">
            <label for="toFilter">To:</label>
            <input type="date" id="toFilter" name="toFilter" value="<%=toDate%>" onchange="loadSearchTravel('travel_retrive')" placeholder="Filter by To">
        </div>
        <div class="filter-input">
            <label for="daysFilter">Days:</label>
            <input type="text" id="daysFilter" name="daysFilter" value="<%=days %>" onchange="loadSearchTravel('travel_retrive')" placeholder="Filter by Days">
        </div>
        <div class="filter-input">
            <label for="locationFilter">Location:</label>
            <div class="select-wrapper">
                <select id="locationSelect" name="locationSelect"  onchange="loadSearchTravel('travel_retrive')" >
                    <option value="">Select Location</option>
                    <option value="Pune">Pune</option>
                    <option value="Bangalore">Bangalore</option>
                    <option value="Chennai">Chennai</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Hoshiarpur">Hoshiarpur</option>
                    <option value="Gandhinagar">Gandhinagar</option>
                    <option value="Chandigarh">Chandigarh</option>
                    <option value="Mumbai">Mumbai</option>
                </select>
            </div>
        </div>
    </div>
    <table border="1">
        <tr>
            <th>From</th>
            <th>To</th>
            <th>days</th>
            <th>location</th>
            <th>Purpose</th>
        </tr>
        <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
   

    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "4342");

        // Create a dynamic SQL query based on the filter parameters
        String query = "SELECT * FROM travel.travel_request WHERE 1=1";
        
        if (!fromDate.equalsIgnoreCase("")) {
            query += " AND (Date_Format(FromDate,'%Y-%m-%d')  >='"+fromDate+"'";
            query +=" OR '"+fromDate+"' BETWEEN Date_Format(FromDate,'%Y-%m-%d') AND Date_Format(ToDate,'%Y-%m-%d') )";
        }
        
        if (!toDate.equalsIgnoreCase("")) {
            query += " AND ( Date_Format(ToDate,'%Y-%m-%d') <= '"+toDate+"'";
            query +=" OR '"+toDate+"' BETWEEN Date_Format(FromDate,'%Y-%m-%d') AND Date_Format(ToDate,'%Y-%m-%d') )";
        }
        
        if (!days.equalsIgnoreCase("")) {
            query += " AND Days = '"+days+"'";
        }
        
        if (!location.equalsIgnoreCase("")) {
            query += " AND Location = '"+location+"'";
        }
        System.out.println(query);
        pstmt = conn.prepareStatement(query);
        
        // Set parameters for the dynamic query
      

        rs = pstmt.executeQuery();

        // Iterate through the result set and display data in the table
        while (rs.next()) {
            String from = rs.getString("FromDate");
            String to = rs.getString("ToDate");
            String Days = rs.getString("Days");
            String Location = rs.getString("Location");
            String purpose = rs.getString("Purpose");
        %>
        <tr>
            <td><%= from %></td>
            <td><%= to %></td>
            <td><%= Days %></td>
            <td><%= Location %></td>
            <td><%= purpose %></td>
        </tr>
        <%
        }
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        // Close resources
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>

    </table>
    <button onclick="loadLinkContent('NewNewIndex', 'contentDiv')">Add new entry</button>
</body>
<script type="text/javascript">
    // JavaScript function to filter the table
    

    

    function exportTableToExcel() {
        // Retrieve all tables on the page
        var tables = document.querySelectorAll('table');

        if (tables.length === 0) {
            alert("No tables found on this page.");
            return;
        }

        // Prompt the user to select a table
        var tableNames = [];
        for (var i = 0; i < tables.length; i++) {
            tableNames.push("Table " + (i + 1));
        }

        var selectedTableIndex = prompt("Select a table to export (enter a number):\n" + tableNames.join("\n"));

        if (selectedTableIndex === null) {
            // User canceled the prompt
            return;
        }

        selectedTableIndex = parseInt(selectedTableIndex);

        if (isNaN(selectedTableIndex) || selectedTableIndex < 1 || selectedTableIndex > tables.length) {
            alert("Invalid selection.");
            return;
        }

        // Get the selected table
        var selectedTable = tables[selectedTableIndex - 1];

        // Generate and trigger the download
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableHTML = selectedTable.outerHTML.replace(/ /g, '%20');
        var filename = 'Travel_data.xls';

        // Create download link element
        downloadLink = document.createElement('a');
        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            // Trigger the function
            downloadLink.click();
        }
    }
    function loadSearchTravel(pageName){
     	
    	/*let fromDate = $("#fromDate").val();
    	let toDate   = $("#toDate").val();
    	let searchEcrnReqTypeId  = $("#searchEcrnReqTypeId").val();
    	let searchPhaseId        = $("#searchPhaseId").val();
    	let searchProdDivisionId = $("#searchProdDivisionId").val();
    	let searchCustId         = $("#searchCustId").val();
    	let searchMoneyRecoveredByEcrn = $("#searchMoneyRecoveredByEcrn").val();
    	let ecrnStatus = $("#ecrnStatus").val()?$("#ecrnStatus").val():'Active';
    	let notificationStatus = $("#notificationStatus").val();
    	let HodDeptStatus = $("#HodDeptStatus").val();
    	let ecrnSubmittedBy = $("#ecrnSubmittedBy").val();
    	let searchEcrnId = $("#searchEcrnId").val();
    	let searchECNGenerated = $("#searchECNGenerated").val();
    	let date=$("#dateFilter").val();
    	let publication=$ ("#publicationFilter").val();	
    	let interaction=$ ("#interactionFilter").val();
    	
    	//alert(data);*/
    	let fromDate=$("#fromFilter").val();
    	let toDate=$("#toFilter").val();
    	let days=$("#daysFilter").val();
    	let location=$("#locationSelect").val();
    	let data = {fromDate:fromDate, toDate:toDate, days:days, location:location} ;
    	
    	$("#contentDiv").html(ajaxLoader);
    	
       $.ajax({url: "./include/travel_retrive.jsp", type: "POST", data:data, success: function(result){	  
            $("#contentDiv").html(result);         
       }});
                                
        hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
     }
</script>
</html>
