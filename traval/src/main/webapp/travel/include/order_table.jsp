`<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Won</title>
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
            margin-bottom: 20px;
            padding:20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
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
    width: 25%; /* Adjust the width as needed */
    display: flex;
    flex-direction: column; /* Display filter elements vertically */
    justify-content: space-between;
    align-items: center;
    background-color: #007BFF;
    padding: 20px;
    border-radius: 5px; /* Add some border radius for a smoother look */
    margin-bottom: 60px;
    border: 1px solid #ddd; /* Add a border to the filter container */
}


        /* Style for each filter input container */
        .filter-input {
    margin-bottom: 10px; /* Add margin to create a gap between each filter */
    background-color: #f2f2f2; /* Change the background color */
  
    padding: 10px;
    border-radius: 5px;
}
        /* Style for labels */
       label {
    font-weight: bold;
    color: #333; /* Change label text color */
}

        /* Style for input fields */
        input[type="text"] {
    width: 20%;
    padding: 8px;
    border: 2px solid #007BFF; /* Blue border color */
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
    .filter-input.amount-input {
    margin-bottom: 20px; /* Add more margin to create additional space */
    background-color: #f2f2f2; /* Change the background color */
    border: none; /* Remove the border */
    padding: 10px;
    border-radius: 5px;
}
label {
    font-weight: bold;
    color: #333; /* Change label text color */
}
input[type="text"] {
    width: 20%;
    padding: 8px;
    border: 2px solid #007BFF; /* Blue border color */
    border-radius: 3px;
    font-size: 14px;
    color: #333; /* Dark text color */
    background-color: #fff; /* White background color */
}
input[type="text"]::placeholder {
    color: #aaa; /* Light gray placeholder text color */
}
.input-container {
	width: 20%;
    display: flex;
    align-items: center;
    background-color: #fff;
    border: 1px solid #007BFF;
    border-radius: 3px;
    padding: 8px;
}
.input-container input[type="date"] {
    width: 100%;
    border: none;
    font-size: 14px;
    color: #333;
    background: transparent;
    outline: none;
}
   
   
    </style>
    
</head>
<body class="w3-light-grey">
    <!-- ... (other body content) ... -->
    <div class="w3-container" id="contentDiv" style="padding-top:1px !important;margin-top:1px !important;"></div>
        <%
        String sopFilter = request.getParameter("sop")==null?"":request.getParameter("sop");
        String orderFilter = request.getParameter("order")==null?"":request.getParameter("order");
        String divFilter = request.getParameter("division")==null?"":request.getParameter("division");
        String custFilter = request.getParameter("customer")==null?"":request.getParameter("customer");
        String amtFilter = request.getParameter("amount")==null?"":request.getParameter("amount");
        
        System.out.println(sopFilter);
        
        %>
      <div class="filter-input">
    <label for="sopFilter">SOP:</label>
    <div class="input-container">
        <input type="date" id="sopFilter" name="sopFilter" value="<%=sopFilter %>" onchange="loadSearchTravel('order_table')">
    </div>
</div>

        
          <div class="filter-input">
    <label for="divFilter">Division:</label>
    <input type="text" id="divFilter" name="divFilter" value="<%=divFilter %>"placeholder="Enter Division" onchange="loadSearchTravel('order_table')">
</div>
        
        <div class="filter-input">
    <label for="custFilter">Customer:</label>
    <input type="text" id="custFilter" name="custFilter" value="<%=custFilter %>"placeholder="Enter Customer" onchange="loadSearchTravel('order_table')">
</div>
        
     <div class="filter-input amount-input">
    <label for="amtFilter">Amount:</label>
    <input type="text" id="amtFilter" name="amtFilter" value="<%=amtFilter %>" placeholder="Enter Amount" onchange="loadSearchTravel('order_table')">
</div>
        
        <div class="filter-input">
    <label for="orderFilter">Order:</label>
    <input type="text" id="orderFilter" name="orderFilter" value="<%=orderFilter %>"placeholder="Enter Order" onchange="loadSearchTravel('order_table')">
</div>
        
        
        <button onClick="exportTableToExcel()">Export table</button>
		<table border="1">
		 <tr>
                <th>Order No</th>
                <th>Division</th>
                <th>Customer</th>
                <th>Product Segment</th>
                <th>Date of Receiving</th>
                <th>Amount</th>
                <th>SOP Date</th>
            </tr>
            <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rowCounter =1;
        
        try {
            // Establish a database connection (modify with your database credentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "FGh%4#45ndF32");

            String query = "SELECT * FROM travel.order_won WHERE 1 " ;
            if(!sopFilter.equalsIgnoreCase("")){
            	query+=" AND Date_Format(sop_date, '%Y-%m-%d')='"+sopFilter+"'";
            }
            if(!divFilter.equalsIgnoreCase("")) {
            	query+=" AND division='"+divFilter+"'";
            }
            if(!custFilter.equalsIgnoreCase("")) {
            	query+=" AND  customer='"+custFilter+"'";
            }
            if(!amtFilter.equalsIgnoreCase("")) {
            	query+=" AND amount='"+amtFilter+"'";
            }
            if(!orderFilter.equalsIgnoreCase("")) {
            	query+=" AND order_no='"+orderFilter+"'";
            }
            System.out.println(query);
            stmt = conn.prepareStatement(query);
            		
            		
            		rs= stmt.executeQuery();
            		
            		while (rs.next())	{
            			
            			%>
            			<tr>
            				<td><%= rs.getString("order_no")%></td>
            				<td><%= rs.getString("division")%></td>
            				<td><%= rs.getString("customer")%></td>
            				<td><%= rs.getString("product_seg")%></td>
            				<td><%= rs.getString("date_of_rec")%></td>
            				<td><%= rs.getString("amount")%></td>
            				<td><%= rs.getString("sop_date")%></td>
            				</tr>
            				<%
            				
            							}
        }	catch (Exception e) {
        		out.println("Database error: " + e.getMessage());
        		e.printStackTrace();
        }finally {
        	//Close resource
        	if (rs !=null) {
        		rs.close();
        	}
        	if (stmt != null) {
        		stmt.close ();
        	}
        	if (conn !=null) {
        		conn.close();
        	}
        	
        }
       %>
      </table>
      
      <button type="button" onClick="loadSearch('order_new','contentdiv')" class="styled-button">Go to Order Index</button>
      </body>
     
     <script type= "text/javascript">
     function loadSearchTravel (pageName) {
    	 let sop=$("#sopFilter").val()   
    	 let division=$("#divFilter").val();
    	 let customer=$("#custFilter").val();
    	 let amount=$("#amtFilter").val();
    	 let order=$("#orderFilter").val();
    	 let data = {sop:sop, division:division, customer:customer, amount:amount, order: order};
    	 
    	 
    	 $("#contentDiv").html(ajaxLoader);
    	 
    	 $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){
    		 $("#contentDiv").html(result);
    		 
    	 }});
    	 hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");
    	 
    	 }
     </script>
     </html>