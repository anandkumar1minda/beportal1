<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EV - Portfolio Table</title>
    <!-- Add necessary CSS styles here -->
      <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
        }

        .portfolio-heading {
            text-align: center;
            font-family: 'Arial', sans-serif; /* Change the font for the specific section */
            font-size: 24px; /* Adjust the font size */
            font-weight: bold; /* Add bold font-weight */
            margin-bottom: 20px; /* Add some margin for spacing */
            color: #007BFF; /* Set the color to a professional tone */
        }

        .table-wrapper {
            overflow-x: auto;
            margin-top: 0px;
            text-align: center;
        }

        .table-wrapper table.sticky-header-table {
    width: 70%;
    border-collapse: collapse;
    margin-top: 10px;
    margin: 0 auto;
    border: none; /* Remove the border */
}

        .table-wrapper th,
        .table-wrapper td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            height: 2px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 14px;
            font-weight: bold;
        }

        .table-wrapper th {
            position: sticky;
            top: 0;
            background-color: #007BFF;
            color: white;
            z-index: 2;
        }

        .table-wrapper thead {
            display: block;
            position: sticky;
            top: 0;
            background-color: #007BFF;
            color: white;
            z-index: 3;
        }

        .table-wrapper tbody {
            display: block;
            overflow-y: auto;
            max-height: 700px;
        }

        .table-wrapper tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table-wrapper tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
  <div class="portfolio-heading">EV - Portfolio Analysis</div>

    <h2>EV - Portfolio Table</h2>

    <% 
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio_ev", "root", "FGh%4#45ndF32");

        // SQL query to retrieve data
        String sql = "SELECT * FROM portfoliomaster";
        statement = connection.createStatement();
        resultSet = statement.executeQuery(sql);

        // Display the table
    %><div class="table-wrapper">
    
    
       <table class="sticky-header-table" border="1">
            <tr>
                <th>Partner</th>
                <th>EVSE-7.2KW</th>
                <th>EVSE-11KW</th>
                <th>Off-BC-350KW</th>
                <th>Off-BC-600KW</th>
                <th>Off-BC-1KW</th>
                <th>Off-BC-2KW</th>
                <th>Off-BC-3KW</th>
            </tr>
            <% while(resultSet.next()) { %>
                <tr>
                    <td><%= resultSet.getString("partner") %></td>
                    <td><%= resultSet.getString("EVSE-7.2KW") %></td>
                    <td><%= resultSet.getString("EVSE-11KW") %></td>
                    <td><%= resultSet.getString("Off-BC-350W") %></td>
                    <td><%= resultSet.getString("Off-BC-600W") %></td>
                    <td><%= resultSet.getString("Off-BC-1KW") %></td>
                    <td><%= resultSet.getString("Off-BC-2KW") %></td>
                    <td><%= resultSet.getString("Off-BC-3KW") %></td>
                </tr>
            <% } %>
        </table>
        </div>
    <% 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the resources
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>

</body>
</html>
