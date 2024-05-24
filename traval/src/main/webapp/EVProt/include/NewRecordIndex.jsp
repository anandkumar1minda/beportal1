<!DOCTYPE html>
<html>
<head>
    <title>BV-5 Dashboard</title>
     <style>
        /* Add your CSS styles here */
        body {
            font-family: Rubik, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh; /* Ensure full height of the viewport */
        }

        .header {
            background-color: #107fee;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        .form-container {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 400px; /* Limit the maximum width of the form */
            margin: 0 auto; /* Center the form horizontally */
        }

        .form-row {
            margin-bottom: 20px; /* Increased spacing between form elements */
        }

        .form-label {
            font-weight: bold; /* Make labels bold for better visibility */
        }

        .appfields {
            width: 100%;
            padding: 15px; /* Increased padding for greater height */
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .radio-label {
            display: inline-block;
            margin-right: 20px;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Form container class="centered-form" -->
    <div class="w3-row w3-section">
        <header class="w3-container" style="padding-top:10px">
            <h1><b><i class="fa fa-dashboard"></i>Award Record</b></h1>
        </header>
        <form action="include/RecordProcess.jsp" method="post" class="w3-container w3-card w3-text-black w3-margin" 
            style="background-color:white;">
            <table class="ecrnReq">
                <tr>
                    <th>Name</th>
                    <td><input type="text" id="name" name="name" class="appfields" placeholder="Enter your name"></td>
                </tr>
                <tr>
                    <th>Category:</th>
                    <td>
                        <input type="radio" id="individual" name="category" value="Individual" required>
                        <label for="individual">Individual</label>
                        <input type="radio" id="team" name="category" value="Team" required>
                        <label for="team">Team</label>
                    </td>
                </tr>
                <tr>
                    <th>Quarter</th>
                    <td><input type="text" id="quarter" name="quarter" class="appfields" placeholder="Enter the quarter"></td>
                </tr>
                <tr>
                    <th>Month</th>
              <td>  <input type="text" id="month" name="month" class="appfields" placeholder="Enter the month"></td>
                </tr>
                <tr>
                    <th>Department:</th>
                    <td><input type="text" id="dept" name="dept" class="appfields" placeholder="Enter your department"></td>
                </tr>
                <tr>
                    <th>Purpose:</th>
                    <td><input type="text" id="purp" name="purp" class="appfields" placeholder="Enter the purpose"></td>
                </tr>
            </table>
            <input type="submit" value="Submit" class="w3-button w3-section w3-blue w3-ripple">
        </form>
    </div>

    <!-- Include jQuery and DataTables libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
</body>
</html>
