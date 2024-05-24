 <jsp:useBean id="generateTokan" scope="page" class="idc.login.GenerateTokan"></jsp:useBean> 
 <% 
   out.println(generateTokan.sendToken(request));
 %>
