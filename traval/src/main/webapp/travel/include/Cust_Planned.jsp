<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Planned customer Data</title>
    <style>
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
            position: sticky;
            top: 0;
            background-color: #007BFF;
            color: white;
            z-index: 5;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
    <!-- Include TableExport.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
</head>
<body>
<h1>Planned customer Data</h1>

<% String year=request.getParameter("year")==null?"All":request.getParameter("year");

%>
<div class="filter-input">
    <label for="yearFilter" style="color: black;">Financial Year Range:</label>
    <select id="yearFilter" name="year"  onchange="loadSearchTravel('Cust_Planned')">
        <option value="All" <%=year.equalsIgnoreCase("All")?"selected":"" %>>All</option>
        <option value="2022-2023"<%=year.equalsIgnoreCase("2022-2023")?"selected":"" %>>2022-23</option>
        <option value="2023-2024"<%=year.equalsIgnoreCase("2023-2024")?"selected":"" %>>2023-24</option>
    </select>
</div>

<!-- Total row within the table -->
<table border="1">
    <!-- Header row with month and financial year columns -->
    <tr>
        <th>Region</th>
        <th>City</th>
        <th>Customer Name</th>
        <th>KAM</th>
        <th>Apr-23</th>
        <th>May-23</th>
        <th>Jun-23</th>
        <th>Jul-23</th>
        <th>Aug-23</th>
        <th>Sep-23</th>
        <th>Oct-23</th>
        <th>Nov-23</th>
        <th>Dec-23</th>
        <th>Jan-24</th>
        <th>Feb-24</th>
        <th>Mar-24</th>
        <th>Total</th> <!-- Add a column for Total -->
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "FGh%4#45ndF32");

            // Create and execute SQL query to retrieve data with financial year
            String summaryquery = "SELECT Region, City, Customer_Name AS CustomerName, KAM,  CASE WHEN MONTH(`Visit_Date`) >= 4 THEN CONCAT(YEAR(`Visit_Date`), '-', YEAR(`Visit_Date`) + 1) ELSE  CONCAT(YEAR(`Visit_Date`) - 1, '-', YEAR(`Visit_Date`)) END AS financial_year,"+
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 4 THEN 1 ELSE 0 END) AS Apr23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 5 THEN 1 ELSE 0 END) AS May23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 6 THEN 1 ELSE 0 END) AS Jun23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 7 THEN 1 ELSE 0 END) AS Jul23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 8 THEN 1 ELSE 0 END) AS Aug23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 9 THEN 1 ELSE 0 END) AS Sep23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 10 THEN 1 ELSE 0 END) AS Oct23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 11 THEN 1 ELSE 0 END) AS Nov23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 12 THEN 1 ELSE 0 END) AS Dec23, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 1 THEN 1 ELSE 0 END) AS Jan24, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 2 THEN 1 ELSE 0 END) AS Feb24, " +
                "SUM(CASE WHEN MONTH(`Visit_Date`) = 3 THEN 1 ELSE 0 END) AS Mar24, " +
                "COUNT(*) AS Total " +
                "FROM travel.customer_connect ";
                summaryquery += "   GROUP BY Region, City, CustomerName, KAM,financial_year";
                if (!year.equalsIgnoreCase("All")){
             	   summaryquery+=" HAVING financial_year='"+year+"'";
                }
                else{
                	summaryquery+=" HAVING financial_year='2023-2024'";
                }
System.out.println(summaryquery);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(summaryquery);

            while (rs.next()) {
                String region = rs.getString("Region");
                String city = rs.getString("City");
                String customerName = rs.getString("CustomerName");
                String kam = rs.getString("KAM");
                int apr23 = rs.getInt("Apr23");
                int may23 = rs.getInt("May23");
                int jun23 = rs.getInt("Jun23");
                int jul23 = rs.getInt("Jul23");
                int aug23 = rs.getInt("Aug23");
                int sep23 = rs.getInt("Sep23");
                int oct23 = rs.getInt("Oct23");
                int nov23 = rs.getInt("Nov23");
                int dec23 = rs.getInt("Dec23");
                int jan24 = rs.getInt("Jan24");
                int feb24 = rs.getInt("Feb24");
                int mar24 = rs.getInt("Mar24");
                String total = rs.getString("Total"); // Retrieve Total column
%>
<tr>
    <td><%= region %></td>
    <td><%= city %></td>
    <td><%= customerName %></td>
    <td><%= kam %></td>
    <td><%= apr23 %></td>
    <td><%= may23 %></td>
    <td><%= jun23 %></td>
    <td><%= jul23 %></td>
    <td><%= aug23 %></td>
    <td><%= sep23 %></td>
    <td><%= oct23 %></td>
    <td><%= nov23 %></td>
    <td><%= dec23 %></td>
    <td><%= jan24 %></td>
    <td><%= feb24 %></td>
    <td><%= mar24 %></td>
    <td><%= total %></td> <!-- Display Total column -->
</tr>
<%
            }
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
<button onclick="exportTableToExcel()">Export table</button>
</body>
<script>
    // JavaScript function to filter the table by financial year
 // JavaScript function to filter the table by financial year
function filterTable() {
    var selectedYear = document.getElementById('financialYearFilter').value;
    var table = document.querySelector('table');
    var rows = table.getElementsByTagName('tr');

    for (var i = 1; i < rows.length; i++) {
        var row = rows[i];
        var cells = row.getElementsByTagName('td');
        var totalCell = cells[cells.length - 1]; // Get the Total cell

        // Convert total to a string and check if it includes the selected year
        var total = totalCell.textContent.toString();
        if (selectedYear === '' || total.includes(selectedYear)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    }
}







    function exportTableToExcel() {
        // Retrieve the table
        var table = document.querySelector('table');

        // Generate and trigger the download
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableHTML = table.outerHTML.replace(/ /g, '%20');
        var filename = 'Location_Visits.xls';

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
