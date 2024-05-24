<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Location Visits</title>
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
    </style>
    <!-- Include TableExport.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
</head>
<body>
<h1>Pune Location Visits</h1>
<%
 String days = request.getParameter("days") == null ? "" : request.getParameter("days");
 String year = request.getParameter("year") == null ? "" : request.getParameter("year");
 
%>
<div class="filter-form">
    <div class="filter-input">
        <label for="daysFilter">Filter by Days:</label>
        <input type="text" id="daysFilter" name="daysFilter" value="<%=days %>" onchange="loadSearchTravel('plantVisitReport')" placeholder="Enter Days">
    </div>
    <div class="filter-input">
    <label for="yearFilter">Filter by Year:</label>
    <select id="yearFilter" name="yearFilter"  value="<%=year %>"onchange="loadSearchTravel('plantVisitReport')"placeholder="select year">
        <option value="">All</option>
        <option value="2022">2022</option>
        <option value="2023">2023</option>
    </select>
</div>
    
</div>
<!-- Total row within the table -->
<table border="1">
    <!-- Header row -->
    <tr>
        <th>Month</th>
        <th>Count of Location Visits</th>
        <th>Total Days Spent</th>
        <th>From Date (1st Visit)</th>
        <th>To Date (1st Visit)</th>
        <th>From Date (2nd Visit)</th>
        <th>To Date (2nd Visit)</th>
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        int totalCount = 0;
        double totalDays = 0.0; // Use a double for total days

        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");
            
            

            // Create and execute SQL query to retrieve data
            String query = "SELECT MONTHNAME(`FromDate`) AS month,YEAR(`FromDate`) as year, " 
                          +  "COUNT(*) AS visit_count, " 
                          +  "SUM(days) AS total_days, " 
                          + "MIN(`FromDate`) AS first_from_date, " 
                          + "MIN(`ToDate`) AS first_to_date, "
                          + "MAX(`FromDate`) AS Second_From, "
                          + " MAX(`ToDate`) AS Second_To" 
                          + " FROM travel.travel_request " 
                          +" WHERE Location='Pune'";
                          
           
            if (!year.equalsIgnoreCase("")) {
                query += " AND YEAR(`FromDate`) = '"+year+"'";
            }
            
          query += " GROUP BY MONTHNAME(`FromDate`),YEAR(`FromDate`)";
          if (!days.equalsIgnoreCase("")) {
              query += " HAVING SUM(`days`) = "+days+"";
          }
         query+=" ORDER BY first_from_date ";
            System.out.println(query);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                String month = rs.getString("month");
                int Year = rs.getInt("year");
                int count = Integer.parseInt(rs.getString("visit_count"));
                double Days = Double.parseDouble(rs.getString("total_days")); // Parse as double
                String firstFromDate = rs.getString("first_from_date");
                String firstToDate = rs.getString("first_to_date");
                String secondFromDate = "";
                String secondToDate = "";
                


               


                if (count > 1) {
                    secondFromDate = rs.getString("Second_From");
                    secondToDate = rs.getString("Second_To");
                } else {
                    secondFromDate = "No other Visit";
                    secondToDate = "No other Visit";
                }

                // Update the total count of visits and total days spent
                totalCount += count;
                totalDays += Days; // Use a double variable for total days

                %>
                <tr>
                    <td><%= month %>-<%=year %></td>
                    <td><%= count %></td>
                    <td><%= Math.round(Days) %></td>
					<td><%= firstFromDate %></td>
                    <td><%= firstToDate %></td>
                    <td><%= secondFromDate %></td>
                    <td><%= secondToDate %></td>
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
    <!-- Total row -->
    <tr>
        <th>Total</th>
        <!-- Display the total count of visits and total days spent -->
        <th><%= totalCount %></th>
      <th><%= Math.round(totalDays) %></th>
        <th></th> <!-- Empty cells for other columns -->
        <th></th>
        <th></th>
        <th></th>
    </tr>
</table>
<button onclick="exportTableToExcel()">Export table</button>
</body>
<script>

    // JavaScript function to filter the table
  


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
    	let searchECNGenerated = $("#searchECNGenerated").val();
    	let date=$("#dateFilter").val();
    	let publication=$ ("#publicationFilter").val();	
    	let interaction=$ ("#interactionFilter").val();
    	
    	//alert(data);*/
    
    	let days=$("#daysFilter").val();
		let year=$("#yearFilter").val();
		let data={days:days,year:year};
    	
    	$("#contentDiv").html(ajaxLoader);
    	
       $.ajax({url: "./include/plantVisitReport.jsp", type: "POST", data:data, success: function(result){	  
            $("#contentDiv").html(result);         
       }});
                                
        hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
     }
</script>
</html>
