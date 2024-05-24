<!DOCTYPE html>
<html>

<head>
    <title>BV-5 Dashboard</title>
    <!-- Add necessary CSS libraries and styles -->
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Rubik, sans-serif;
            margin: 0;
            /* Remove default body margin */
            padding: 0;
            /* Remove default body padding */
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
            justify-content: flex-start;
            /* Align form elements below the header */
            padding: 20px;
        }

        .centered-form {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
            /* Set a fixed width for the form */
        }

        .form-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
            /* Add space between form elements */
        }

        .form-label {
            margin-bottom: 5px;
            /* Add space below labels */
        }

        label,
        input,
        select,
        textarea {
            width: 100%;
            /* Make form elements full width */
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
            <h5><b><i class="fa fa-dashboard"></i>Government Interactions</b></h5>
        </header>
        <form action="include/SaveGovtInteraction.jsp" method="post"
            class="w3-container w3-card w3-text-black w3-margin" style="background-color:white;">
            <table class="ecrnReq">
                <tr>
                    <th>Date of Event:</th>
                    <td><input type="date" id="date" name="date" class="appfields"></td>
                    <th>Type :</th>
                    <td>
                        <select id="type" name="type" class="appfields">
                            <option value="" disabled selected>Type</option>
                            <option value="Event Participation">Event Participation</option>
                            <option value="Publication">Publication</option>
                            <option value="Media Coverage">Media Coverage</option>
                        </select>
                    </td>
                    <th>Type of participation :</th>
                    <td>
                        <select id="typePart" name="typePart" class="appfields">
                            <option value="" disabled selected>Type of Participation</option>
                            <option value="Panel Discussion">Panel Discussion</option>
                            <option value="Keynote Speaker">Keynote Speaker</option>
                        </select>
                        <!-- Mode of Participation under Type of Participation -->
                        <th>Mode of participation :</th>
                        <td>
                            <select id="modePart" name="modePart" class="appfields">
                                <option value="" disabled selected>Mode of participation</option>
                                <option value="Virtual">Virtual</option>
                                <option value="Offline">Offline</option>
                            </select>
                        </td>
                </tr>
                <tr>
                    <th>Location:</th>
                    <td><input type="text" id="location" name="location" class="appfields"></td>
                    <th>Title:</th>
                    <td><input type="text" id="title" name="title" class="appfields"></td>
                </tr>
                <tr>
                    <th>Event Organized By:</th>
                    <td><input type="text" id="Loc" name="Loc" class="appfields"></td>
                    <th>Panel Speaker:</th>
                    <td><input type="text" id="Desc" name="Desc" class="appfields"></td>
                    <!-- Add a new row for Media Coverages -->
                    <th>Type of activity:</th>
                    <td>
                        <select id="mediaType" name="mediaType" class="appfields">
                            <option value="" disabled selected>Type of Activity</option>
                            <option value="Industry Story">Industry Story</option>
                            <option value="RBM">RBM</option>
                            <option value="Video Interaction">Video Interaction</option>
                            <option value="Authored Article">Authored Article</option>
                            <option value="Event Coverages">Event Coverages</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Media House:</th>
                    <td><input type="text" id="mediaHouse" name="mediaHouse" class="appfields"></td>
                    <th>Link to Article Publication:</th>
                    <td><input type="text" id="articleLink" name="articleLink" class="appfields"></td>
                    <th>Upload of the Article Picture:</th>
                    <td><input type="file" id="articlePicture" name="articlePicture" class="appfields"></td>
                </tr>
            </table>
            <input type="submit" value="Submit" class="w3-button w3-section w3-blue w3-ripple">
        </form>
        <!-- New div for Media Coverages -->
        <div id="mediaCoverageSection" class="w3-row w3-section">
            <!-- Add your input fields for Media Coverages here -->
        </div>
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
