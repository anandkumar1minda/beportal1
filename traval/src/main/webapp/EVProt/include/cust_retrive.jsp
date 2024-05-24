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
        /* Style for each filter input container */
.filter-input {
    margin-right: 10px;
    display: inline-block;
}

/* Style for labels */
.filter-input label {
    font-weight: bold;
    color: #007BFF; /* Blue text color for labels */
    margin-right: 5px;
}

/* Style for input fields and select dropdowns */
.filter-input input[type="text"],
.filter-input select {
    padding: 5px;
    border: 1px solid #007BFF; /* Blue border color */
    border-radius: 3px;
    font-size: 14px;
    color: #333; /* Dark text color */
    background-color: #fff; /* White background color */
}

/* Placeholder text color */
.filter-input input[type="text"]::placeholder,
.filter-input select::placeholder {
    color: #aaa; /* Light gray placeholder text color */
}

/* Add a slight box-shadow on focus */
.filter-input input[type="text"]:focus,
.filter-input select:focus {
    border: 1px solid #0056b3; /* Darker blue border color on focus */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Blue box shadow on focus */
}
/* Style for the "Total Rows" display */
.total-rows {
    background-color: #007BFF; /* Background color */
    color: white; /* Text color */
    text-align: center; /* Center the text */
    padding: 5px; /* Add some padding for spacing */
    font-weight: bold; /* Make the text bold */
    border-radius: 5px; /* Rounded corners */
}

        
        
    </style>

    <!-- Include TableExport.js from CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>

</head>
<body>
 <h5><b><i class="fa fa-dashboard"></i>Customer Actual Data</b></h5>
<% String year=request.getParameter("year")==null?"All":request.getParameter("year");
String quarterfilter=request.getParameter("quarter")==null?"All":request.getParameter("quarter");
String monthfilter=request.getParameter("month")==null?"All":request.getParameter("month");

%>
<%-- <div class="filter-form">
    <div class="filter-input">
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" placeholder="Enter Date">
    </div>
    <div class="filter-input">
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" placeholder="Enter Location">
    </div>
    <div class="filter-input">
        <label for="customer">Customer:</label>
        <input type="text" id="customer" name="customer" placeholder="Enter Customer">
    </div>
    
    <div class="filter-input">
    <label for="quarter">Quarter:</label>
    <select id="quarter" name="quarter">
        <option value="">Select Quarter</option>
        <option value="Q1">Q1 (Apr, May, Jun)</option>
        <option value="Q2">Q2 (Jul, Aug, Sep)</option>
        <option value="Q3">Q3 (Oct, Nov, Dec)</option>
        <option value="Q4">Q4 (Jan, Feb, Mar)</option>
    </select>
</div>
    --%>

    <div class="filter-input">
    <label for="yearFilter" style="color: black;">Financial Year Range:</label>
    <select id="yearFilter" name="year"  onchange="loadSearchTravel('cust_retrive')">
        <option value="All" <%=year.equalsIgnoreCase("All")?"selected":"" %>>All</option>
        <option value="2022-2023"<%=year.equalsIgnoreCase("2022-2023")?"selected":"" %>>2022-23</option>
        <option value="2023-2024"<%=year.equalsIgnoreCase("2023-2024")?"selected":"" %>>2023-24</option>
    </select>
<div class="filter-input">
    <label for="quarterFilter" style="color: black;">Quarter:</label>
    <select id="quarterFilter" name="quarter" onchange="loadSearchTravel('cust_retrive')">
        <option value="All">All</option>
        <option value="Q1"<%=quarterfilter.equalsIgnoreCase("Q1")?"selected":"" %>>Q1</option>
        <option value="Q2"<%=quarterfilter.equalsIgnoreCase("Q2")?"selected":"" %>>Q2</option>
        <option value="Q3"<%=quarterfilter.equalsIgnoreCase("Q3")?"selected":"" %>>Q3</option>
        <option value="Q4"<%=quarterfilter.equalsIgnoreCase("Q4")?"selected":"" %>>Q4</option>
    </select>
</div>
<div class="filter-input">
    <label for="monthFilter" style="color: black;">Month:</label>
    <select id="monthFilter" name="month" onchange="loadSearchTravel('cust_retrive')">
        <option value="All">All</option>
        <%if(quarterfilter.equalsIgnoreCase("Q4")){ %>
        <option value="1">January</option>
        <option value="2">February</option>
        <option value="3">March</option>
        <%} else if (quarterfilter.equalsIgnoreCase("Q1")){%>
        <option value="4">April</option>
        <option value="5">May</option>
        <option value="6">June</option>
        <%}else if (quarterfilter.equalsIgnoreCase("Q2")){%>
        <option value="7">July</option>
        <option value="8">Augest</option>
        <option value="9">September</option>
        <%} else if  (quarterfilter.equalsIgnoreCase("Q3")){%> 
        <option value="10">October</option>
        <option value="11">Novermber</option>
        <option value="12">December</option>
      <%} %>
    </select>
</div>
    


 <div class="w3-row w3-section">
      <header class="w3-container" style="padding-top:10px">

   
    <button onclick="exportTableToExcel()">Export table</button>	
		
		

    <table border="1">
      <tr>
        <th>Customer Name</th>
        <th>Date</th>
        <th>Location</th>
        <th>Meet Objective</th>
        <th>Customer Participant</th>
        <th>Mode</th>
        <th>Minda Participants</th>
        <th>Month</th>
        <th>Quarter</th>
      </tr>
      <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
		
        int rowCounter = 1;	
        
        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "4342");

            // Create and execute SQL query to retrieve data
             String query = "SELECT *, DATE_FORMAT(date, '%M') AS month, " +
               "CASE " +
               "  WHEN MONTH(date) BETWEEN 4 AND 6 THEN 'Q1' " +
               "  WHEN MONTH(date) BETWEEN 7 AND 9 THEN 'Q2' " +
               "  WHEN MONTH(date) BETWEEN 10 AND 12 THEN 'Q3' " +
               "  ELSE 'Q4' " +
               "END AS quarter " +
               " FROM travel.customer_connect_actual"+
               " where MONTH(date) in(1,2,3,4,5,6,7,8,9,10,11,12) ";
            if(!monthfilter.equalsIgnoreCase("All")){
            	query+="  AND MONTH(date)='"+monthfilter+"'";
            }
            if(!quarterfilter.equalsIgnoreCase("All")){
            	query+=" AND    CASE " +
                        "  WHEN MONTH(date) BETWEEN 4 AND 6 THEN 'Q1' " +
                        "  WHEN MONTH(date) BETWEEN 7 AND 9 THEN 'Q2' " +
                        "  WHEN MONTH(date) BETWEEN 10 AND 12 THEN 'Q3' " +
                        "  ELSE 'Q4' " +
                        " END ='"+quarterfilter+"'";
            }
           if(!year.equalsIgnoreCase("All")){
            	query+=" AND CASE WHEN MONTH(`date`) >= 4 THEN CONCAT(YEAR(`date`), '-', YEAR(`date`) + 1) ELSE  CONCAT(YEAR(`date`) - 1, '-', YEAR(`date`)) END ='"+year+"'";
            }

			query += " ORDER BY date ASC";
            
            
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            // Iterate through the result set and display data in the table
            while (rs.next()) {
                String customerName = rs.getString("Customer_Name");
                String date = rs.getString("date");
                String location = rs.getString("place");
                String meetingObjective = rs.getString("meetObj");
                String customerParticipants = rs.getString("custPart");
                String formattedcustomerParticipants= customerParticipants.replace(",", "<br>");
                String mode = rs.getString("mode");
                String mindaParticipants = rs.getString("mindaPart");
               // String mindaParticipants ="a,b,c";
                //String mindaParticipants = "Participant1,Participant2,Participant3";
                String formattedmindaParticipants = mindaParticipants.replace(",", "<br>");
                //System.out.println(formattedParticipants);

               String month = rs.getString("month");
                String quarter = rs.getString("quarter");
                
      %>
                <tr>
                    <td><%= customerName %></td>
                    <td><%= date %></td>
                    <td><%= location %></td>
                    <td><%= meetingObjective %></td>
                    <td><%= customerParticipants.replace(",", "<br>") %></td>

                    <td><%= mode %></td>
                    <td><%= formattedmindaParticipants %></td>
                    <td><%=month  %></td>
                    <td><%= quarter %></td>
                </tr>
      <%
     				 rowCounter++;
            }
        } catch (Exception e) {
        	
            out.println("Database error: " + e.getMessage());
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
    <!-- Add a CSS class to style the "Total Rows" text -->
<p class="total-rows">Total Count: <%= rowCounter %></p>

    
<button onclick="loadLinkContent('NewCustIndex','contentDiv')">Add new entry</button>
</body>
<script>
function exportTableToExcel() {
    // Retrieve the first table on the page
    var table = document.querySelector('table');

    if (!table) {
        alert("No table found on this page.");
        return;
    }

    // Generate and trigger the download
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableHTML = table.outerHTML.replace(/ /g, '%20');
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
function applyFilters() {
    var quarterFilter = document.getElementById("quarterFilter").value;
    var tableRows = document.querySelectorAll("table tr");

    for (var i = 1; i < tableRows.length; i++) { // Start from 1 to skip header row
        var row = tableRows[i];
        var quarter = row.cells[8].textContent; // Assuming quarter is in the 9th cell

        if (quarterFilter === "All" || quarter === quarterFilter) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
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
	let quarter=$ ("#quarterFilter").val();	
	let month=$ ("#monthFilter").val();
	let data = {year:year, month:month, quarter:quarter} ;
	//alert(data);
	
	$("#contentDiv").html(ajaxLoader);
	
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){	  
        $("#contentDiv").html(result);         
   }});
                            
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
 }



</script>
</html>
