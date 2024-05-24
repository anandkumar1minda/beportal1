<%
if(session.getAttribute("ID")!=null && session.getAttribute("HASH")!=null){	
%>
	<div id="modalId" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="width:93%;">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('modalId').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2 id="modalHeader"></h2>        
      </header>
      <div class="w3-container" id="modalContentDiv"></div>    
    </div>
  </div>
<%  
}
else{
}  
%>

