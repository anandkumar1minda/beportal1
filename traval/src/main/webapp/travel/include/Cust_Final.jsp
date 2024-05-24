<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Combined Data</title>
    <style>
 /* Add CSS styles for the table */
body {
    font-family: Arial, sans-serif;
}

h1 {
    text-align: center;
}

.table-wrapper {
    overflow-x: auto;
    margin-top: 20px;
}

.table-wrapper table.sticky-header-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.table-wrapper table.sticky-header-table th,
.table-wrapper table.sticky-header-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.table-wrapper table.sticky-header-table th {
    position: sticky;
    top: 0;
    background-color: #007BFF;
    color: white;
    z-index: 2;
}

.table-wrapper table.sticky-header-table thead {
    display: block;
    position: sticky;
    top: 0;
    background-color: #007BFF;
    color: white;
    z-index: 3;
}

.table-wrapper table.sticky-header-table tbody {
    display: block;
    overflow-y: auto;
    max-height: 700px; /* Adjust the max-height as needed */
}

.table-wrapper table.sticky-header-table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table-wrapper table.sticky-header-table tr:hover {
    background-color: #ddd;
}

/* Style for the filter form container */
.filter-container {
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

/* Style for number input */
input[type="number"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #007BFF; /* Blue border color */
    border-radius: 3px;
    font-size: 14px;
    color: #333; /* Dark text color */
    background-color: #fff; /* White background color */
}

/* Style for the Filter button */
button.filter-button {
    background-color: #4CAF50; /* Green background color */
    color: white; /* White text color */
    padding: 10px 20px; /* Padding around text */
    border: none; /* No border */
    border-radius: 3px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
}

/* Hover effect for the Filter button */
button.filter-button:hover {
    background-color: #45a049; /* Darker green background color on hover */
}
 .summary-row {
        background-color: #007BFF; /* Set the background color to blue or any desired color */
        color: white; /* Set the text color to white or contrasting color */
        font-weight: bold; /* Make the text bold for better visibility */
    }



    </style>
</head>
<body>
 <%String customer = request.getParameter("customer") == null ? "All" : request.getParameter("customer");
 String kamFilter = request.getParameter("contact") == null ? "All" : request.getParameter("contact");
    
%>

<h1>EXECUTIVE SUMMARY
</h1>
<div class="filter-container"></div>
<div class="filter-input">
   <!--  <label for="region">Region:</label>
    <input type="text" id="region" class="filter-input" onkeyup="filterTable('region', 1)" placeholder="Filter by Region">
    
    <label for="city">City:</label>
    <input type="text" id="city" class="filter-input" onkeyup="filterTable('city', 2)" placeholder="Filter by City">
     -->
  
  <label for="customerFilter" style="color:blue;">Customer name:</label>
<select id="customer" class="filter-input" onChange="loadSearchTravel('Cust_Final')">
    <option value="All" <%= customer.equalsIgnoreCase("All") ? "selected" : "" %>>Select Customer</option>
    <option value="Mahindra" <%= customer.equalsIgnoreCase("Mahindra") ? "selected" : "" %>>Mahindra</option>
    <option value="CLPL" <%= customer.equalsIgnoreCase("CLPL") ? "selected" : "" %>>CLPL</option>
    <option value="Bajaj" <%= customer.equalsIgnoreCase("Bajaj") ? "selected" : "" %>>Bajaj</option>
    <option value="KTM" <%= customer.equalsIgnoreCase("KTM") ? "selected" : "" %>>KTM</option>
    <option value="TATA" <%= customer.equalsIgnoreCase("TATA") ? "selected" : "" %>>TATA</option>
    <option value="Volvo Eicher" <%= customer.equalsIgnoreCase("Volvo Eicher") ? "selected" : "" %>>Volvo Eicher</option>
    <option value="Piaggio" <%= customer.equalsIgnoreCase("Piaggio") ? "selected" : "" %>>Piaggio</option>
    <option value="Dana" <%= customer.equalsIgnoreCase("Dana") ? "selected" : "" %>>Dana</option>
    <option value="TMTL" <%= customer.equalsIgnoreCase("TMTL") ? "selected" : "" %>>TMTL</option>
    <option value="Kawasaki" <%= customer.equalsIgnoreCase("Kawasaki") ? "selected" : "" %>>Kawasaki</option>
    <option value="Green Cell Mobility" <%= customer.equalsIgnoreCase("Green Cell Mobility") ? "selected" : "" %>>Green Cell Mobility</option>
    <option value="VW India" <%= customer.equalsIgnoreCase("VW India") ? "selected" : "" %>>VW India</option>
    <option value="Polarity" <%= customer.equalsIgnoreCase("Polarity") ? "selected" : "" %>>Polarity</option>
    <option value="TAFE" <%= customer.equalsIgnoreCase("TAFE") ? "selected" : "" %>>TAFE</option>
    <option value="TVS" <%= customer.equalsIgnoreCase("TVS") ? "selected" : "" %>>TVS</option>
    <option value="Ashok Leyland" <%= customer.equalsIgnoreCase("Ashok Leyland") ? "selected" : "" %>>Ashok Leyland</option>
    <option value="RE" <%= customer.equalsIgnoreCase("RE") ? "selected" : "" %>>RE</option>
    <option value="Olcetra" <%= customer.equalsIgnoreCase("Olcetra") ? "selected" : "" %>>Olcetra</option>
    <option value="Sun-Mobility" <%= customer.equalsIgnoreCase("Sun-Mobility") ? "selected" : "" %>>Sun-Mobility</option>
    <option value="Ti Clean Mobility" <%= customer.equalsIgnoreCase("Ti Clean Mobility") ? "selected" : "" %>>Ti Clean Mobility</option>
    <option value="Virya Mobility" <%= customer.equalsIgnoreCase("Virya Mobility") ? "selected" : "" %>>Virya Mobility</option>
    <option value="Switch Mobility" <%= customer.equalsIgnoreCase("Switch Mobility") ? "selected" : "" %>>Switch Mobility</option>
    <option value="Ultraviolette" <%= customer.equalsIgnoreCase("Ultraviolette") ? "selected" : "" %>>Ultraviolette</option>
    <option value="Daimler" <%= customer.equalsIgnoreCase("Daimler") ? "selected" : "" %>>Daimler</option>
    <option value="Kia" <%= customer.equalsIgnoreCase("Kia") ? "selected" : "" %>>Kia</option>
    <option value="Hero Motocorp" <%= customer.equalsIgnoreCase("Hero Motocorp") ? "selected" : "" %>>Hero Motocorp</option>
    <option value="ITL" <%= customer.equalsIgnoreCase("ITL") ? "selected" : "" %>>ITL</option>
    <option value="Honda 2W" <%= customer.equalsIgnoreCase("Honda 2W") ? "selected" : "" %>>Honda 2W</option>
    <option value="Escorts" <%= customer.equalsIgnoreCase("Escorts") ? "selected" : "" %>>Escorts</option>
    <option value="Suzuki" <%= customer.equalsIgnoreCase("Suzuki") ? "selected" : "" %>>Suzuki</option>
    <option value="Hero Electric Pvt Ltd." <%= customer.equalsIgnoreCase("Hero Electric Pvt Ltd.") ? "selected" : "" %>>Hero Electric Pvt Ltd.</option>
    <option value="Revolt" <%= customer.equalsIgnoreCase("Revolt") ? "selected" : "" %>>Revolt</option>
    <option value="PMI Mobility" <%= customer.equalsIgnoreCase("PMI Mobility") ? "selected" : "" %>>PMI Mobility</option>
    <option value="CNH" <%= customer.equalsIgnoreCase("CNH") ? "selected" : "" %>>CNH</option>
    <option value="Baxy Mobility" <%= customer.equalsIgnoreCase("Baxy Mobility") ? "selected" : "" %>>Baxy Mobility</option>
    <option value="Infac (Hyundai)" <%= customer.equalsIgnoreCase("Infac (Hyundai)") ? "selected" : "" %>>Infac (Hyundai)</option>
    <option value="Infac (Stellantis)" <%= customer.equalsIgnoreCase("Infac (Stellantis)") ? "selected" : "" %>>Infac (Stellantis)</option>
</select>

    <label for="contact" style="color:blue;">KAM:</label>
<select id="contact" class="filter-input" onChange="loadSearchTravel('Cust_Final')">
    <option value="All" <%= kamFilter.equalsIgnoreCase("All") ? "selected" : "" %>>Select KAM</option>
    <option value="Bhavesh Dave" <%= kamFilter.equalsIgnoreCase("Bhavesh Dave") ? "selected" : "" %>>Bhavesh Dave</option>
    <option value="Naresh Dhakad" <%= kamFilter.equalsIgnoreCase("Naresh Dhakad") ? "selected" : "" %>>Naresh Dhakad</option>
    <option value="Ricky Jain" <%= kamFilter.equalsIgnoreCase("Ricky Jain") ? "selected" : "" %>>Ricky Jain</option>
    <option value="Nilesh G" <%= kamFilter.equalsIgnoreCase("Nilesh G") ? "selected" : "" %>>Nilesh G</option>
    <option value="Murali Krishna" <%= kamFilter.equalsIgnoreCase("Murali Krishna") ? "selected" : "" %>>Murali Krishna</option>
    <option value="Sudhindra" <%= kamFilter.equalsIgnoreCase("Sudhindra") ? "selected" : "" %>>Sudhindra</option>
    <option value="Anita P" <%= kamFilter.equalsIgnoreCase("Anita P") ? "selected" : "" %>>Anita P</option>
    <option value="Syedvaseem" <%= kamFilter.equalsIgnoreCase("Syedvaseem") ? "selected" : "" %>>Syedvaseem</option>
    <option value="Sriram Mohan" <%= kamFilter.equalsIgnoreCase("Sriram Mohan") ? "selected" : "" %>>Sriram Mohan</option>
    <option value="Karthikeyan" <%= kamFilter.equalsIgnoreCase("Karthikeyan") ? "selected" : "" %>>Karthikeyan</option>
    <option value="Akshay H" <%= kamFilter.equalsIgnoreCase("Akshay H") ? "selected" : "" %>>Akshay H</option>
    <option value="A Karthikeyan" <%= kamFilter.equalsIgnoreCase("A Karthikeyan") ? "selected" : "" %>>A Karthikeyan</option>
    <option value="Sukhpal Singh" <%= kamFilter.equalsIgnoreCase("Sukhpal Singh") ? "selected" : "" %>>Sukhpal Singh</option>
    <option value="Atul Tyagi" <%= kamFilter.equalsIgnoreCase("Atul Tyagi") ? "selected" : "" %>>Atul Tyagi</option>
    <option value="Rajat Agrawal" <%= kamFilter.equalsIgnoreCase("Rajat Agrawal") ? "selected" : "" %>>Rajat Agrawal</option>
    <option value="Vishal Sinha" <%= kamFilter.equalsIgnoreCase("Vishal Sinha") ? "selected" : "" %>>Vishal Sinha</option>
    <option value="JV Driven Programs" <%= kamFilter.equalsIgnoreCase("JV Driven Programs") ? "selected" : "" %>>JV Driven Programs</option>
    <!-- Add other KAM options here -->
    <!-- ... -->
</select>
    <!-- Add other KAM options here -->
    <!-- ... -->
</select>
    
   <!--  
    <label for="freq">freq:</label>
    <input type="number" id="freq" class="filter-input" onkeyup="filterTable('freq', 6)" placeholder="Filter by freq">
     -->
  <!--   <label for="contact">Contact:</label>
    <input type="text" id="contact" class="filter-input" onkeyup="filterTable('contact', 4)" placeholder="Filter by Contact">   -->
</div>
<div class="table-wrapper">
<table class="sticky-header-table" border="1">
    <!-- Header row with columns -->
    <tr>
     <!--    <th>Sr. No</th>  -->
       <!--  <th>Region</th> 
        <th>City</th> -->
        <th>Customer Name</th>
      <!--    <th>Contact</th>  --> <!-- Display Contact here -->
        <th>KAM</th> <!-- Display KAM here -->
       
       <!--   <th>freq </th>-->
       <th>Actual/Planned</th>
        <th>Apr-23</th>
        <th>May-23</th>
        <th>Jun-23 </th>
        <th>Jul-23 </th>
        <th>Aug-23 </th>
        <th>Sep-23 </th>
        <th>Oct-23 </th>
        <th>Nov-23 </th>
        <th>Dec-23 </th>
        <th>Jan-24 </th>
        <th>Feb-24 </th>
        <th>Mar-24 </th>
        <th>Total  </th>
        
        
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        int rowCounter = 1;

        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "FGh%4#45ndF32");

            // Create and execute SQL query to retrieve combined data
        String query = "SELECT c.Region, c.City, c.Customer_Name AS CustomerName, c.Contact, c.KAM, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 4) AS Apr23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 5) AS May23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 6) AS Jun23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 7) AS Jul23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 8) AS Aug23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 9) AS Sep23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 10) AS Oct23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 11) AS Nov23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 12) AS Dec23Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 1) AS Jan24Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 2) AS Feb24Actual, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name AND MONTH(ca.date) = 3) AS Mar24Actual, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 4) AS Apr23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 5) AS May23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 6) AS Jun23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 7) AS Jul23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 8) AS Aug23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 9) AS Sep23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 10) AS Oct23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 11) AS Nov23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 12) AS Dec23Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 1) AS Jan24Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 2) AS Feb24Planned, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) = 3) AS Mar24Planned, " +
    "(SELECT COUNT(*) FROM customer_connect_actual ca WHERE c.Customer_Name = ca.Customer_Name) AS TotalHappened, " +
    "(SELECT COUNT(*) FROM customer_connect cc WHERE c.Customer_Name = cc.Customer_Name AND MONTH(cc.Visit_Date) IN (4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2, 3)) AS freq " +
    "FROM travel.customer_connect c " +
    " WHERE 1 ";

if (!customer.equalsIgnoreCase("All")) {
    query += " AND c.Customer_Name = '" + customer + "'";
}
if (!kamFilter.equalsIgnoreCase("All")) {
    query += " AND c.KAM = '" + kamFilter + "'";
}

query += " GROUP BY c.Region, c.City, Customer_Name, Contact, KAM";

System.out.println("Generated SQL Query: " + query);




            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            
            int totalRows = 0;



            
            
            int srNo = 1; // Initialize Sr. No
            while(rs.next()){
            String region = rs.getString("Region");
            String city = rs.getString("City");
            String customerName = rs.getString("CustomerName");

            String kam = rs.getString("KAM");
          
            
            int freq = rs.getInt("freq");
            int apr23Actual = rs.getInt("Apr23Actual");
            int may23Actual = rs.getInt("May23Actual");
            int jun23Actual = rs.getInt("Jun23Actual");
            int jul23Actual = rs.getInt("Jul23Actual");
            int aug23Actual = rs.getInt("Aug23Actual");
            int sep23Actual = rs.getInt("Sep23Actual");
            int oct23Actual = rs.getInt("Oct23Actual");
            int nov23Actual = rs.getInt("Nov23Actual");
            int dec23Actual = rs.getInt("Dec23Actual");
            int jan24Actual = rs.getInt("Jan24Actual");
            int feb24Actual = rs.getInt("Feb24Actual");
            int mar24Actual = rs.getInt("Mar24Actual");
           
            int totalActualSum = 0;

            // Calculate total actual
            int totalActual = apr23Actual + may23Actual + jun23Actual + jul23Actual + aug23Actual +
                              sep23Actual + oct23Actual + nov23Actual + dec23Actual + jan24Actual +
                              feb24Actual + mar24Actual;

            int apr23Planned = rs.getInt("Apr23Planned");
            int may23Planned = rs.getInt("May23Planned");
            int jun23Planned = rs.getInt("Jun23Planned");
            int jul23Planned = rs.getInt("Jul23Planned");
            int aug23Planned = rs.getInt("Aug23Planned");
            int sep23Planned = rs.getInt("Sep23Planned");
            int oct23Planned = rs.getInt("Oct23Planned");
            int nov23Planned = rs.getInt("Nov23Planned");
            int dec23Planned = rs.getInt("Dec23Planned");
            int jan24Planned = rs.getInt("Jan24Planned");
            int feb24Planned = rs.getInt("Feb24Planned");
            int mar24Planned = rs.getInt("Mar24Planned");
			
            // Calculate total planned
            int totalPlanned = apr23Planned + may23Planned + jun23Planned + jul23Planned +
                                aug23Planned + sep23Planned + oct23Planned + nov23Planned +
                                dec23Planned + jan24Planned + feb24Planned + mar24Planned;

            rowCounter++;
    %>
    <tr>
       <!--     <td><%= srNo++ %></td>
         <!-- <td><%= region %></td> -->
          <!-- <td><%= city %></td> -->
        <td rowspan="2"><%= customerName %></td>
           <!-- <td><%= rs.getString("Contact") %></td> -->

        <td rowspan="2"><%= kam %></td>
        <th>Planned</th>
        <!-- <td><%= freq %></td> -->
        <td><%= apr23Planned %> </td>
        <td><%= may23Planned %></td>
        <td><%= jun23Planned %></td>
        <td><%= jul23Planned %></td>
        <td><%= aug23Planned %></td>
        <td><%= sep23Planned %></td>
        <td><%= oct23Planned %></td> 
        <td><%= nov23Planned %></td>
        <td><%= dec23Planned %></td>
        <td><%= jan24Planned %></td>
        <td><%= feb24Planned %></td>
        <td><%= mar24Planned %></td>
        <td><%= totalPlanned %></td>

      
        
        
        
        
        
        </tr><tr>
        <th>Actual</th>
        <td><%= apr23Actual %> </td>
        <td><%= may23Actual %> </td>
        <td><%= jun23Actual %> </td>
        <td><%= jul23Actual %> </td>
        <td><%= aug23Actual %> </td>
        <td><%= sep23Actual %> </td>
        <td><%= oct23Actual %> </td>
        <td><%= nov23Actual %> </td>
        <td><%= dec23Actual %></td>
        <td> <%= jan24Actual %></td>
        <td><%= feb24Actual %></td>
        <td><%= mar24Actual %></td>
         <td><%=totalActual%></td>
  
    </tr>
    
  
    <%				
    			
            }      
            } catch (Exception e) {
            	 System.out.println("Exception: " + e.getMessage());
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
    
    <tr>
   

   
</tr>

</table>
<button onclick="exportTableToExcel()">Export table</button>
</div>
<script>


function loadSearchTravel(pageName) {
    let customer = $("#customer").val();
    let contact = $("#contact").val(); // Add parentheses to val function
    let data = { customer: customer, contact: contact };

    $("#contentDiv").html(ajaxLoader);

    $.ajax({
        url: "./include/" + pageName + ".jsp",
        type: "POST",
        data: data,
        success: function (result) {
            $("#contentDiv").html(result);
        },
    });

    hilightTab("LeftSideMenuTab", pageName + "_LeftSideMenuTab", "w3-blue");
}


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
    var filename = 'Customer Executive Report.xls';

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
filterTable();


</script>
</body>
</html>
