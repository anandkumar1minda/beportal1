<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
Connection conn = null;
try {
    // Establish a database connection (modify with your database credentials)
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio_ev", "root", "FGh%4#45ndF32");

    // Form data
    String partner = request.getParameter("partner");
    String evse_7_2kw = request.getParameter("evse_7_2kw");
    String evse_11kw = request.getParameter("evse_11kw");
    String off_bc_350kw = request.getParameter("off_bc_350kw");
    String off_bc_600kw = request.getParameter("off_bc_600kw");
    String off_bc_1kw = request.getParameter("off_bc_1kw");
    String off_bc_2kw = request.getParameter("off_bc_2kw");
    String off_bc_3kw = request.getParameter("off_bc_3kw");

    // JDBC variables
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    
        // SQL query for insertion
        String sql = "INSERT INTO portfolio_ev.portfoliomaster (partner, `EVSE-7.2KW`, `EVSE-11KW`, `Off-BC-350W`, `Off-BC-600W`, `Off-BC-1KW`, `Off-BC-2KW`, `Off-BC-3KW`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Prepare the statement
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, partner);
        preparedStatement.setString(2, evse_7_2kw);
        preparedStatement.setString(3, evse_11kw);
        preparedStatement.setString(4, off_bc_350kw);
        preparedStatement.setString(5, off_bc_600kw);
        preparedStatement.setString(6, off_bc_1kw);
        preparedStatement.setString(7, off_bc_2kw);
        preparedStatement.setString(8, off_bc_3kw);

        // Execute the statement
        // Execute the query
        preparedStatement.executeUpdate();
        %>
        <h1>Data Saved Successfully</h1>
        <%
        } catch (Exception e) {
            out.println("Database error: " + e.getMessage());
            e.printStackTrace();

        %>
        <h1>Error Saving Data</h1>
        <%   
        } finally {
            // Close the database connection
            if (conn != null) {
                conn.close();
            }
        }
        
        %>
      <button onclick="goBack()" class="w3-button w3-blue w3-hover-light-blue w3-round-xxlarge">
        Go Back
    </button>
  

    </body>
    <script>
    function goBack() {
        window.history.back(); // This will take you to the previous page in the browsing history.
    }
    </script>
    </html>
                    