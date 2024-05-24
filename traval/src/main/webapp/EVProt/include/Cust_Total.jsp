<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer total</title>
    <style>
        /* Add CSS styles for the table if needed */
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

        /* Style for the button */
        .styled-button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }w

        .styled-button:hover {
            background-color: #0056b3;
        }

        /* Style for the filter input fields */
        .filter-input {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 0px;
        }

        /* Style for the filter button */
        .filter-button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        /* Style for the filter input fields */
.filter-input {
    margin: 0px 0;
}

/* Style for input elements */
.filter-input input {
    width: 20%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
    outline: none; /* Remove outline */
}

/* Add a subtle hover effect */
.filter-input input:hover {
    border-color: #007BFF;
}

/* Style for labels */
.filter-input label {
    display: block;
    margin-bottom: 5px;
    color: #007BFF;
}

        
        
    </style>
</head>
<body>
    <h1>Customer Interactions</h1>
    <%
     String dateFilter = request.getParameter("date")==null?"":request.getParameter("date");
            String publicationFilter = request.getParameter("publication")==null?"":request.getParameter("publication");
            String interactionFilter = request.getParameter("interaction")==null?"":request.getParameter("interaction");
            System.out.println(dateFilter);
            %>
         
    <!-- Filter input fields -->
  
        <!-- Date Filter -->
        <div class="filter-input">
            <label for="dateFilter" style="color: black;">Select Date of Publication:</label>
            <input type="date" id="dateFilter" name="date" value="<%=dateFilter %>" onchange="loadSearchTravel('Govt_table')">
        </div>

        <!-- Publication Filter -->
        <div class="filter-input">
            <label for="publicationFilter" style="color: black;">Select Publication:</label>
            <input type="text" id="publicationFilter" name="publication"  value="<%=publicationFilter %>"onchange="loadSearchTravel('Govt_table')">
        </div>

        <!-- Interaction Filter -->
        <div class="filter-input">
            <label for="interactionFilter" style="color: black;">Select Govt. Interaction:</label>
            <input type="text" id="interactionFilter" name="interaction"  value="<%=interactionFilter %>" onchange="loadSearchTravel('Govt_table')" >
        </div>

        
      <button onclick="exportTableToExcel()">Export table</button>	
    <table border="1">
        <tr>
            <th>Date of Publication</th>
            <th>Description</th>
            <th>Publication</th>
            <th>Headline</th>
            <th>Link</th>
            <th>Govt. Interaction</th>
        </tr>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int rowCounter = 1;
           

            try {
                // Establish a database connection (modify with your database credentials)
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "4342");

                // Create and execute SQL query to retrieve filtered data from the database
                String query = "SELECT * FROM travel.govt_interaction WHERE MONTH(DateOfPublication) in(1,2,3,4,5,6,7,8,9,10,11,12) " ;
                if(!dateFilter.equalsIgnoreCase("")){
                	query+="  AND Date_Format(DateOfPublication,'%Y-%m-%d')='"+dateFilter+"'";
                }
                if(!publicationFilter.equalsIgnoreCase("")){
                	query+="  AND Publication='"+publicationFilter+"'";
                }
                if(!interactionFilter.equalsIgnoreCase("")){
                	query+="  AND GovtInteraction='"+interactionFilter+"'";
                }
                System.out.println(query);
    pstmt = conn.prepareStatement(query);

    // Set parameters for the prepared statement
    

                rs = pstmt.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("DateOfPublication") %></td>
            <td><%= rs.getString("Description") %></td>
            <td><%= rs.getString("Publication") %></td>
            <td><%= rs.getString("Headline") %></td>
            <td><a href="<%= rs.getString("Link") %>"><%= rs.getString("Link") %></a></td>
            <td><%= rs.getString("GovtInteraction") %></td>
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
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        %>
    </table>

    <!-- Button to go to Government Index -->
     <button type="button" onClick="loadSearch('NewGovtIndex','contentDiv')" class="styled-button">Go to Government Index</button>
</body>
<script type="text/javascript">
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
	let date=$("#dateFilter").val();
	let publication=$ ("#publicationFilter").val();	
	let interaction=$ ("#interactionFilter").val();
	let data = {date:date, publication:publication, interaction:interaction} ;
	//alert(data);
	
	$("#contentDiv").html(ajaxLoader);
	
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){	  
        $("#contentDiv").html(result);         
   }});
                            
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
 }
</script>
</html>
