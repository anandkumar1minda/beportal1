<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
    <title>BV-5 Dashboard</title>
    <!-- Add necessary CSS libraries and styles -->
   <style>
        /* Add your CSS styles here */
        body {
            font-family: Rubik, sans-serif;
            margin: 0; /* Remove default body margin */
            padding: 0; /* Remove default body padding */										
        }

        .header {
            background-color: #107fee;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* Align form elements below the header */
            padding: 20px;
        }

        .centered-form {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px; /* Set a fixed width for the form */
        }

        .form-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px; /* Add space between form elements */
        }

        .form-label {
            margin-bottom: 5px; /* Add space below labels */
        }

        label, input, select {
            width: 100%; /* Make form elements full width */
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>    <!-- Include your external CSS files or libraries here -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css">
    <!-- Include any other CSS or libraries you need -->
</head>
<body>
    <!-- Centered form container class="centered-form"-->
    <div class="w3-row w3-section">
      <header class="w3-container" style="padding-top:10px">

    <h5><b><i class="fa fa-dashboard"></i>BV-5 Dashboard</b></h5>

</header>
        <form action="include/NewProcessTravel.jsp" method="post" class="w3-container w3-card w3-text-black w3-margin" 
        	style="background-color:white;">
        
        <table class="ecrnReq">
        <tr>
     
          <th>  From:</th>
          <td>
            <input type="date" id="fromDate" name="fromDate" onchange="calculateDays()" class="appfields"></td>
               <th>
            To:</th>
            <td>
            <input type="date" id="toDate" name="toDate" onchange="calculateDays()" class="appfields"></td>
            </tr>
            <tr>
             
             <th>
           Locations:</th>
           <td> <select name="location" class="appfields">
                <option value="Pune">Pune</option>
       <option value="Banglore">Banglore</option>
                <option value="chennai">Chennai</option>
                <option value="hyderabad">Hyderabad</option>
                <option value="hoshiarpur">hoshiarpur</option>
                <option value="gandhinagar">gandhinagar</option>
                <option value="chandigarh">chandigarh</option>
                <option value="mumbai">mumbai</option>
            </select></td>
             <th>days:</th>
          <td>  <input type="text" id="days" name="days" class="appfields" readonly ></td>
            
         
             
           
          </tr>
          <tr>
           <th> Purpose:</th>
           <td> <input type="text" id="purpose" name="purpose" class="appfields"></td>
         
           
         </tr>
           </table>
           
            <input type="submit" value="Submit" class="w3-button w3-section w3-blue w3-ripple">
        </form>
    </div>

    <!-- clude jQuery and DataTables libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

    <!-- JavaScript for date calculation -->
    <script>
        function calculateDays() {
            var fromDate = new Date(document.getElementById("fromDate").value);
            var toDate = new Date(document.getElementById("toDate").value);

            if (!isNaN(fromDate.getTime()) && !isNaN(toDate.getTime())) {
                var timeDiff = toDate - fromDate;
                var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
                document.getElementById("days").value = daysDiff + 1;
            }
        }
    </script>
</body>
</html>
