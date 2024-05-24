<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%  
 if(session!=null){
 if(session.getAttribute("ID")!=null){
	 session.invalidate();
   }
 }
%>
<%@page import="idc.common.CommonMaster"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=new CommonMaster().getPageTitle()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="./appcommon/app.js?2"></script>
</head>

<body>

<jsp:include page="appinclude/appheader.jsp"></jsp:include>

<div class="w3-container w3-margin-top" style="vertical-align: top;display:inline-block;
vertical-align:top;width:28%; height:560px;margin-left:1%;">

<form class="w3-container w3-card-4" style="width:100%;height:560px;" action="./authenticate.jsp" method="POST">

<h1>Login</h1>
<p>&nbsp;

<% 
if(request.getParameter("msg")!=null){
   out.println("<span style='color:red;' id='tokenGenMsg'>"+request.getParameter("msg")+"</span>");
}
else{
   out.println("<span id='tokenGenMsg'></span>");	
}
%>

</p>
<p>
<label><b>Email Id</b></label>
<input class="w3-input" type="text" name="empEmail" id="empEmail" placeholder="Enter your email id"
 value="<%=request.getParameter("email")==null?"":request.getParameter("email")%>"style="width:90%" required>
 
</p>

<p>
<% if(request.getParameter("activeToken")==null){ %>
<label><b>Token</b> &nbsp;&nbsp;
<span id="tokenButton">
<input type="button" class="w3-button w3-section w3-teal w3-ripple" onClick="getToken()" value="Get Login Token" />
</span>
</label>
<% 
}
else if(request.getParameter("activeToken")!=null){ %>

<input class="w3-input" name="token" 
  value='<%=request.getParameter("activeToken")==null?"":request.getParameter("activeToken")%>'
  style="width:90%" required>
</p>

<p><button class="w3-button w3-section w3-teal w3-ripple"> Log in </button></p>

<% } %>

</form>
</div>
<!-- 
<div class="w3-margin-top w3-margin-top" 
style="font-family: Arial;margin-left:350px;vertical-align: top;display:inline-block;
vertical-align:top;width:58%;box-shadow: 2px 2px 10px #aaa;">

 <img src="http://localhost:8080/appdocuments/images/loginpage.png"></img>

</div>
-->

<div class="w3-margin-top w3-margin-top" 
style="font-family:Arial; vertical-align: top;display:inline-block;
vertical-align: top;width:68%;box-shadow: 2px 2px 10px #aaa; height:560px;">
 
 <div style="width:23%;display: inline-block;vertical-align:top;padding:10px 5px 10px 25px;">
  
      <div style="padding:5px 1px;font-size:15px;text-align:left;font-style: italic;font-weight: bold;">From the desk of</div>     
      <img alt="" src="https://ecn.sparkminda.in/appdocuments/images/img_gceo.png"  style="box-shadow:3px 3px 5px #000;width:97%"/>
      <br/>
      <div style="font-weight:bold;font-size:15px;text-align: center;text-shadow:1px 1px 1px #aaa;padding:10px 0px;">ASHOK MINDA
      <br/>
      Group CEO
      </div>    
 </div>
 
 <div style="width:76%;display: inline-block;padding:10px;">
 <div style="font-weight:bold;font-size:24px;text-align: center;text-shadow:1px 1px 1px #aaa;">"The Only Constant in Life Is Change".- Heraclitus</div>

 <div style="padding:20px 20px 5px 20px;font-size:17px;">We are living in a dynamic environment with continuous change in technologies leading to newer,
  better & smarter products!</div>

 <div style="padding:5px 20px;font-size:17px;">In our development process it is utmost important to embrace these changes with high level of process 
 sophistication, agility and discipline to leverage them for the betterment of <b>SPARK MINDA</b>.</div>
 <div style="padding:5px 20px;font-size:17px;">In our pursuit of digitization across the company, a <span style='color:#000;font-weight:bold;'>
 fully automated tool - ECRN</span>, has been introduced which marks a big step forward in streamlining of our 'change request' processes and enhancing efficiency across the organization</div>
 
 <div style="padding:5px 20px;font-size:17px;">It is a one stop user-friendly solution that allows a quick interface to submit the new change
  request from customer or from internal team, process it through auto generated mailers and easily accessible review forms, provides wide range of features including online dashboard, digital ageing tracking, ECRN driven recoveries and many more..</div>

 <div style="padding:5px 20px;font-size:17px;">I have no doubt that the ECRN tool will revolutionize the way we handle customer change requests,
  and I look forward to witnessing the positive impact it will have on our organization.</div>

 <div style="padding:5px 20px;font-size:17px;">Thank you for your unwavering commitment to Spark Minda's success.</div>
 </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
        crossorigin="anonymous"></script>

</body>
</html> 
