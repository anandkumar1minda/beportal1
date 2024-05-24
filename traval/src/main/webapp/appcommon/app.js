
 function getToken(){	
	var empEmail = $("#empEmail").val();
			
	if(empEmail){		
	   $("#tokenButton").html('<i class="fa fa-spinner fa-spin" style="font-size:24px"></i>');	   	        	
	  $.ajax({
		    url: "./appinclude/sendToken.jsp", 
	        data:{empEmail:empEmail},
	        type:"POST",
	        success: function(result){				
			  let resultObj = JSON.parse(result);			   
              $("#tokenGenMsg").html(resultObj.msg).css("color",resultObj.color);
              $("#tokenButton").html('<input type="button" class="w3-button w3-section w3-teal w3-ripple" onClick="getToken()" value="Get Login Token Again" />');
            }
        });
     } 
    else{
	   $("#tokenGenMsg").html("Please enter email id to send token").css("color","red");
	}    
 }
