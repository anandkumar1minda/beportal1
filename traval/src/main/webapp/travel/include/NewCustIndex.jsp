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
        <form class="w3-container w3-card w3-text-black w3-margin" 
    style="background-color:white;" >
     <% String customer=request.getParameter("Customer_Name")==null?"":request.getParameter("Customer_Name"); %>       
         
            
            <table class="ecrnReq">
                <tr>
                    <th>Customer Name:</th>
                    <td>
                    
                    <select class="appfields" id="Customer_Name" name="Customer_Name" >
    <option value="" <%= customer.equalsIgnoreCase("") ? "selected" : "" %>>Select Customer </option>
    <option value="Mahindra" <%= customer.equalsIgnoreCase("Mahindra") ? "selected" : "" %>>Mahindra</option>
    <option value="CLPL" <%= customer.equalsIgnoreCase("CLPL") ? "selected" : "" %>>CLPL</option>
    <option value="Bajaj" <%= customer.equalsIgnoreCase("Bajaj") ? "selected" : "" %>>Bajaj</option>
    <option value="KTM" <%= customer.equalsIgnoreCase("KTM") ? "selected" : "" %>>KTM</option>
    <option value="TATA" <%= customer.equalsIgnoreCase("TATA") ? "selected" : "" %>>TATA</option>
    <option value="Volvo Eicher" <%= customer.equalsIgnoreCase("Volvo Eicher") ? "selected" : "" %>>Volvo Eicher</option>
    <option value="Piaggio" <%= customer.equalsIgnoreCase("Piaggio") ? "selected" : "" %>>Piaggio</option>
    <option value="Dana" <%= customer.equalsIgnoreCase("Dana") ? "selected" : "" %>>Dana</option>
    <option value="TMTL" <%= customer.equalsIgnoreCase("TMTL") ? "selected" : "" %>>TMTL</option>
    <option value="Kawasaki" <%= customer.equalsIgnoreCase("Kawasaki") ? "selected" : "" %>>Kawasaki</option>
    <option value="Green Cell Mobility" <%= customer.equalsIgnoreCase("Green Cell Mobility") ? "selected" : "" %>>Green Cell Mobility</option>
    <option value="VW India" <%= customer.equalsIgnoreCase("VW India") ? "selected" : "" %>>VW India</option>
    <option value="Polarity" <%= customer.equalsIgnoreCase("Polarity") ? "selected" : "" %>>Polarity</option>
    <option value="TAFE" <%= customer.equalsIgnoreCase("TAFE") ? "selected" : "" %>>TAFE</option>
    <option value="TVS" <%= customer.equalsIgnoreCase("TVS") ? "selected" : "" %>>TVS</option>
    <option value="Ashok Leyland" <%= customer.equalsIgnoreCase("Ashok Leyland") ? "selected" : "" %>>Ashok Leyland</option>
    <option value="RE" <%= customer.equalsIgnoreCase("RE") ? "selected" : "" %>>RE</option>
    <option value="Olcetra" <%= customer.equalsIgnoreCase("Olcetra") ? "selected" : "" %>>Olcetra</option>
    <option value="Sun-Mobility" <%= customer.equalsIgnoreCase("Sun-Mobility") ? "selected" : "" %>>Sun-Mobility</option>
    <option value="Ti Clean Mobility" <%= customer.equalsIgnoreCase("Ti Clean Mobility") ? "selected" : "" %>>Ti Clean Mobility</option>
    <option value="Virya Mobility" <%= customer.equalsIgnoreCase("Virya Mobility") ? "selected" : "" %>>Virya Mobility</option>
    <option value="Switch Mobility" <%= customer.equalsIgnoreCase("Switch Mobility") ? "selected" : "" %>>Switch Mobility</option>
    <option value="Ultraviolette" <%= customer.equalsIgnoreCase("Ultraviolette") ? "selected" : "" %>>Ultraviolette</option>
    <option value="Daimler" <%= customer.equalsIgnoreCase("Daimler") ? "selected" : "" %>>Daimler</option>
    <option value="Kia" <%= customer.equalsIgnoreCase("Kia") ? "selected" : "" %>>Kia</option>
    <option value="Hero Motocorp" <%= customer.equalsIgnoreCase("Hero Motocorp") ? "selected" : "" %>>Hero Motocorp</option>
    <option value="ITL" <%= customer.equalsIgnoreCase("ITL") ? "selected" : "" %>>ITL</option>
    <option value="Honda 2W" <%= customer.equalsIgnoreCase("Honda 2W") ? "selected" : "" %>>Honda 2W</option>
    <option value="Escorts" <%= customer.equalsIgnoreCase("Escorts") ? "selected" : "" %>>Escorts</option>
    <option value="Suzuki" <%= customer.equalsIgnoreCase("Suzuki") ? "selected" : "" %>>Suzuki</option>
    <option value="Hero Electric Pvt Ltd." <%= customer.equalsIgnoreCase("Hero Electric Pvt Ltd.") ? "selected" : "" %>>Hero Electric Pvt Ltd.</option>
    <option value="Revolt" <%= customer.equalsIgnoreCase("Revolt") ? "selected" : "" %>>Revolt</option>
    <option value="PMI Mobility" <%= customer.equalsIgnoreCase("PMI Mobility") ? "selected" : "" %>>PMI Mobility</option>
    <option value="CNH" <%= customer.equalsIgnoreCase("CNH") ? "selected" : "" %>>CNH</option>
    <option value="Baxy Mobility" <%= customer.equalsIgnoreCase("Baxy Mobility") ? "selected" : "" %>>Baxy Mobility</option>
    <option value="Infac (Hyundai)" <%= customer.equalsIgnoreCase("Infac (Hyundai)") ? "selected" : "" %>>Infac (Hyundai)</option>
    <option value="Infac (Stellantis)" <%= customer.equalsIgnoreCase("Infac (Stellantis)") ? "selected" : "" %>>Infac (Stellantis)</option>
</select>
                    </td>
                    <th>Date:</th>
                    <td><input type="date" id="date" name="date" class="appfields" required></td>
                </tr>
                <tr>
                    <th>Place:</th>
                    <td><input type="text" id="place" name="place" class="appfields" required></td>
                    <th>Meeting Objective:</th>
                    <td><input type="text" id="meetObj" name="meetObj" class="appfields" required></td>
                </tr>
                <tr>
                    <th>Customer Participants:<br>
                    <span class='smallfont'>(If multiple entries, separate it by adding comma) </span></th>
                     
                    <td>
                        <input type="text" id="custPart" name="custPart" class="appfields" required></input>
                    </td>
                    <th>Mode</th>
                    <td>
                        <select id="mode" name="mode" class="appfields" required>
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
                        <input type="text" id="mindaPart" name="mindaPart" class="appfields" required></input>
                    </td>
                </tr>
            </table>
            <div id="submitdiv" class="w3-center">
            <input type="submit" onClick="submitNewRequest()" value="Submit" class="w3-button w3-section w3-blue w3-ripple">
</div>
      </form>
    </div>

    <!-- Include jQuery and DataTables libraries -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

    <!-- JavaScript for date calculation -->
    <script>
   function submitNewRequest(){
	   let Customer_Name=$("#Customer_Name").val();
	   let date=$("#date").val();
	   let place=$("#place").val();
	   let meetObj=$("#meetObj").val();
	   let custPart=$("#custPart").val();
	   let mode=$("#mode").val();
	   let mindaPart=$("#mindaPart").val();
	   let isupdate=true;
	   if(Customer_Name===""||date===""||place===""||meetObj===""||custPart===""||mode===""||mindaPart===""){
		   alert("All fields are mandatory.");
		   isupdate=false;
	   }
	   
	   let data = {Customer_Name:Customer_Name, date:date, place:place, meetObj:meetObj, custPart:custPart, mode:mode, mindaPart:mindaPart};
	   if(isupdate){
		   $("#submitdiv").html("<i class='fa fa-spinner fa-spin' style='font-size:24px'></i>")
		   console.log(data);
		   $.ajax({url: "./include/CustProcess.jsp", type: "POST", data:data, success: function(result){
			   console.log(result);
			   let resultObj=JSON.parse(result);
			   console.log(resultObj);
		        $("#submitdiv").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");
		        
		   }});
	   }
	   
	   
   }
   /*  function validateForm() {
    	
    	        // Check if the fields are not empty
    	        var customerName = document.getElementById("Customer_Name").value;
    	        var date = document.getElementById("date").value;
    	        var place = document.getElementById("place").value;
    	        var meetObj = document.getElementById("meetObj").value;
    	        var custPart = document.getElementById("custPart").value;
    	        var mode = document.getElementById("mode").value;
    	        var mindaPart = document.getElementById("mindaPart").value;
    	        let data = {Customer_Name:Customer_Name, date:date, place:place, meetObj:meetObj, custPart:custPart, mode:mode, mindaPart:mindaPart} ;


    	        if (customerName.trim() === "" || date.trim() === "" || place.trim() === "" ||
    	            meetObj.trim() === "" || custPart.trim() === "" || mode.trim() === "" ||
    	            mindaPart.trim() === "") {
    	            alert("Please fill in all the fields.");
    	            return false;
    	        }

        // Add additional checks for other fields if needed

        // If all checks pass, return true to allow form submission
        return true;
    }
 
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
        document.querySelector('form').addEventListener('submit', formatTextareaDataForSQL); */
    </script>
</body>
</html>
