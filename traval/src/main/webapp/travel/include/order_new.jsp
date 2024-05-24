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

    <h5><b><i class="fa fa-dashboard"></i>ORDER WON</b></h5>

</header>
        <form action="include/order_process.jsp" method="post" class="w3-container w3-card w3-text-black w3-margin" 
        	style="background-color:white;">
        
        <table class="ecrnReq">
        <tr>
     
          <th>  Order No:</th>
          <td>
            <input type="text" id="order_no" name="order_no" class="appfields"></td>
               <th>
            SOP Date:</th>
            <td>
            <input type="date" id="sop_date" name="sop_date" onchange="calculateDays()" class="appfields"></td>
            </tr>
            <tr>
             
             <th>
           Customer:</th>
           <td> <select name="customer" id="customer">


            <option value="Customer(All)">Customer(All)</option>


   <option value="22 Motors"> 22 Motors</option>


   <option value="Action construction &amp; Equipment's"> Action construction &amp; Equipment's</option>


   <option value="ADAC Automotive"> ADAC Automotive</option>


   <option value="Aether"> Aether</option>


   <option value="SPAREX" > AGCO SPAREX</option>


   <option value="AISIN AUTOMOTIVE KARNATAKA PVT LTD"> AISIN AUTOMOTIVE KARNATAKA PVT LTD</option>


   <option value="Ampere"> Ampere</option>


   <option value="Antony Garage Pvt Ltd"> Antony Garage Pvt Ltd</option>


   <option value="Ashok Leyland"> Ashok Leyland</option>


   <option value="Ashok Leyland Ltd"> Ashok Leyland Ltd</option>


   <option value="Ather Energy"> Ather Energy</option>


   <option value="AutoZone, Inc"> AutoZone, Inc</option>


   <option value="Bajaj"> Bajaj</option>


   <option value="Bajaj Auto Ltd"> Bajaj Auto Ltd</option>


   <option value="BAL"> BAL</option>


   <option value="BMW 2W"> BMW 2W</option>


   <option value="Borgwarner"> Borgwarner</option>


   <option value="Bosch"> Bosch</option>


   <option value="Brakes India Private Limited"> Brakes India Private Limited</option>


   <option value="Brembo Brake India Limited"> Brembo Brake India Limited</option>


   <option value="Bridgestone"> Bridgestone</option>


   <option value="Briggs and Stratton"> Briggs and Stratton</option>


   <option value="BRP"> BRP</option>


   <option value="Carraro"> Carraro</option>


   <option value="CLPL"> CLPL</option>


   <option value="CNH"> CNH</option>


   <option value="Common"> Common</option>


   <option value="Continental"> Continental</option>


   <option value="Cummins"> Cummins</option>


   <option value="Dana"> Dana</option>


   <option value="Delphi"> Delphi</option>


   <option value="Delphi- TVS Technologies Limited"> Delphi- TVS Technologies Limited</option>


   <option value="DICV"> DICV</option>


   <option value="Doosan Bobcat"> Doosan Bobcat</option>


   <option value="Ducati"> Ducati</option>


   <option value="Endurance"> Endurance</option>


   <option value="Escorts"> Escorts</option>


   <option value="Evage"> Evage</option>


   <option value="EVQPoint Solutions Pvt Ltd"> EVQPoint Solutions Pvt Ltd</option>


   <option value="Force Motors"> Force Motors</option>


   <option value="Ford"> Ford</option>


   <option value="Garett"> Garett</option>


   <option value="GENSOL Electric Vehicles Pvt Ltd."> GENSOL Electric Vehicles Pvt Ltd.</option>


   <option value="Global TVS Bus body builder Ltd"> Global TVS Bus body builder Ltd</option>


   <option value="GOGORO"> GOGORO</option>


   <option value="Harley Davidson"> Harley Davidson</option>


   <option value="Hero Electric"> Hero Electric</option>


   <option value="Hero Electric Pvt Ltd."> Hero Electric Pvt Ltd.</option>


   <option value="Hero MotoCorp Ltd"> Hero MotoCorp Ltd</option>


   <option value="Hindalco Industries Limited"> Hindalco Industries Limited</option>


   <option value="Hitachi"> Hitachi</option>


   <option value="HMCL"> HMCL</option>


   <option value="HMSI"> HMSI</option>


   <option value="Honda 2W ASEAN"> Honda 2W ASEAN</option>


   <option value=" Honda India Power Products Limited"> Honda India Power Products Limited</option>


   <option value="Honda Motorcycle and Scooter India"> Honda Motorcycle and Scooter India</option>


   <option value="Hyundai"> Hyundai</option>


   <option value="Hyundai Motors India Ltd"> Hyundai Motors India Ltd</option>


   <option value="India Yamaha Motor Pvt Ltd"> India Yamaha Motor Pvt Ltd</option>


   <option value="Indofarm"> Indofarm</option>


   <option value="Infac India Pvt Ltd"> Infac India Pvt Ltd</option>


   <option value="INMOTION TECHNOLOGIES AB"> INMOTION TECHNOLOGIES AB</option>


   <option value="ITL"> ITL</option>


   <option value="JBM"> JBM</option>


   <option value="JCB"> JCB</option>


   <option value="John Deere India Pvt Ltd"> John Deere India Pvt Ltd</option>


   <option value="JQPM"> JQPM</option>


   <option value="Kalyani Powertrain Ltd"> Kalyani Powertrain Ltd</option>


   <option value="Kawasaki"> Kawasaki</option>


   <option value="KIA"> KIA</option>


   <option value="KIA Motors Corporation"> KIA Motors Corporation</option>


   <option value="KIEKERT AG Limited"> KIEKERT AG Limited</option>


   <option value="KION"> KION</option>


   <option value="KTM"> KTM</option>


   <option value="KTM"> KTM</option>


   <option value="Linamar Corporation"> Linamar Corporation</option>


   <option value="M&M"> M&amp;M</option>


   <option value="M&M 2W"> M&amp;M 2W</option>


   <option value="MAGNA AUTOMOTIVE INDIA PVT LTD"> MAGNA AUTOMOTIVE INDIA PVT LTD</option>


   <option value="Magna Steyr"> Magna Steyr</option>


   <option value="Magneton"> Magneton</option>


   <option value="Mahindra & Mahindra (2W)"> Mahindra &amp; Mahindra (2W)</option>


   <option value="Mahindra & Mahindra Ltd."> Mahindra &amp; Mahindra Ltd.</option>


   <option value=" Mahindra Electric"> Mahindra Electric</option>


   <option value="MAHLE ANAND Thermal Systems Private Limited"> MAHLE ANAND Thermal Systems Private Limited</option>


   <option value="MAHLE ANAND THERMAL SYSTEMS PVT. LTD."> MAHLE ANAND THERMAL SYSTEMS PVT. LTD.</option>


   <option value="Mando Corporation"> Mando Corporation</option>


   <option value="Manitou"> Manitou</option>


   <option value="Marelli India Electronic Systems Division"> Marelli India Electronic Systems Division</option>


   <option value="Marelli Powertrain India Pvt Ltd"> Marelli Powertrain India Pvt Ltd</option>


   <option value="Maruti Suzuki 4W"> Maruti Suzuki 4W</option>


   <option value="MG Motors"> MG Motors</option>


   <option value="MG Motors India Pvt Ltd."> MG Motors India Pvt Ltd.</option>


   <option value="Minda After Market Division"> Minda After Market Division</option>


   <option value="MINDA CORPORATION LIMITED"> MINDA CORPORATION LIMITED</option>


   <option value="Mitsubishi Turbocharger & Engine America"> Mitsubishi Turbocharger &amp; Engine America</option>


   <option value="MTBD"> MTBD</option>


   <option value="Nexcharge"> Nexcharge</option>


   <option value="NIDEC INDIA PVT. LTD. (Neemrana)"> NIDEC INDIA PVT. LTD. (Neemrana)</option>


   <option value="Nissan"> Nissan</option>


   <option value="Novateur Electrical & digital systems private limited"> Novateur Electrical &amp; digital systems private limited</option>


   <option value="Okinawa Autotech"> Okinawa Autotech</option>


   <option value="OLA"> OLA</option>


   <option value="Olectra Greentech Ltd."> Olectra Greentech Ltd.</option>


   <option value=" PCA Automobiles Inda Pvt Ltd (Stellantis)"> PCA Automobiles Inda Pvt Ltd (Stellantis)</option>


   <option value="Piaggio"> Piaggio</option>


   <option value="Piaggio Vehicles Private Limited"> Piaggio Vehicles Private Limited</option>


   <option value=" Piaggio Vietnam"> Piaggio Vietnam</option>


   <option value="Pinnacle Mobility Solutions"> Pinnacle Mobility Solutions</option>


   <option value="Pinnacle Mobility Solutions Pvt. Ltd."> Pinnacle Mobility Solutions Pvt. Ltd.</option>


   <option value="Polaris"> Polaris</option>


   <option value="Preet Tractors"> Preet Tractors</option>


   <option value="PSA"> PSA</option>


   <option value="PVPL"> PVPL</option>


   <option value="Revolt"> Revolt</option>


   <option value="Revolt Intellicorp Pvt Ltd"> Revolt Intellicorp Pvt Ltd</option>


   <option value="Royal Enfield"> Royal Enfield</option>


   <option value=" Royal Enfield"> Royal Enfield</option>


   <option value="Saleri India Private Limited"> Saleri India Private Limited</option>


   <option value=" SANY Heavy Industry India Pvt Ltd"> SANY Heavy Industry India Pvt Ltd</option>


   <option value="Schneider Electric Pvt Ltd"> Schneider Electric Pvt Ltd</option>


   <option value="Simpson"> Simpson</option>


   <option value="SJ Electric Vehicles Pvt Ltd (Polarity)"> SJ Electric Vehicles Pvt Ltd (Polarity)</option>


   <option value="SKODA AUTO VOLKSWAGEN INDIA PRIVATE LIMITED"> SKODA AUTO VOLKSWAGEN INDIA PRIVATE LIMITED</option>


   <option value="SM Kannapa"> SM Kannapa</option>


   <option value=" SMP"> SMP</option>


   <option value="Stanley Black & Decker"> Stanley Black &amp; Decker</option>


   <option value="Stellantis"> Stellantis</option>


   <option value="Stoneridge"> Stoneridge</option>


   <option value="Subros Limited"> Subros Limited</option>


   <option value="Sumitomo Riko"> Sumitomo Riko</option>


   <option value="Sun Mobility Pvt Ltd"> Sun Mobility Pvt Ltd</option>


   <option value="Sunmobility Pvt Ltd"> Sunmobility Pvt Ltd</option>


   <option value=" Suzuki 2W"> Suzuki 2W</option>


   <option value=" Suzuki 2W ASEAN"> Suzuki 2W ASEAN</option>


   <option value="Suzuki 4W ASEAN"> Suzuki 4W ASEAN</option>


   <option value="Suzuki Motor Gujarat Pvt Ltd."> Suzuki Motor Gujarat Pvt Ltd.</option>


   <option value="Suzuki Motorcycle India Pvt. Ltd"> Suzuki Motorcycle India Pvt. Ltd</option>


   <option value="Suzuki Motorcycle India Pvt. Ltd"> Suzuki Motorcycle India Pvt. Ltd</option>


   <option value="Swaraj"> Swaraj</option>


   <option value="Switch Mobility"> Switch Mobility</option>


   <option value="Switch Mobility Automotive Ltd"> Switch Mobility Automotive Ltd</option>


   <option value="TAFE"> TAFE</option>


   <option value=" TAFE Motors and Tractors Limited"> TAFE Motors and Tractors Limited</option>


   <option value="Talbros"> Talbros</option>


   <option value="TATA"> TATA</option>


   <option value="Tata Motors Ltd"> Tata Motors Ltd</option>


   <option value="Tata Motors Passenger Vehicle Ltd"> Tata Motors Passenger Vehicle Ltd</option>


   <option value="Tata Motors Passenger Vehicle Ltd"> Tata Motors Passenger Vehicle Ltd</option>


   <option value="TEL"> TEL</option>


   <option value="TI Clean Mobility Pvt Ltd"> TI Clean Mobility Pvt Ltd</option>


   <option value=" TI CLEAN MOBILITY PVT LTD"> TI CLEAN MOBILITY PVT LTD</option>


   <option value=" TML PV"> TML PV</option>


   <option value="TOKAI RUBBER INDIA"> TOKAI RUBBER INDIA</option>


   <option value="TOYOTA TSUSHO CORPORATION"> TOYOTA TSUSHO CORPORATION</option>


   <option value="Triumph"> Triumph</option>


   <option value="Turk Traktor"> Turk Traktor</option>


   <option value="TVS"> TVS</option>


   <option value="TVSM"> TVSM</option>


   <option value="UCAL"> UCAL</option>


   <option value="UD Trucks"> UD Trucks</option>


   <option value="UFI"> UFI</option>


   <option value="Ultraviolette Automotive Pvt Ltd"> Ultraviolette Automotive Pvt Ltd</option>


   <option value="Uno Minda"> Uno Minda</option>


   <option value="Uz Minda"> Uz Minda</option>


   <option value="Valeo"> Valeo</option>


   <option value="VECV"> VECV</option>


   <option value="VINFAST"> VINFAST</option>


   <option value="Virya Mobility 5.0 LLP"> Virya Mobility 5.0 LLP</option>


   <option value="Vishwa Buses & coaches Ltd"> Vishwa Buses &amp; coaches Ltd</option>


   <option value="Volvo"> Volvo</option>


   <option value="VW"> VW</option>


   <option value="Widney India Pvt Ltd."> Widney India Pvt Ltd.</option>


   <option value="Widney Manufacturing Ltd"> Widney Manufacturing Ltd</option>


   <option value="Y-TEC INDIA PRIVATE LIMITED"> Y-TEC INDIA PRIVATE LIMITED</option>


   <option value="Yamaha"> Yamaha</option>


   <option value="Yamaha ASEAN"> Yamaha ASEAN</option>


   <option value="Yanmar"> Yanmar</option>


   </select>
   </td>
             <th>Product Segment:</th>
          <td>  <input type="text" id="product_seg" name="product_seg" class="appfields"  ></td>
            
         
             
           
          </tr>
          <tr>
           <th> Date of Reciving:</th>
           <td> <input type="date" id="date_of_rec" name="date_of_rec" class="appfields"></td>
         
             <th>Amount:</th>
          <td>  <input type="text" id="amount" name="amount" class="appfields"  ></td>
         </tr>
            <tr>
  <th>Division:</th>
  
  <td>
    <select name="division" id="division">
      <option value="Cluster">Cluster</option>
      <option value="Sensor">Sensor</option>
      <option value="SMGM/EV">SMGM/EV</option>
      <option value="EME">EME</option>
      <option value="MINFAC">MINFAC</option>
    </select>
  </td>
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
