<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <!-- ... your existing HTML and styles ... -->
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
          button.filter-button {
            background-color: #4CAF50; /* Green background color */
            color: white; /* White text color */
            padding: 10px 20px; /* Padding around text */
            border: none; /* No border */
            border-radius: 3px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
        }
         button.filter-button:hover {
            background-color: #45a049; /* Darker green background color on hover */
        }
    
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
    </style>
</head>
<body>
<div class="w3-row w3-section">
    <header class="w3-container" style="padding-top:10px">
        <h5><b><i class="fa fa-dashboard"></i>Monthly Data</b></h5></header></div>
<!-- Generate the HTML table directly in this script -->

<button onclick="exportTableToExcel()">Export table</button>
<!-- ... your existing HTML ... -->
<div class="filter-form">
    <div class="filter-input">
        <label for="monthFilter">Month:</label>
        <input type="text" id="monthFilter" placeholder="Filter by month...">
    </div>
    <div class="filter-input">
        <label for="customerFilter">Customer Name:</label>
        <input type="text" id="customerFilter" placeholder="Filter by customer name...">
    </div>
    <div class="filter-input">
        <label for="visitsFilter">No. of Visits:</label>
        <input type="text" id="visitsFilter" placeholder="Filter by visits...">
    </div>
    <div class="filter-input">
        <label for="modeFilter">Mode:</label>
        <input type="text" id="modeFilter" placeholder="Filter by mode...">
    </div>
</div>
<button class="filter-button" onclick="filterTable()">Filter</button> <!-- Apply the new CSS class -->
<!-- ... your existing HTML ... -->
<table border="1">
    <tr>
        <th>Month</th>
        <th>Customer</th>
        <th>No. of Visits</th>
        <th>Online/Face to Face</th>
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");

            // Create and execute SQL query to fetch required data
            String query = "SELECT MONTH(date) AS month, Customer_Name, COUNT(*) AS numVisits, " +
                    "SUM(CASE WHEN mode = 'Online' THEN 1 ELSE 0 END) AS onlineVisits, " +
                    "SUM(CASE WHEN mode = 'Offline' THEN 1 ELSE 0 END) AS offlineVisits " +
                    "FROM travel.customer_connect_actual " +
                    "GROUP BY month, Customer_Name " +
                    "ORDER BY month, Customer_Name";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            // Iterate through the result set and generate table rows
            while (rs.next()) {
                int monthNumber = rs.getInt("month");
                String month;
                switch (monthNumber) {
                    case 1:
                        month = "January";
                        break;
                    case 2:
                        month = "February";
                        break;
                    case 3:
                        month = "March";
                        break;
                    case 4:
                        month = "April";
                        break;
                    case 5:
                        month = "May";
                        break;
                    case 6:
                        month = "June";
                        break;
                    case 7:
                        month = "July";
                        break;
                    case 8:
                        month = "August";
                        break;
                    case 9:
                        month = "September";
                        break;
                    case 10:
                        month = "October";
                        break;
                    case 11:
                        month = "November";
                        break;
                    case 12:
                        month = "December";
                        break;
                    default:
                        month = "Unknown";
                        break;
                }

                String customer = rs.getString("Customer_Name");
                int numVisits = rs.getInt("numVisits");
                String onlineOrFaceToFace = (rs.getInt("onlineVisits") > 0) ? "Online" : "Face to Face";
    %>
    <tr>
        <td><%= month %></td>
        <td><%= customer %></td>
        <td><%= numVisits %></td>
        <td><%= onlineOrFaceToFace %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500); // Set HTTP status code to indicate an error
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
<button onclick="loadLinkContent('NewCustIndex','contentDiv')">Add new entry</button>

</body>
<script>
    function filterTable() {
        var monthFilter = document.getElementById('monthFilter').value.toLowerCase();
        var customerFilter = document.getElementById('customerFilter').value.toLowerCase();
        var visitsFilter = document.getElementById('visitsFilter').value.toLowerCase();
        var modeFilter = document.getElementById('modeFilter').value.toLowerCase();
        var table = document.querySelector('table');
        var rows = table.getElementsByTagName('tr');

        for (var i = 1; i < rows.length; i++) {
            var row = rows[i];
            var cells = row.getElementsByTagName('td');
            var month = cells[0].textContent.toLowerCase();
            var customer = cells[1].textContent.toLowerCase();
            var visits = cells[2].textContent.toLowerCase();
            var mode = cells[3].textContent.toLowerCase();

            // Check if row matches the filter criteria
            if (
                (month.includes(monthFilter) || monthFilter === '') &&
                (customer.includes(customerFilter) || customerFilter === '') &&
                (visits.includes(visitsFilter) || visitsFilter === '') &&
                (mode.includes(modeFilter) || modeFilter === '')
            ) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
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
        var filename = 'Monthly Summary.xls';

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
</html>
