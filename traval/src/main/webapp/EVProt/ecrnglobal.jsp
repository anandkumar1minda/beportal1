
<%@page import="java.util.Calendar"%>

<%

String appName = "ECRN";

Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH)+1;
int date = cal.get(Calendar.DATE);
String todayMysqlDate = year+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date);

String legend = "<span style='margin-left:30px;font-size:16px;'><span style='padding:3px;background:yellow;'>&nbsp;&nbsp; >7 days &nbsp;&nbsp;</span>";
       legend+="<span style='margin-left:30px;font-size:16px;'><span style='padding:3px;background:red;color:white;'>&nbsp;&nbsp; >30 days &nbsp;&nbsp;</span>";
    
%>