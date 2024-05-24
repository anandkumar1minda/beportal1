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
    margin-bottom: 8px; /* Smaller space between form elements */
}

.form-label {
    margin-bottom: 3px; /* Smaller space below labels */
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
    </style>
    <!-- Include your external CSS files or libraries here -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css">
    <!-- Include any other CSS or libraries you need -->
</head>
<body>
    <!-- Centered form container class="centered-form"-->
    <div class="ecrnTable">
        <header class="w3-container" style="padding-top:10px">
            <h5><b><i class="fa fa-dashboard"></i>EV - Portfolio</b></h5>
        </header>
        <form action="./include/EvProcess.jsp" method="post" class="w3-container w3-card w3-text-black w3-margin"
            style="background-color:white;">
            <table class="ecrnReq">
                <tr>
                 <tr>
    <th>Partner:</th>
    <td>
        <select id="partner" name="partner" class="appfields">
         <option value="" disabled selected>Select the Partner</option>
            <option value="Outdid">Outdid</option>
            <option value="VVDN">VVDN</option>
            <option value="Bhagyashree">Bhagyashree</option>
            <option value="Inhouse">Inhouse</option>
            <option value="EVQ">EVQ</option>
            <option value="DPC">DPC</option>
            <option value="Avnet">Avnet</option>
        </select>
    </td>
</tr>
<tr>
    <th>EVSE-7.2KW:</th>
    <td>
        <select id="evse_7_2kw" name="evse_7_2kw" class="appfields">
        	 <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<tr>
    <th>EVSE-11KW:</th>
    <td>
        <select id="evse_11kw" name="evse_11kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<!-- Similar blocks for other fields (Off-BC-350KW, Off-BC-600KW, etc.) -->
<tr>
    <th>Off-BC-350KW:</th>
    <td>
        <select id="off_bc_350kw" name="off_bc_350kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<tr>
    <th>Off-BC-600KW:</th>
    <td>
        <select id="off_bc_600kw" name="off_bc_600kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<tr>
    <th>Off-BC-1KW:</th>
    <td>
        <select id="off_bc_1kw" name="off_bc_1kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<tr>
    <th>Off-BC-2KW:</th>
    <td>
        <select id="off_bc_2kw" name="off_bc_2kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        <option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>
<tr>
    <th>Off-BC-3KW:</th>
    <td>
        <select id="off_bc_3kw" name="off_bc_3kw" class="appfields">
         <option value="" disabled selected>Preference...</option>
        	<option value=""></option>
            <option value="Preferred 1st">Preferred 1st</option>
            <option value="Preferred 2nd">Preferred 2nd</option>
            <option value="Preferred 3rd">Preferred 3rd</option>
        </select>
    </td>
</tr>

            </table>
            	<input type="submit" value="Submit" class="w3-button w3-section w3-blue w3-ripple">
            
            
        </form>
    </div>

    <!-- Include jQuery and DataTables libraries -->
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