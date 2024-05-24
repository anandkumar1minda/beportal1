<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Won</title>
       <style>
        h1 {
            text-align: center;
            font-size: 40px;
            color: black;
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        /* Add CSS styles for the table */
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

        /* Style for the filter form container */
        .filter-form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #007BFF;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        /* Style for each filter input container */
        .filter-input {
            flex: 1;
            margin-right: 10px;
        }

        /* Style for labels */
        label {
            font-weight: bold;
            color: #fff; /* White text color for labels */
        }

        /* Style for input fields */
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #007BFF; /* Blue border color */
            border-radius: 3px;
            font-size: 14px;
            color: #333; /* Dark text color */
            background-color: #fff; /* White background color */
        }

        /* Placeholder text color */
        input[type="text"]::placeholder,
        input[type="date"]::placeholder {
            color: #aaa; /* Light gray placeholder text color */
        }

        /* Style for the Location filter dropdown */
        .select-wrapper {
            position: relative;
        }

        .select-wrapper select {
            width: 100%;
            padding: 8px;
            border: 1px solid #007BFF;
            border-radius: 3px;
            font-size: 14px;
            color: #333;
            background-color: #fff;
            appearance: none; /* Remove default dropdown arrow */
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        /* Style for the custom dropdown arrow */
        .select-wrapper::after {
            content: '\25BC'; /* Unicode code for a downward arrow */
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            color: #007BFF;
            pointer-events: none; /* Prevent the arrow from being clickable */
        }
    </style>
    
</head>
<body class="w3-light-grey">
    <!-- ... (other body content) ... -->
    <div class="w3-container" id="contentDiv" style="padding-top:1px !important;margin-top:1px !important;"></div>
        <%
        String fromDate = request.getParameter("fromDate") == null ? "" : request.getParameter("fromDate");
        String toDate = request.getParameter("toDate") == null ? "" : request.getParameter("toDate");
        String sopFilter = request.getParameter("sop")==null?"":request.getParameter("sop");
        String orderFilter = request.getParameter("order")==null?"":request.getParameter("order");
        String divFilter = request.getParameter("division")==null?"":request.getParameter("division");
        String custFilter = request.getParameter("customer")==null?"":request.getParameter("customer");
        String amtFilter = request.getParameter("amount")==null?"":request.getParameter("amount");
        
        System.out.println(sopFilter);
        
        %>
          <div class="filter-form">
        <div class="filter-input">
            <label for="fromFilter">From:</label>
            <input type="date" id="fromFilter" name="fromFilter" value="<%=fromDate %>" onchange="loadSearchTravel('travel_retrive')" placeholder="Filter by From">
        </div></div>
        <div class="filter-input">
            <label for="toFilter">To:</label>
            <input type="date" id="toFilter" name="toFilter" value="<%=toDate%>" onchange="loadSearchTravel('Govt_table')" placeholder="Filter by To">
        </div>
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
    <div class="select-wrapper"></div>
    <select id="custFilter" name="custFilter" onchange="loadSearchTravel('order_table')">
       <option value="Customer(All)">Customer(All)</option>


   <option value="22 Motors"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> 22 Motors</option>


   <option value="Action construction &amp; Equipment's"<%=custFilter.equalsIgnoreCase("Action construction &amp; Equipment's")?"selected":"" %>> Action construction &amp; Equipment's</option>


   <option value="ADAC Automotive"> ADAC Automotive</option>


   <option value="Aether"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Aether</option>


   <option value="SPAREX"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %> > AGCO SPAREX</option>


   <option value="AISIN AUTOMOTIVE KARNATAKA PVT LTD"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> AISIN AUTOMOTIVE KARNATAKA PVT LTD</option>


   <option value="Ampere"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ampere</option>


   <option value="Antony Garage Pvt Ltd"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Antony Garage Pvt Ltd</option>


   <option value="Ashok Leyland"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ashok Leyland</option>


   <option value="Ashok Leyland Ltd"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ashok Leyland Ltd</option>


   <option value="Ather Energy"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ather Energy</option>


   <option value="AutoZone, Inc"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> AutoZone, Inc</option>


   <option value="Bajaj"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Bajaj</option>


   <option value="Bajaj Auto Ltd"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Bajaj Auto Ltd</option>


   <option value="BAL"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> BAL</option>


   <option value="BMW 2W"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> BMW 2W</option>


   <option value="Borgwarner"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Borgwarner</option>


   <option value="Bosch"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Bosch</option>


   <option value="Brakes India Private Limited<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>"> Brakes India Private Limited</option>


   <option value="Brembo Brake India Limited"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Brembo Brake India Limited</option>


   <option value="Bridgestone"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Bridgestone</option>


   <option value="Briggs and Stratton"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Briggs and Stratton</option>


   <option value="BRP"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> BRP</option>


   <option value="Carraro"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Carraro</option>


   <option value="CLPL"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> CLPL</option>


   <option value="CNH"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> CNH</option>


   <option value="Common"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Common</option>


   <option value="Continental"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Continental</option>


   <option value="Cummins"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Cummins</option>


   <option value="Dana"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Dana</option>


   <option value="Delphi"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Delphi</option>


   <option value="Delphi- TVS Technologies Limited"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Delphi- TVS Technologies Limited</option>


   <option value="DICV"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> DICV</option>


   <option value="Doosan Bobcat"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Doosan Bobcat</option>


   <option value="Ducati"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ducati</option>


   <option value="Endurance"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Endurance</option>


   <option value="Escorts"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Escorts</option>


   <option value="Evage"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Evage</option>


   <option value="EVQPoint Solutions Pvt Ltd"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> EVQPoint Solutions Pvt Ltd</option>


   <option value="Force Motors"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Force Motors</option>


   <option value="Ford"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Ford</option>


   <option value="Garett"<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> Garett</option>


   <option value="GENSOL Electric Vehicles Pvt Ltd."<%=custFilter.equalsIgnoreCase("22 Motors")?"selected":"" %>> GENSOL Electric Vehicles Pvt Ltd.</option>


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
</div>
        
     <div class="filter-input amount-input">
    <label for="amtFilter">Amount (Crs):</label>
    <input type="text" id="amtFilter" name="amtFilter" value="<%=amtFilter %>" placeholder="Enter Amount" onchange="loadSearchTravel('order_table')">
</div>
        
        <div class="filter-input">
    <label for="orderFilter">Order:</label>
    <input type="text" id="orderFilter" name="orderFilter" value="<%=orderFilter %>"placeholder="Enter Order" onchange="loadSearchTravel('order_table')">
</div>
        
        
     
		<table border="1">
		 <tr>
		 		<th>From</th>
		 		<th>To</th>
                <th>Order No</th>
                <th>Division</th>
                <th>Customer</th>
                <th>Product Segment</th>
                <th>Date of Receiving</th>
                <th>Amount (Crs)</th>
                <th>SOP Date</th>
            </tr>
            <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int rowCounter =1;
        
        try {
            // Establish a database connection (modify with your database cre2dentials)
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "4342");
            
            

            String query = "SELECT * FROM travel.order_won WHERE 1 " ;
            if (!fromDate.equalsIgnoreCase("")) {
                query += " AND (Date_Format(FromDate,'%Y-%m-%d')  >='"+fromDate+"'";
                query +=" OR '"+fromDate+"' BETWEEN Date_Format(FromDate,'%Y-%m-%d') AND Date_Format(ToDate,'%Y-%m-%d') )";
            }
            
            if (!toDate.equalsIgnoreCase("")) {
                query += " AND ( Date_Format(ToDate,'%Y-%m-%d') <= '"+toDate+"'";
                query +=" OR '"+toDate+"' BETWEEN Date_Format(FromDate,'%Y-%m-%d') AND Date_Format(ToDate,'%Y-%m-%d') )";
            }
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
            		    String from = rs.getString("FromDate");
                        String to = rs.getString("ToDate");
            			
            			%>
            			<tr>
            				<td><%= from %></td>
            				<td><%= to %></td>
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