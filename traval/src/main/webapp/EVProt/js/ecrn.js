
 const ecrnFormArr = [{id:"HodDeptId",isMandatory:true},{id:"HodEmailId",isMandatory:false},
 {id:"ecrnId",isMandatory:true},{id:"bvId",isMandatory:true},
 {id:'phaseId',isMandatory:true},{id:'productId',isMandatory:true},{id:'productName',isMandatory:true},
 {id:'pfsNumber',isMandatory:false},{id:'refPartId',isMandatory:false},{id:'changedPartId',isMandatory:false},
 {id:'isPartIdChanged',isMandatory:true},{id:'ecrnReqTypeId',isMandatory:true},{id:'reasonForChange',isMandatory:true},
 {id:'custId',isMandatory:true},{id:'vehicleTypeId',isMandatory:true}, {id:'prodDivisionId',isMandatory:true},
 {id:'targetClosureDate',isMandatory:false},{id:'chrId',isMandatory:true},
 {id:'componentEffecting',isMandatory:true},{id:'componentEffectingId',isMandatory:true},
 {id:"moneyRecoveredByEcrn",isMandatory:true},{id:'changeDetail',isMandatory:true},
 {id:"changeImpactFamily",isMandatory:true,type:"radio"},{id:"bvId",isMandatory:false},
 {id:"attachedDocName",isMandatory:false,type:"checkbox"},{id:"attachedDocPath",isMandatory:false}];
 
 let fileObj = {};
 let docStartPath = "https://ecn.sparkminda.in/appdocuments/docs/ecrn/";
 let fileStartPath ="https://ecn.sparkminda.in/appdocuments/files/";
 const searchFilter = {page:""};
 const updateCancelDiv = '<span id="divForDelAddUpdate"><span style="float:left;margin-left:20px;"><input type="button" class="w3-button w3-section w3-red w3-ripple" value="Cancel" onClick="cancelTravelReq()"/></span><span id="submitNewRequest" class="w3-button w3-section w3-ripple w3-text-blue"></span><span style="float:right;margin-right:20px;"><input type="button" class="w3-button w3-section w3-orange w3-ripple w3-text-white" value="Update" onClick="submitNewRequest()"/></span></span>';
 const updateFeasibility = '<span id="feasibilityDiv"><span id="feasibilityAjaxDiv"></span><input type="button" class="w3-button w3-section w3-white w3-ripple" value="Reject for Feasiblity" onClick="rejectFeasibility()"/></span></span>';
 const ajaxLoader = "<i class='fa fa-spinner fa-spin' style='font-size:24px'></i>";
 const selectObj = {};
 
 function hilightTab(className, id, addRemoveClass){	 	 
	
	$("."+className).each(function(){
	    $(this).removeClass(addRemoveClass);
	 })
	    $("#"+id).addClass(addRemoveClass);	
	     
  }
 
 function showMenu(){	 	
	 $("#mySidebar").css("width","300");
	 $("#mainStartContentDiv").css("margin-left","300px");
	 $("#ecrnMenuBars").show();
 }
 
 function hideMenu(){	 	
	 $("#mySidebar").css("width","0");
	 $("#mainStartContentDiv").css("margin-left","0px");
	 $("#ecrnMenuBars").show();
 }
 
 function loadTestContent(pageName,renderingDivId){	 
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST",data:{tmId:8}, success: function(result){	
     $("#"+renderingDivId).html(result);    
   }});    
 }
  
 function loadAppLinkContent(adId,appDept,appStatus,pageName,renderingDivId){
	 	 
	$.ajax({
		    url: "./include/"+pageName+".jsp", 
		    type: "POST",
	        data:{adId:adId,appDept:appDept,appStatus:appStatus},
	        type:"POST",
	        success: function(result){	  
            $("#"+renderingDivId).html(result);  
      }}); 
  }
 
 function loadLinkContent(pageName,renderingDivId){	
	 	     
   $("#"+renderingDivId).html(ajaxLoader).css("margin-top","50px").css("text-align","center");
   
   $.ajax({url: "./include/"+pageName+".jsp",type: "POST", success: function(result){
	  searchFilter.page = pageName;	 
      $("#"+renderingDivId).html(result).css("margin-top","10px").css("text-align","left"); 
   }});                    
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");     
 }
 
 function loadSearch(pageName){
	 	
	let fromDate = $("#fromDate").val();
	let toDate   = $("#toDate").val();
	let searchEcrnReqTypeId  = $("#searchEcrnReqTypeId").val();
	let searchPhaseId        = $("#searchPhaseId").val();
	let searchProdDivisionId = $("#searchProdDivisionId").val();
	let searchCustId         = $("#searchCustId").val();
	let searchMoneyRecoveredByEcrn = $("#searchMoneyRecoveredByEcrn").val();
	let ecrnStatus = $("#ecrnStatus").val()?$("#ecrnStatus").val():'Active';
	let notificationStatus = $("#notificationStatus").val();
	let HodDeptStatus = $("#HodDeptStatus").val();
	let ecrnSubmittedBy = $("#ecrnSubmittedBy").val();
	let searchEcrnId = $("#searchEcrnId").val();
	let searchECNGenerated = $("#searchECNGenerated").val();
		
	let data = {fromDate:fromDate,toDate:toDate,searchEcrnReqTypeId:searchEcrnReqTypeId,
	searchMoneyRecoveredByEcrn:searchMoneyRecoveredByEcrn,searchPhaseId:searchPhaseId,
	searchProdDivisionId:searchProdDivisionId,searchCustId:searchCustId,
	notificationStatus:notificationStatus,ecrnSubmittedBy:ecrnSubmittedBy,
	ecrnStatus:ecrnStatus , searchEcrnId:searchEcrnId ,
	HodDeptStatus:HodDeptStatus, searchECNGenerated:searchECNGenerated} ;
	
	$("#contentDiv").html(ajaxLoader);
	
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){	  
        $("#contentDiv").html(result);         
   }});
                            
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
 }
 
 function getSearchData(ecrnStage,ecrnStatus,headerText,TotalEcrnIds){
	
	let data = { ecrnStage:ecrnStage, ecrnStatus : ecrnStatus, TotalEcrnIds:TotalEcrnIds } ;
	
   $("#headerText").html(headerText).show();
   $.ajax({url:"./include/dashdata.jsp", type:"POST", data:data, success: function(result){	  
        $("#searchDataDiv").html(result);         
   }});                            
    
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");
                            	 
  }
 
 function submitNewRequest(){	 	 
	var checkedObj = checkField();
		
	if(checkedObj.isCriteriaFullFill){	
	var formData = checkedObj.formData;
	    formData.actionFor = "insertUpdateEcrnReq";
	    
	// console.log(formData);
	  
	 let isUpdate = true;
	 if(formData.ecrnId!=0){
		 isUpdate = confirm("Are you sure you want to update this ecrn?");
	   }
	   	   				 
	 if(isUpdate){		
		$("#submitNewRequest").html(ajaxLoader);		
        $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
		 data : formData,
		 success: function(result){			 			 			 			 	 
		 let resultObj = JSON.parse(result);
		 		 
       if(formData.ecrnId==0){			   		    
		  $("#ecrnId").val(resultObj.id);	    
		 }		      
	    $("#submitNewRequest").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");	     
	        }		        		        		        
		 });	
	   }  
	 }
  }
    
 function removeBackColor(that){
	 $("#"+that.id).css("background","white");
  }
   
 function updateDependent(id,value){	
	const ecrnFormArrLen = ecrnFormArr.length;	
	 for(var i=0;i<ecrnFormArrLen;i++){
	  if(id==='phaseId'){
	   if(ecrnFormArr[i].id==='pfsNumber' || ecrnFormArr[i].id==='refPartId' || ecrnFormArr[i].id==='isPartIdChanged'){
		 if(value==='1'){			 
		     ecrnFormArr[i].isMandatory = true;
		     $("#mandatory_"+ecrnFormArr[i].id).html("*");
		   }else{
			  ecrnFormArr[i].isMandatory = false;
			 $("#mandatory_"+ecrnFormArr[i].id).html("");		
			 $("#"+ecrnFormArr[i].id).css("background","white");
		   }
		 }
	   }	   
	}	 
 }
 
 function checkField(){
	 let returnObj = {isCriteriaFullFill:true,formData:{}};	 
     const ecrnFormArrLen = ecrnFormArr.length;
          
	 for(var i=0;i<ecrnFormArrLen;i++){
		 		 	 		 
		 var fieldVal = $("#"+ecrnFormArr[i].id).val(); 		
		 		  	     
		    if(ecrnFormArr[i].type && ecrnFormArr[i].type=='radio'){			    
			 if($("input[type='radio'][name='"+ecrnFormArr[i].id+"']:checked").val()){
					fieldVal = $("input[type='radio'][name='"+ecrnFormArr[i].id+"']:checked").val();
				 }			
			 else{
				 $("input[type='radio'][name='"+ecrnFormArr[i].id+"']").parent().css("background","red");
				 $("input[type='radio'][name='"+ecrnFormArr[i].id+"']").parent().click(function(){
					 $("input[type='radio'][name='"+ecrnFormArr[i].id+"']").parent().css("background","white");
				 })	  
				  returnObj.isCriteriaFullFill = false;			  
				  return false;					 
			  }			 
		  }
		  		  
	    if(ecrnFormArr[i].type && ecrnFormArr[i].type=='checkbox'){
			var attachedDocId = "";				 	     
			 $("input[type='checkbox'][name='"+ecrnFormArr[i].id+"']").each(function(){				 
				 if(this.checked){					
					fieldVal = fieldVal?fieldVal+","+$(this).attr(this.id):$(this).attr(this.id);
					attachedDocId = attachedDocId?attachedDocId+","+this.value:this.value
				 }
			});
			if(!fieldVal) fieldVal = "";
				returnObj.formData["attachedDocId"]= attachedDocId;		   	 
		 }
		    			 		     	
		  fieldVal = fieldVal?fieldVal.replaceAll("&","//AND//"):"";		 
		  returnObj.formData[ecrnFormArr[i].id]= fieldVal ;
		     
	    if(ecrnFormArr[i].isMandatory){		     			     
		     if(jQuery.trim($("#"+ecrnFormArr[i].id).val())===''){
				 returnObj.isCriteriaFullFill = false;
				 if($("#"+ecrnFormArr[i].id)!=null){
				 $("#"+ecrnFormArr[i].id).css("background","red");
				 document.getElementById(ecrnFormArr[i].id).addEventListener("click",function(){$("#"+this.id).css("background","white");});
	 	      }
	 	    }
	 	    else if(ecrnFormArr[i].id==='targetClosureDate'){
				 if(isDatePreviousToDay($("#"+ecrnFormArr[i].id).val())){
					returnObj.isCriteriaFullFill = false; 
				 }
			 }	    		 
		 }
		
	    if(ecrnFormArr[i].id=='pfsNumber'){
			let regex = new RegExp("^MCL[ -/a-zA-Z0-9]+$");
			if(jQuery.trim($("#"+ecrnFormArr[i].id).val())!==''){			  
			 if(!regex.test(jQuery.trim($("#"+ecrnFormArr[i].id).val()))){				 
				 returnObj.isCriteriaFullFill = false;
				 alert("Please be sure PFS number should start with MCL/ and does not contain special characters after / and - ");				 				
			  }			 
			}
		 }		 		 
	  }	  	 
	 return returnObj;
  }
  
 function updateChangeReason(selectId, inValue){	
	 if(inValue==='1'){
		 $("#"+selectId).val("3");		
	  }
	 else{
		$("#"+selectId).val("11");
	  }
  }
 
 function isDatePreviousToDay(inClosureDate){
	 
	 var returnBool = false;	
	 /* 
	 const curDate = new Date();
	 const month = curDate.getMonth()+1;
	 const date = curDate.getDate();
	 const curDateYYYYMMDD = curDate.getFullYear()+"-"+(month<10?"0"+month:month)+"-"+(date<10?"0"+date:date);
	 
	 if(inClosureDate<curDateYYYYMMDD){
		alert("Target Closure date can not be less than today's date");
		returnBool = true; 
	 }	 
	// console.log(returnBool); */
	 return returnBool;	 	 	 
  }
 
 function getUpdateTravelReq(tmId, empId){
	   $.ajax({url: "./include/requestform.jsp", type: "POST",data:{tmId:tmId,"epid":empId}, success: function(result){	 
		 $("#contentDiv").html(result);    
    }});
 }

 function cancelTravelReq(){
	var actionConfirm = confirm("Are you sure you want to cancel this ecrn?");
	 if(actionConfirm){
		 $("#divForDelAddUpdate").html(ajaxLoader);
	 var formData = {actionFor : "cancelEcrnReq", ecrnId:$("#ecrnId").val()};	 	 
	  $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
		 data : formData,
		 success: function(result){			 
		 let resultObj = JSON.parse(result);		 
		  $("#divForDelAddUpdate").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");		   
		   }
	    });
	 }
  }
  
 function updateEcrn(ecrnId,updateAction,notificationStatus){	 	
	 
	$("#modalHeader").html("Update ECRN : "+ecrnId);
	
	if(updateAction==='myFeasibility'){
		 $("#modalHeader").html("Live Notification for ECRN : "+ecrnId);	
	}
	else if(updateAction==='myHod'){
		 $("#modalHeader").html("HOD Status for ECRN : "+ecrnId);	
	}
	
	$.ajax({
		 url : "./include/editecrnform.jsp",
		 type: "POST",
		 data : {ecrnId:ecrnId,"viewMode":"edit","updateAction":updateAction,notificationStatus:notificationStatus},
		 success: function(result){
			 			 		
		  $("#modalId").css("display","block");
		  $("#modalContentDiv").html(result);
	
   if(updateAction=='myecr'){ /*
		  $.ajax({
		 url : "./include/ecrnapprovers.jsp",
		 type: "POST",
		 data : {ecrnId:ecrnId,"viewMode":"view","updateAction":"test"},
		 success: function(result){	
			 		
		  $("#approvalsDiv").html(result);
		  		  	  	 	   	  		          	       	       	     	       	       	       	   
	         }	        	        	    		  
           }); */
         }		  		  	 	   	  		          	       	       	     	       	       	       	   
	   }	    		  
    });    
  }
 
 function rejectFeasibility(actionFor,notificationStatus){
	
	var actionConfirm = false;
	
	let notRemarks = $("#notRemarks").val()?jQuery.trim($("#notRemarks").val()):"";
	let notDisclaimerText  = $("#notDisclaimerText").val()?jQuery.trim($("#notDisclaimerText").val()):"";
	let notDisclaimerValue = $("#notDisclaimerValue").is(":checked");
	
	if(notificationStatus==='Rejected'){
	if(notRemarks===""){
	   alert("Please enter notification remarks");
	   return false;
	   }
    if(notDisclaimerValue===false){
	    alert("Please confirm disclaimer.");
	    return false;   
	   }
	}
	  	
	if(notificationStatus==='Rejected'){		
	   actionConfirm= confirm("Are you sure you want to reject this ECRN for further processing?");
	}else if(notificationStatus==='Approved'){
	   actionConfirm = confirm("Are you sure you want to approve this ECRN for further processing?");	
	}
	else actionConfirm = true;
			 
	if(actionConfirm){
		$("#feasibilityDiv").html(ajaxLoader);
	
	 var formData = {actionFor : actionFor,ecrnId:$("#ecrnId").val(),notificationStatus:notificationStatus,
	 notRemarks:notRemarks,notDisclaimerText:notDisclaimerText,notDisclaimerValue:notDisclaimerValue};
	 	 	 	 
	  $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
		 data : formData,
		 success: function(result){			 			 			 			 			 			 	   
		   let resultObj = JSON.parse(result);	
		   $("#feasibilityDiv").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");		  
		   if(notificationStatus!=='Re-Initiated'){
		      loadSearch('feasibility');
		     }
		   else{
			  updateEcrn($("#ecrnId").val(),"myFeasibility","Re-Initiated"); 
		     }		   		   	   		   		   		   		   
		   }		    
	    });
	  }
   }
  function loadSearchTravel(pageName){
	 	
	/*let fromDate = $("#fromDate").val();
	let toDate   = $("#toDate").val();
	let searchEcrnReqTypeId  = $("#searchEcrnReqTypeId").val();
	let searchPhaseId        = $("#searchPhaseId").val();
	let searchProdDivisionId = $("#searchProdDivisionId").val();
	let searchCustId         = $("#searchCustId").val();
	let searchMoneyRecoveredByEcrn = $("#searchMoneyRecoveredByEcrn").val();
	let ecrnStatus = $("#ecrnStatus").val()?$("#ecrnStatus").val():'Active';
	let notificationStatus = $("#notificationStatus").val();
	let HodDeptStatus = $("#HodDeptStatus").val();
	let ecrnSubmittedBy = $("#ecrnSubmittedBy").val();
	let searchEcrnId = $("#searchEcrnId").val();
	let searchECNGenerated = $("#searchECNGenerated").val();*/
	let year=$("#yearFilter").val();
		
	let data = {year:year} ;
	
	$("#contentDiv").html(ajaxLoader);
	
   $.ajax({url: "./include/"+pageName+".jsp", type: "POST", data:data, success: function(result){	  
        $("#contentDiv").html(result);         
   }});
                            
    hilightTab("LeftSideMenuTab",pageName+"_LeftSideMenuTab","w3-blue");                    	 
 }
  function hodStatusUpdate(actionFor,HodDeptStatus){
	  
	var actionConfirm = false;
	
	let HodRemarks = $("#notRemarks").val()?jQuery.trim($("#notRemarks").val()):"";
	
	if(HodDeptStatus==='Rejected'){
	if(HodRemarks===""){
	   alert("Please enter rejection remarks");
	   return false;
	   }   
	}
	  	
	if(HodDeptStatus==='Rejected'){		
	   actionConfirm= confirm("Are you sure you want to reject this ECRN for further processing?");
	}else if(HodDeptStatus==='Accepted'){
	   actionConfirm = confirm("Are you sure you want to approved this ECRN for further processing?");	
	}
	else actionConfirm = true;
			 
	if(actionConfirm){
		$("#HODDiv").html(ajaxLoader);
	
	 var formData = {actionFor : actionFor, ecrnId:$("#ecrnId").val(), 
	 HodDeptStatus:HodDeptStatus,HodRemarks:HodRemarks};
	  	 	 
	  $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
		 data : formData,
		 success: function(result){			 			 			 			 			 			 	   
		   let resultObj = JSON.parse(result);	
		   $("#HODDiv").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");	  
		      loadSearch('hodpendings');		     		  	   		   	   		   		   		   		   
		   }		    
	    });  
	  }
	    
  }
  
 function openapprovals(ecrnId,updateAction){
	 
	$("#modalHeader").html("Update ECRN : "+ecrnId);
		
	$.ajax({
		 url : "./include/editecrnform.jsp",
		 type: "POST",
		 data : {ecrnId:ecrnId,"viewMode":"view","updateAction":updateAction},
		 success: function(result){			
		  $("#contentDiv").html(result);
		  
	   $.ajax({
		 url : "./include/ecrnapprovals.jsp",
		 type: "POST",
		 data : {ecrnId:ecrnId,"viewMode":"view","updateAction":"test"},
		 success: function(result){			 		
		 $("#approvalsDiv").html(result);		  		  	  	 	   	  		          	       	       	     	       	       	       	   
	         }	        	        	    		  
          });          		  	 	   	  		          	       	       	     	       	       	       	   
	    }	    		  
     });
  }
  
  function UpdateAnswer(updateType,answerId,feasiId,ecrnId,deptId,qId,value,name){
	  
	  var uId = feasiId+"-"+ecrnId+"-"+deptId;	  
	  $("#span"+uId).html(ajaxLoader);  
	     
	  let isUpdate = true;
	  if(updateType==='updateFeasibility' && name==='AccRej'){
		  
	   $("["+uId+"]").each(function(){
		   		   		   		   		   		 
		var ansUid =  $(this).attr(uId);		 		 
    	if($("#"+ansUid).attr("file")){	/*		
		  var ansVal = $("#"+ansUid).val();
		  if(jQuery.trim(ansVal)===''){			
		    $("#file-"+ansUid).css("background","red").css("padding","2px");
		     isUpdate = false;
		   }		*/   
		}else{  
		  var ansVal = $("#"+ansUid).val();
		  if(jQuery.trim(ansVal)===''){			
			 $("#"+ansUid).css("background","red");
			 isUpdate = false;
		     }
	    }
	    });
	    		
		if(!isUpdate) { $("#DivAccRej-"+uId+" select").val(""); return false;}    
		    isUpdate = confirm("Would you like to lock your decision?\nA mail would get triggered to the rest of the feasibility team member about the same.\nAfter this you will not be able to make change in this department.");
	     if(isUpdate){}	      
	     else{		  	 
		  $("#DivAccRej-"+uId+" select").val("");	 
		 }		    
	  }
	 else if(updateType==='updateAnswer'){
		var ansUid = answerId+"-"+feasiId+"-"+ecrnId+"-"+deptId+"-"+qId;
		$("#"+ansUid).css("background","white"); 
	 }
	  	  	  
    if(isUpdate){
	  $.ajax({
		 url : "./ajax/ecrnrequest.jsp",
		 type: "POST",
   		 data : {actionFor : updateType,answerId:answerId,feasiId:feasiId,ecrnId:ecrnId,deptId:deptId,qId:qId,value:value,name:name},
		 success: function(result){			 		 		 			 			 			 			 			 	   
		 let resultObj = JSON.parse(result);		 		 
		 if(updateType==='updateFeasibility' && name==='AccRej'){
		   if(!resultObj.isRiskAssessmentCompleted){
			 alert(resultObj.msg);
			 $("#DivAccRej-"+uId+" select").val("");
			 return false;  
		   }else{
		   $("#DivAccRej-"+uId).html(ajaxLoader);		   
		   $.ajax({
			 url : "./include/ecrnapprovals.jsp",
			 type: "POST",
			 data : {ecrnId:ecrnId,"viewMode":"view","updateAction":"test"},
			 success: function(result){				 			 		
			     $("#approvalsDiv").html(result);		  		  	  	 	   	  		          	       	       	     	       	       	       	   
		       }	        	        	    		  
            });
            }          
		  }		 
		 else{			 		 	
		  $("#span"+uId).html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");
		  if(name==='fileUpload' && fileObj.fileName){
			$("#file-"+ansUid).css("background","white"); 			
			$("#"+answerId+"-"+feasiId+"-"+ecrnId+"-"+deptId+"-"+qId).val(fileObj.fileName);  		  
		    $("#"+fileObj.upId).html("").addClass("fa-arrow-circle-up");
		    $("#"+fileObj.downId).html("<a href='"+docStartPath+fileObj.fileName+"' target='_new'><span class='fa fa-arrow-circle-down cursorPointer'></span></a>");
		     }		  
		   }	   		 		 		 		 		 
	     }		    
	  });
	}	 
 }
 
 function openForRiskAssessment(deptName, viewMode, ecrnId, deptId,feasiId){
	 	 	
	 let riskModalHeader = "<span style='font-size:21px;'>"+"Risk Assessment : "+deptName+"</span>";
	 	 
	 if(jQuery.trim(viewMode)==='Edit' || jQuery.trim(viewMode)==='edit'){
	     riskModalHeader += "<span style='font-size:18px;font-weight:bold;margin-left:20px;color:blue;background:white;padding:7px;cursor:pointer;' id='ModalViewModeSpan' onClick='openForRiskAssessment(\""+deptName+"\",\"View\","+ecrnId+","+deptId+","+feasiId+")'>Open View Mode</a></span>";
	 }else{
	     riskModalHeader += "<span style='font-size:18px;font-weight:bold;margin-left:20px;color:blue;background:white;padding:7px;cursor:pointer;' id='ModalEditModeSpan' onClick='openForRiskAssessment(\""+deptName+"\",\"Edit\","+ecrnId+","+deptId+","+feasiId+")'>Open Edit Mode</a></span>";
	  }	  
	     riskModalHeader += "<span style='margin-left:30px;font-size:14px;'>in case of high risk, a mitigation plan needs to be initiated</span>";
	     riskModalHeader += "<span style='float:right;margin-right:30px;font-size:17px;'><a target='_new' href='"+fileStartPath+"4M_risk_assessment_guidelines.pdf'>4M Risk Guidelines</a></span>";
     
     $("#modalHeader").html(riskModalHeader);
     
     $("#modalContentDiv").html("<div style='text-align:center;padding:50px;'>"+ajaxLoader+"<div>");
     $.ajax({
	   url : "./include/riskassessment.jsp",
	   type: "POST",
   	   data : {ecrnId:ecrnId,deptId:deptId,feasiId:feasiId,viewMode:viewMode},
	   success: function(result){
		   	$("#modalId").css("display","block");
	        $("#modalContentDiv").html(result);        	   	   	   	   	 	 
	     }
	  })	      
  }
 
 function compareActualTargetDate(uId){
	 var actualDate = $("#actualDate"+uId).val();
	 var targetDate = $("#targetDate"+uId).val();
	 
	 if(targetDate<actualDate){
		 alert("Target date can't be less than actual date.");
		 $("#targetDate"+uId).val("");
		 return false;
	  }	 
  }
 
 function updatePlan(updateType,feasiId,ecrnId){
	 var formData = {actionFor:updateType,feasiId:feasiId,ecrnId:ecrnId};
	 let updateAjax = true;
	
	 const riskPlanArr = [{"name":"",id:"riskAssId",isMandatory:true},
	 {"name":"Action Plan", id:"actionPlan",isMandatory:true},
	 {"name":"Responsibility", id:"responsibility",isMandatory:true},
	 {"name":"Actual Date",  id:"actualDate",isMandatory:true},
	 {"name":"Target Date", id:"targetDate",isMandatory:true},
	 {"name":"Remarks", id:"remarks",isMandatory:false}]
	 
	 
   $("input[name='"+feasiId+"-"+ecrnId+"']").each(function(index){
	  
	  var uId = $(this).val();
	  var RiskAssId = $(this).attr("id");
	  var RiskType = $("#RiskType"+uId).val();
	  
	  formData["index"] = index;
	  formData["RiskUid"+index] = uId;
	  formData["RiskAssId"+index] = RiskAssId;
	  formData["RiskType"+index] = RiskType;
	  formData["qId"+index] = $("#qId"+uId).val();
	  formData["FormDeptId"+index] = $("#FormDeptId"+uId).val();		  
	  
	  if(jQuery.trim(RiskType)==''){ 
		  alert("It is must to select all risk type.");
		  updateAjax = false;
	      return false;
	  }
	  else{	 
	  var isHighRiskConditionFullFill = true;	  
	  var riskPlanArrLen = riskPlanArr.length;
	  for(var i=0;i<riskPlanArrLen;i++) {	  
	      var value = $("#"+riskPlanArr[i].id+uId).val()?jQuery.trim($("#"+riskPlanArr[i].id+uId).val().replaceAll("&","//AND//")):"";
		     formData[riskPlanArr[i].id+index]=value ;
	    if(jQuery.trim(RiskType)=='high' || jQuery.trim(RiskType)=='High'){	  
		 if(riskPlanArr[i].isMandatory) {
		  if(jQuery.trim(value)==="") {
		    $("#"+riskPlanArr[i].id+uId).css("background","red");
		     document.getElementById(riskPlanArr[i].id+uId).addEventListener("click",
			 function(){$("#"+this.id).css("background","white");});			 
	         isHighRiskConditionFullFill = false;	    
		      }			  
		    }
		  }	 			
	    }
	    	    	   
	   if(!isHighRiskConditionFullFill){		   
		   alert("For high risk type all fields are mandatory.");
		   updateAjax = false;
		   return false;		   
	      }	     
	   }
	   	   	   	 
    });
   		
   if(updateAjax){
	  $("#submitDiv").html(ajaxLoader);
	  $.ajax({
		url : "./ajax/ecrnrequest.jsp",
		type: "POST",
   		data : formData,   
		success: function(result) {		 		 		 			 			 			 			 			 	   
		 let resultObj = JSON.parse(result);
		 $("#submitDiv").html(resultObj.msg).css("color",resultObj.color).css("font-weight","bold");	 		 
		 }		 
       });
     }   
  }
 
 function uploadFileOnly(updateType,updatePathId,downId, upId){
	 fileObj = {updateType:updateType,updatePathId:updatePathId,downId:downId,upId:upId}; 
 }  
 
 function uploadFileOnBrowse(updateType, answerId, feasiId, ecrnId, deptId, qId, downId, upId){	 
	fileObj = {updateType:updateType,answerId:answerId,feasiId:feasiId,
	           ecrnId:ecrnId,deptId:deptId,qId:qId,downId:downId,upId:upId};   	  
 }
  
 function afterUpload(inObj){ 
	
	if(fileObj.updateType==='uploadFileOnly') {
				
	  var uploadedFile = jQuery.trim($("#"+fileObj.updatePathId).val());
	      uploadedFile = uploadedFile==""?jQuery.trim(inObj.fileName):uploadedFile+"/-/"+jQuery.trim(inObj.fileName);
	  
	  var uploadedFileArr = uploadedFile.split("/-/");
	  var downloadFiles = "";
	  if(uploadedFileArr.length>0){
		  for(let i=0;i<uploadedFileArr.length;i++){
			  downloadFiles +="<a href='"+docStartPath+uploadedFileArr[i]+"' target='_new' style='padding:3px 6px;border-radius:2px;background:1px solid #aaa !important;'>"+(i+1)+" <span class='fa fa-arrow-circle-down cursorPointer'></span></a>";		 
		  }
	  }
	     
	  $("#"+fileObj.updatePathId).val(uploadedFile);
	  $("#"+fileObj.downId).html(downloadFiles);
	  $("#"+fileObj.upId).html("").addClass("fa-arrow-circle-up");
	  	
	}
	else if(fileObj.updateType==="updateAnswer"){
	  fileObj.fileName = inObj.fileName; 
	  UpdateAnswer(fileObj.updateType,fileObj.answerId,fileObj.feasiId,fileObj.ecrnId,fileObj.deptId,
	  fileObj.qId,inObj.fileName,"fileUpload");
	}
							 
 }
 
 
 
 