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

        label, input, select, textarea {
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
    <div class="w3-row w3-section">
        <header class="w3-container" style="padding-top:10px">
            <h5><b><i class="fa fa-dashboard"></i>Customer Connect Report Tool</b></h5>
        </header>
        <form action="include/CustProcess.jsp" method="post" class="w3-container w3-card w3-text-black w3-margin" 
            style="background-color:white;">
            <table class="ecrnReq">
                <tr>
                    <th>Customer Name:</th>
                    <td><input type="text" id="Customer_Name" name="Customer_Name" class="appfields"></td>
                    <th>Date:</th>
                    <td><input type="date" id="date" name="date" class="appfields"></td>
                </tr>
                <tr>
                    <th>Place:</th>
                    <td><input type="text" id="place" name="place" class="appfields"></td>
                    <th>Meeting Objective:</th>
                    <td><input type="text" id="meetObj" name="meetObj" class="appfields"></td>
                </tr>
                <tr>
                    <th>Customer Participants:<br>
                    <span class='smallfont'>(If multiple entries, separate it by adding comma) </span></th>
                     
                    <td>
                        <input type="text" id="custPart" name="custPart" class="appfields"></input>
                    </td>
                    <th>Mode</th>
                    <td>
                        <select id="mode" name="mode" class="appfields">
                            <option value="" disabled selected>Select the mode</option>
                            <option value="Online">Online</option>
                            <option value="Face-to-Face">Face-to-Face</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Spark Minda Participants: <br>
                     <span class='smallfont'>(If multiple entries, separate it by adding comma) </span></th>
                    <td>
                        <input type="text" id="mindaPart" name="mindaPart" class="appfields"></input>
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
        function formatTextareaDataForSQL() {
            const custPartTextarea = document.getElementById("custPart");
            const mindaPartTextarea = document.getElementById("mindaPart");

            if (custPartTextarea) {
                const custPartValue = custPartTextarea.value.trim().split('\n').map(entry => entry.trim()).join('\', \'');
                custPartTextarea.value = '\'' + custPartValue + '\'';
            }

            if (mindaPartTextarea) {
                const mindaPartValue = mindaPartTextarea.value.trim().split('\n').map(entry => entry.trim()).join('\', \'');
                mindaPartTextarea.value = '\'' + mindaPartValue + '\'';
            }
        }

        // Add event listener to format data before form submission
        document.querySelector('form').addEventListener('submit', formatTextareaDataForSQL);
    </script>
</body>
</html>
