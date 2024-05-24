
function coordinatorAction(actionFor, action, DeptName, EcrnDeptId, ecrnId) {
		
	var remarks = $("#"+EcrnDeptId+"-remarks").val();
	var TargetClosureDate = $("#TargetClosureDate"+EcrnDeptId).val();
    
    var isStockFilled = true;
    if(EcrnDeptId==16){	  
	   $("[stock]").each(function(){
		   var ansUid =  $(this).attr("stock");
		   if($("#"+ansUid).attr("type")==='number'){
		   var ansVal = $("#"+ansUid).val();
		     if(jQuery.trim(ansVal)===''){			
			  $("#"+ansUid).css("background","red");
			  isStockFilled = false;
		     }
		   }
		});
	 }
	
	if(!isStockFilled){
		alert("Please fill all stock option shown in red.");
	    return false;
	}
	
    if(TargetClosureDate!==undefined){
		if(jQuery.trim(TargetClosureDate)==''){
		  alert("Please enter implementation date.");
	      return false;	
		 }
	 }
	
	if(jQuery.trim(remarks)==''){ 		
	   alert("Please enter remarks.");
	   return false;		
	}
			
    $("#"+actionFor+EcrnDeptId).html(ajaxLoader);
	   $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
   		 data : { actionFor : actionFor, DeptName:DeptName, ApprovalStageStatus:action, 
   		         EcrnId:ecrnId, ApprovalStageRemarks:remarks, TargetClosureDate:TargetClosureDate },
		 success: function(result){ 
		 let resultObj = JSON.parse(result);
		 	$("#"+actionFor+EcrnDeptId).html(resultObj.msg); 		 
		  }		 
	  })		 
  }

 function updateAssessmentApprovals(EcrnId, Value, FieldName){
		
      $("#actionFor").html(ajaxLoader);
      
	   $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
   		 data : { actionFor : "AssessmentApprovals", EcrnId:EcrnId, FieldName:FieldName,  Value:Value },
		 success: function(result){ 
		 let resultObj = JSON.parse(result);
		 	//$("#"+actionFor).html(resultObj.msg); 		 
		    }		  		 
	    })	  		 
  }
  
 function updateHod(hodDeptId, hodEmail) { 
	 
	var emailId = $("#HodDeptId-"+hodDeptId).val(); 	
	$("#"+hodEmail).val(emailId);
		
 } 
 
 function changeDependent(ProdDivId){
	
	// change Hod based on Prod Division
	$.ajax({
	    url : "./includecomm/getDivisionHods.jsp",
		type: "POST",
   		data : { ProdDivId:ProdDivId },
		success: function(result){	
	      $("#DivBasedDeptHod").html(result);					 
	   }		  		 
    })
    
    $.ajax({
	    url : "./includecomm/getDivisionCustomer.jsp",
		type: "POST",
   		data : { ProdDivId:ProdDivId },
		success: function(result){	
		  $("#DivBasedCustomer").html(result);		 
		}		  		 
    })		
 }


