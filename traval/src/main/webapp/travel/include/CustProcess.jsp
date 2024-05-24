<%@page import="mailer.MailerMaster"%>
<%@page import="mailer.EcrnMailer"%>
<%@page import="org.json.JSONObject" %>

<%@page import="org.apache.commons.mail.HtmlEmail" %>
<% 
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>

<%@page import="idc.emp.EmpMaster"%>
<%@page import="idc.common.CommonMaster"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


  <%
  JSONObject jsonObj=new JSONObject();
  String customerName = request.getParameter("Customer_Name");
  String date = request.getParameter("date");
  String place = request.getParameter("place");
  String meetingObjective = request.getParameter("meetObj");
  String customerParticipants = request.getParameter("custPart");
  String mode = request.getParameter("mode");
  String mindaParticipants = request.getParameter("mindaPart");
   
 %>
    
   
   <% 

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Establish a database connection (modify with your database credentials)
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/minda_org", "root", "FGh%4#45ndF32");

        // Create the SQL query
        String sql = "INSERT INTO travel.customer_connect_actual (Customer_Name, date, place, meetObj, custPart, mode, mindaPart)  VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, customerName);
        stmt.setString(2, date);
        stmt.setString(3, place);
        stmt.setString(4, meetingObjective);
        stmt.setString(5, customerParticipants);
        stmt.setString(6, mode);
        stmt.setString(7, mindaParticipants);
      
       // (userid, From, To, Days,)
        

        // Execute the query
        int rowsAffected = stmt.executeUpdate();

      
        if (rowsAffected > 0) {
        	  HtmlEmail email=new HtmlEmail();
        	    MailerMaster mailerMaster = new MailerMaster();
        	    mailerMaster.setHtmlEmail(email);
        	    mailerMaster.setSubject("New Customer Meetings Added");
        	    String greetingMessage = "Hope you're having a great day, A new Customer Connect has been added to the system, the details have been added below:";
        	    String returnStr = "<html>"
        	        + "<head>"
        	        + "<style>"
        	        + "table {"
        	        + "width: 100%;"
        	        + "border-collapse: collapse;"
        	        + "margin-top: 20px;"
        	        + "}"
        	        + "th, td {"
        	        + "padding: 10px;"
        	        + "text-align: left;"
        	        + "border-bottom: 1px solid #ddd;"
        	        + "}"
        	        + "th {"
        	        + "background-color: #f2f2f2;"
        	        + "font-weight: bold;"
        	        + "}"
        	        + "tr:hover {"
        	        + "background-color: #f5f5f5;"
        	        + "}"
        	        + "</style>"
        	        + "</head>"
        	        + "<body>"
        	        + "<p>" + greetingMessage + "</p>"
        	        + "<table border='1'>"
        	        + "<tr>"
        	        + "<th>Customer Name</th>"
        	        + "<th>Date</th>"
        	        + "<th>Location</th>"
        	        + "<th>Meeting Objective</th>"
        	        + "<th>Customer Participants</th>"
        	        + "<th>Platform</th>"
        	        + "<th>Minda Participants</th>"
        	        + "</tr>"
        	        + "<tr>"
        	        + "<td>" + customerName + "</td>"
        	        + "<td>" + date + "</td>"
        	        + "<td>" + place + "</td>"
        	        + "<td>" + meetingObjective + "</td>"
        	        + "<td>" + customerParticipants + "</td>"
        	        + "<td>" + mode + "</td>"
        	        + "<td>" + mindaParticipants + "</td>"
        	        + "</tr>"
        	        + "</table>"
        	        + "</body>"
        	        + "</html>";


        	    
        	    
        	    
        	   mailerMaster.setFullMailContent(returnStr);
        	   mailerMaster.setToList("sanjaygupta@mindacorporation.com");
        	   mailerMaster.setCcList("manisha.patil@mindacorporation.com, ashu.dua@mindacorporation.com");
        	   new EcrnMailer().sendCommonEcrnHtmlMail(mailerMaster);
        	   
        	jsonObj.put("msg","New Customer Connect data added Successfully.");
			jsonObj.put("color", "Blue");
			jsonObj.put("isSuccess", "true");} 
        else
			{
				jsonObj.put("msg","Error in putting the data.");
			
			jsonObj.put("color", "red");
			jsonObj.put("isSuccess", "false");
			} 
stmt.close();
conn.close();
        
        
    }	catch (Exception e) {
    	jsonObj.put("msg","Error in putting the data.");
		
		jsonObj.put("color", "red");
		jsonObj.put("isSuccess", "false");
    } 
    out.print(jsonObj);
    
    
%> 
   
<% %>
<% 
  } 

%>

