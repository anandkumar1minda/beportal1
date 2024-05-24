
function uploadFile(event) {
		var files=null ; var data=null ;		
        event.stopPropagation(); 
        event.preventDefault(); 
        files = event.target.files; 
        data = new FormData();        
        data.append("file0", files[0]);
       
       var fileType = data.get("file0").type;
       var fileSize = data.get("file0").size;
       
       $("#uploadFile").val("");
       var match = ['application/pdf', 'application/msword', 'application/vnd.ms-office', 'image/jpeg', 'image/png', 'image/jpg', "application/vnd.openxmlformats-officedocument.presentationml.presentation"];
       
      if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]) || (fileType == match[4]) || (fileType == match[5]) || (fileType == match[6]) )) {
        alert('Sorry, only PDF, DOC, JPG, JPEG, & PNG files are allowed to upload.');       
        return false;                 
       }        
      if(fileSize/1048576>5){
		   alert("File size is "+(fileSize/1048576).toFixed(2)+"MB. It should not be more then 5MB.");		    
		   return false;
	   }            
        postFilesData(data);       
    }   
    
 function postFilesData(data){
	 	 
	 $("#"+fileObj.upId).html(ajaxLoader).removeClass("fa-arrow-circle-up");  
     $.ajax({
        url: './ajax/uploadFile.jsp',
        type: 'POST',
        data: data,
        cache: false,
        dataType: 'json',
        processData: false, 
        contentType: false, 
        success: function(resultObj){		
		if(resultObj.isSuccess){       
           afterUpload(resultObj);
        }else{
		   alert(resultObj.msg);
		   return false;	  
		} 
      }          
    });      
 }
 