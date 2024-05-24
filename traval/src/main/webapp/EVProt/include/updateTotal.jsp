<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Get the selected year from the query parameter
    String selectedYear = request.getParameter("selectedYear");

    // Establish a database connection (modify with your database credentials)
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "4342");

        // Create and execute SQL query to retrieve the updated "Total" row
        String totalQuery = "SELECT " +
                "SUM(CASE WHEN MONTH(`From`) = 1 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS January, " +
                "SUM(CASE WHEN MONTH(`From`) = 2 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS February, " +
                "SUM(CASE WHEN MONTH(`From`) = 3 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS March, " +
                "SUM(CASE WHEN MONTH(`From`) = 4 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS April, " +
                "SUM(CASE WHEN MONTH(`From`) = 5 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS May, " +
                "SUM(CASE WHEN MONTH(`From`) = 6 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS June, " +
                "SUM(CASE WHEN MONTH(`From`) = 7 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS July, " +
                "SUM(CASE WHEN MONTH(`From`) = 8 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS August, " +
                "SUM(CASE WHEN MONTH(`From`) = 9 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS September, " +
                "SUM(CASE WHEN MONTH(`From`) = 10 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS October, " +
                "SUM(CASE WHEN MONTH(`From`) = 11 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS November, " +
                "SUM(CASE WHEN MONTH(`From`) = 12 THEN DATEDIFF(`To`, `From`) + 1 ELSE 0 END) AS December " +
                "FROM travel.travel_request " +
                "WHERE CASE WHEN MONTH(`from`) >= 4 THEN CONCAT(YEAR(`from`), '-', YEAR(`from`) + 1) ELSE CONCAT(YEAR(`from`) - 1, '-', YEAR(`from`)) END = ?";
        
        PreparedStatement pstmt = conn.prepareStatement(totalQuery);
        pstmt.setString(1, selectedYear);

        rs = pstmt.executeQuery();

        // Initialize an array to store monthly totals
        int[] monthlyTotals = new int[12];

        if (rs.next()) {
            for (int i = 1; i <= 12; i++) {
                monthlyTotals[i - 1] = rs.getInt(i);
            }
        }
%>
        <!-- Display the updated "Total" row -->
        <tr>
            <th colspan='2'>Total</th>
<%
        for (int i = 0; i < 12; i++) {
%>
            <th><%= monthlyTotals[i] %></th>
<%
        }
        int totalTotal = Arrays.stream(monthlyTotals).sum();
%>
            <td><%= totalTotal %></td>
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
