<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Processing Page</title>
</head>
<body>
    <%
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            // Retrieve form data
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String quarter = request.getParameter("quarter");
            String month = request.getParameter("month");
            String dept = request.getParameter("dept");
            String purp = request.getParameter("purp");

            // Define your database connection parameters
            String jdbcURL = "jdbc:mysql://localhost:3306/travel"; // Replace with your database URL
            String dbUser = "root"; // Replace with your database username
            String dbPassword = "4342"; // Replace with your database password

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Create SQL insert statement
            String sql = "INSERT INTO award_record (name, category, quarter, month, dept, purp) VALUES (?, ?, ?, ?, ?, ?)";
            statement = conn.prepareStatement(sql);

            // Set parameters
            statement.setString(1, name);
            statement.setString(2, category);
            statement.setString(3, quarter);
            statement.setString(4, month);
            statement.setString(5, dept);
            statement.setString(6, purp);

            // Execute the insert statement
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
    %>
                <p>Data saved successfully!</p>
    <%
            } else {
    %>
                <p>Failed to save data.</p>
    <%
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
    %>
            <p>Error: <%= ex.getMessage() %></p>
    <%
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
