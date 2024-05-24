
 function updateHeaderWidth(headerTableId, contentTableId){
	 
	 var headerTable = document.getElementById(headerTableId);
	 var contentTable = document.getElementById(contentTableId);
	 
	 var headerLen  = headerTable.rows[0].cells.length ;
	 var contentLen = contentTable.rows[0].cells.length ;
	 
	 headerTable.style.width = "1400px";
	 contentTable.style.width= "1400px";
	 
//	 $("#"+headerTableId+" table").css('width',"100%") ;
//	 $("#"+contentTableId+" table").css('width',"100%") ;
	 
	console.log($("#"+headerTableId).css('width')+"  :  : "+$("#"+contentTableId).css('width'));
	
	 if(headerLen>0){
	  if(headerLen===contentLen){									
	   for(let i=0;i<headerLen;i++){
		   
		var headerCellWidth = $("#"+headerTableId+" th:eq("+i+")").css('width');
		var contentCellWidth = $("#"+contentTableId+" td:eq("+i+")").css('width'); 
		
		var headerCellWidthNum = parseFloat(headerCellWidth.substring(0,headerCellWidth.indexOf("px")));
		var contentCellWidthNum = parseFloat(contentCellWidth.substring(0,contentCellWidth.indexOf("px")));
		
		var avgWidth = headerCellWidthNum > contentCellWidthNum ? headerCellWidthNum : contentCellWidthNum ;
		    avgWidth = avgWidth+"px"; 
	
		$("#"+headerTableId+" th:eq("+i+")").css('width',avgWidth);
		$("#"+contentTableId+" td:eq("+i+")").css('width',avgWidth);
		
	   console.log("Original : : : "+headerCellWidth+" , "+contentCellWidth);
       console.log($("#"+headerTableId+" th:eq("+i+")").css('width')+" "+$("#"+contentTableId+" td:eq("+i+")").css('width'));
       console.log("TEST : "+headerCellWidthNum+" , "+contentCellWidthNum);		

	       }		 	 
		}
	 }
 }
 
 