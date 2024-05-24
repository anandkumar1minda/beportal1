<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>

    <title>BV-5 Dashboard</title>
    <style>
        /* Style for the page title */
        h1 {
            text-align: center;
        }

        /* Add CSS styles for the table */
        body {
            font-family: Arial, sans-serif;
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
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #007BFF; /* Blue border color */
            border-radius: 3px;
            font-size: 14px;
            color: #333; /* Dark text color */
            background-color: #fff; /* White background color */
        }

        /* Placeholder text color */
        input[type="text"]::placeholder {
            color: #aaa; /* Light gray placeholder text color */
        }
    </style>

    <!-- Include TableExport.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
<script type="text/javascript" src="../js/ecrn.js"></script>

</head>
<body onload="filterTableByYear()">


<h1>Total summary</h1>


<button onclick="exportTableToExcel()">Export table</button>
<% String year=request.getParameter("year")==null?"All":request.getParameter("year");
%>
<!-- Modify the <select> element to include an ID -->
<div class="filter-input">
    <label for="yearFilter" style="color: black;">Financial Year Range:</label>
    <select id="yearFilter" name="year"  onchange="loadSearchTravel('totalSummery')">
        <option value="All" <%=year.equalsIgnoreCase("All")?"selected":"" %>>All</option>
        <option value="2022-2023"<%=year.equalsIgnoreCase("2022-2023")?"selected":"" %>>2022-23</option>
        <option value="2023-2024"<%=year.equalsIgnoreCase("2023-2024")?"selected":"" %>>2023-24</option>
    </select>
</div>




<table border="1">

<tr><th>Financial year</th>
    <th>Location</th>
    <th>January </th>
    <th>February</th>
    <th>March </th>
    <th>April </th>
    <th>May </th>
    <th>June </th>
    <th>July </th>
    <th>August </th>
    <th>September</th>
    <th>October </th>
    <th>November </th>
    <th>December </th>
    <th>Total</th>
</tr>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");

        // Create and execute SQL query to retrieve data
       String summaryQuery = "SELECT Location AS place, CASE WHEN MONTH(`FromDate`) >= 4 THEN CONCAT(YEAR(`FromDate`), '-', YEAR(`FromDate`) + 1) ELSE  CONCAT(YEAR(`FromDate`) - 1, '-', YEAR(`FromDate`)) END AS financial_year,"+
                   
    "SUM(CASE WHEN MONTH(`FromDate`) = 1 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS January, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 2 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS February, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 3 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS March, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 4 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS April, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 5 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS May, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 6 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS June, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 7 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS July, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 8 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS August, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 9 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS September, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 10 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS October, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 11 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS November, " +
    "SUM(CASE WHEN MONTH(`FromDate`) = 12 THEN DATEDIFF(`ToDate`, `FromDate`)+1 ELSE 0 END) AS December " +
    "FROM travel.travel_request " ;
   summaryQuery+= "GROUP BY Location,financial_year";
       
       if (!year.equalsIgnoreCase("All")){
    	   summaryQuery+=" HAVING financial_year='"+year+"'";
       }

       System.out.println(summaryQuery);
        stmt = conn.createStatement();
        rs = stmt.executeQuery(summaryQuery);

        // Initialize an array to store monthly totals
        int[] monthlyTotals = new int[12];

        // Iterate through the result set and display data in the table
        while (rs.next()) {
            String place = rs.getString("place");
            String Fyear=rs.getString("financial_year");
            int januaryDays = rs.getInt("January");
            int februaryDays = rs.getInt("February");
            int marchDays = rs.getInt("March");
            int aprilDays = rs.getInt("April");
            int mayDays = rs.getInt("May");
            int juneDays = rs.getInt("June");
            int julyDays = rs.getInt("July");
            int augustDays = rs.getInt("August");
            int septemberDays = rs.getInt("September");
            int octoberDays = rs.getInt("October");
            int novemberDays = rs.getInt("November");
            int decemberDays = rs.getInt("December");

            // Calculate the total for this location
            int locationTotal = januaryDays + februaryDays + marchDays + aprilDays + mayDays + juneDays +
                julyDays + augustDays + septemberDays + octoberDays + novemberDays + decemberDays;

            // Add the monthly totals to the array
            monthlyTotals[0] += januaryDays; 
            monthlyTotals[1] += februaryDays;
            monthlyTotals[2] += marchDays;
            monthlyTotals[3] += aprilDays;
            monthlyTotals[4] += mayDays;
            monthlyTotals[5] += juneDays;
            monthlyTotals[6] += julyDays;
            monthlyTotals[7] += augustDays;
            monthlyTotals[8] += septemberDays;
            monthlyTotals[9] += octoberDays;
            monthlyTotals[10] += novemberDays;
            monthlyTotals[11] += decemberDays;
%>
            <tr><td><%= Fyear %></td>
                <td><%= place %></td>
                <td><%= januaryDays %></td>
                <td><%= februaryDays %></td>
                <td><%= marchDays %></td>
                <td><%= aprilDays %></td>
                <td><%= mayDays %></td>
                <td><%= juneDays %></td>
                <td><%= julyDays %></td>
                <td><%= augustDays %></td>
                <td><%= septemberDays %></td>
                <td><%= octoberDays %></td>
                <td><%= novemberDays %></td>
                <td><%= decemberDays %></td>
                <td><%= locationTotal %></td>
            </tr>
<%
        }
%>
        <!-- Display the monthly totals at the end of the table -->
        <tr>
            <th colspan='2'>Total</th>
<% int total=0;
        for (int i = 0; i < 12; i++) {
%>
            <th><%= monthlyTotals[i] %></th>
            <%total+=monthlyTotals[i];  %>
<%
        }
%>
            <td> <%=total %> </td> <!-- Empty cell for the "Total" column -->
        </tr>
<%
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Close resources
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
</table>
<button onclick="loadLinkContent('NewNewIndex','contentDiv')">Add new entry</button>
</body>
<script>

// JavaScript function to filter the table by financial year
function filterTable() {
    var selectedYear = document.getElementById('yearFilter').value;
    var table = document.querySelector('table');
    var rows = table.getElementsByTagName('tr');

    for (var i = 1; i < rows.length; i++) {
        var row = rows[i];
        var cells = row.getElementsByTagName('td');
        var financialYear = cells[0].textContent.toLowerCase(); // Assuming financial year is in the first column

        if (financialYear === selectedYear) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    }
}






function redirectToNewIndex() {
    window.location.href = "NewNewIndex.jsp";
}

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
    var filename = 'Total Summary.xls';

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
	let searchECNGenerated = $("#searchECNGenerated").val();*/
	let year=$("#yearFilter").val();
		
	let data = {year:year} ;
	
	
	$("#contentDiv").html(ajaxLoader);
	
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){	  
        $("#contentDiv").html(result);         
   }});
                            
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
 }
</script>
</html>
