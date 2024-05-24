<%@page import="idc.common.CommonMaster" %>
<%

 CommonMaster commonMaster = new CommonMaster();
 if(request.getScheme().equals(commonMaster.getServerScheme()) &&
		request.getServerName().equals(commonMaster.getServerName()) &&
		   request.getServerPort()==commonMaster.getServerPort()){
	
 if(request.getMethod().equalsIgnoreCase("POST")){
    if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@page import="idc.common.CommonMaster"%>

<%
    JSONObject jsonObject = new JSONObject();
    int empId = (Integer)session.getAttribute("ID");    

    Calendar calendar = Calendar.getInstance();
    
    int year  =  calendar.get(Calendar.YEAR);
    int month = calendar.get(Calendar.MONTH)+1;
   
    String fileName = calendar.getTimeInMillis()+"_"+empId;
    		
    final String UPLOAD_DIRECTORY = new CommonMaster().getStartUploadURL()+"ecrn/"+year+"/"+month;   
    
    if(ServletFileUpload.isMultipartContent(request)){
    try {
        List<FileItem> multiparts = new ServletFileUpload(
                                    new DiskFileItemFactory()).parseRequest(request);
        
        for(FileItem item : multiparts){
            if(!item.isFormField()){
                File fileSaveDir = new File(UPLOAD_DIRECTORY);
                if (!fileSaveDir.exists()){
                    fileSaveDir.mkdir();
                }
      
         if((double)item.getSize()/1048576>5){
        	   jsonObject.put("isSuccess", false);              
               jsonObject.put("msg","File size is "+(double)item.getSize()/1048576+"MB. It should not be more then 5MB."); 
           }
           else if(item.getContentType().equalsIgnoreCase("application/pdf") ||
        		   item.getContentType().equalsIgnoreCase("application/msword") ||
        		   item.getContentType().equalsIgnoreCase("application/vnd.ms-office") ||
        		   item.getContentType().equalsIgnoreCase("image/jpeg") ||
        		   item.getContentType().equalsIgnoreCase("image/jpg") ||
        		   item.getContentType().equalsIgnoreCase("image/png") || 
        		   item.getContentType().equalsIgnoreCase("application/vnd.openxmlformats-officedocument.presentationml.presentation")){        	   
        	                      
                String name = new File(item.getName()).getName();  
                       name = fileName+"_"+name;
                       
                item.write( new File(UPLOAD_DIRECTORY + File.separator + name));  
                
                jsonObject.put("isSuccess", true);
                jsonObject.put("fileName",year+"/"+month+"/"+name);                
           }       
         else{
        	 
          jsonObject.put("isSuccess", false);              
          jsonObject.put("msg","Sorry, only PDF, DOC, JPG, JPEG, & PNG files are allowed to upload.");
          
             }         
           }
        }
    }catch(Exception e){
    	jsonObject.put("isSuccess", false);              
        jsonObject.put("msg","Something went wrong please contact to praveen.chauhan@mindacorporation.com to fix the issue.");
        out.print(jsonObject);
    }    
    out.print(jsonObject);
    }
  } 
}
 }
%>