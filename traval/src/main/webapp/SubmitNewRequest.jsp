<%
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){
%>
<%@page import="idc.common.CommonMaster"%>

<html>
<meta charset="ISO-8859-1">
<title><%=new CommonMaster().getPageTitle()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./appcommon/app.css?2">
</head>

<body>

<jsp:include page="appinclude/appheader.jsp"></jsp:include>

  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i>Welcome to Spark Minda Travel Dashboard</b></h5>
  </header>
  
  <div class="w3-row-padding w3-margin-bottom">
   
   <div class="w3-quarter">
      <div class="w3-container w3-teal w3-text-white w3-padding-16">
        <div class="w3-left"><a href="./ecrn" class="commonLink"><i class="fa fa-handshake-o w3-xxxlarge"></i></a></div>
        <div class="w3-right">
          <h3><a href="./ecrn" class="commonLink">BV-5</a></h3>
        </div>
        <div class="w3-clear"></div>
        <h4><a href="./ecrn" class="commonLink"><i class="fa fa-hand-o-right" ></i> ECRN</a></h4>
      </div>
    </div>
     
    <div class="w3-quarter">     
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><a href="./bv2" class="commonLink"><i class="fa fa-car w3-xxxlarge"></i></a></div>
        <div class="w3-right">
          <h3><a href="./bv2" class="commonLink">BV-2</a></h3>
        </div>
        <div class="w3-clear"></div>
        <h4><a href="./bv2" class="commonLink"><i class="fa fa-hand-o-right" ></i> ECRN</a></h4>
      </div>      
    </div> 
     <div class="w3-quarter">
      <div class="w3-container w3-red w3-text-white w3-padding-16">
        <div class="w3-left"><a href="./ecrn" class="commonLink"><i class="fa fa-plane w3-xxxlarge"></i></a></div>
        <div class="w3-right">
          <h3><a href="./ecrn" class="commonLink">BV-5</a></h3>
        </div>
        <div class="w3-clear"></div>
        <h4><a href="./ecrn" class="commonLink"><i class="fa fa-hand-o-right" ></i> TRAVEL</a></h4>
      </div>
    </div>
    
       
  </div> 
      
</body>
</html>

<% } 
else{
  response.sendRedirect("./NewIndex.jsp");
 }
%>
