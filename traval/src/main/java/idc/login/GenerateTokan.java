package idc.login;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;

import idc.common.AppCommon;
import idc.common.AppDbCommon;
import idc.connection.ConnectionMaster;
import idc.emp.EmpFaces;
import idc.emp.EmpMaster;
import idc.emp.HashGenerator;
import idc.utils.MysqlFuns;
import mailer.EcrnMailer;

public class GenerateTokan {
	
public JSONObject sendToken(HttpServletRequest request) {
		
		JSONObject jsonObj = new JSONObject();
		try {
		
		Connection conn = new ConnectionMaster().getMindaConnection();
		Statement st = conn.createStatement();
		
		String empEmail =  request.getParameter("empEmail");
		
		if(empEmail==null){
			empEmail = "";
		}
		if(empEmail.equalsIgnoreCase("")){
			jsonObj.put(AppCommon.MSG, "Please enter your email Id");
			jsonObj.put(AppCommon.COLOR, "red");
			jsonObj.put(AppCommon.isSuccess, "false"); 
		}
		else {			
		    if(empEmail.contains("@mindacorporation.com") || empEmail.contains("@mindavast.com") 
		    		|| empEmail.contains("@mindainfac.com")) {}
		    else {
		    	empEmail = empEmail+"@mindacorporation.com";
		    } 
		
		EmpMaster empMaster = new EmpFaces().getMaster(st, empEmail);
		
		if(empMaster.getEmpId()== 0 || empMaster.getEmpName() == null){
			jsonObj.put(AppCommon.MSG, "Your email id "+empEmail+" is not registered in our system.");
			jsonObj.put(AppCommon.COLOR, "red");
			jsonObj.put(AppCommon.isSuccess, "false"); 	
		}
		else{
		   if(empMaster.getEmpId()!=0){
			   
		String activeToken = activateToken(st,empMaster);
		if(!activeToken.equalsIgnoreCase("")){	
		
	 String returnStr = "<p>Dear "+empMaster.getEmpName()+",</p>";
	       returnStr += "<p>Please Click on link given below to login to the new ECRN system. Please do not share this token with any one.</p>";
	       returnStr += "<p><a href='"+AppDbCommon.START_URL+"login.jsp?email="+empMaster.getEmpEmail()+"&activeToken="+activeToken+"'>"+AppDbCommon.START_URL+"login.jsp?email="+empMaster.getEmpEmail()+"&activeToken="+activeToken+"</a></p>";
	      
	       new EcrnMailer().sendEcrnHtmlMail("New Login Token Generated", "", empEmail, "", returnStr);
	       
	       jsonObj.put(AppCommon.MSG, "A login token is sent to you email id.");
		   jsonObj.put(AppCommon.COLOR, "blue");
		   jsonObj.put(AppCommon.isSuccess, "true");
		   
		    }
			   }      
		   }
	    }
		
	    st.close();
	    conn.close();
	    
		}catch(Exception ex) {
		  System.out.println("Error in function idc.login -> GenerateTokan  -> sendToken : "+ex.toString());	
		}		
		return jsonObj; 
   }
	
  private String activateToken(Statement st, EmpMaster empMaster){
	  String newToken = "";
	  
	  try {
	
	  newToken = new HashGenerator().generateUniqueToken(50);
	  
	  String query = "SELECT TokenId FROM active_token WHERE EmpId='"+empMaster.getEmpId()+"'";
//	  System.out.println(query);
	  ResultSet rs = st.executeQuery(query);
	  
	  int tokenId = 0;
	  if(rs.next()){		  
		  tokenId = rs.getInt("TokenId");		  
	  }
	  
	  if(tokenId!=0){
		query = "update Active_Token set ActiveToken='"+newToken+"',WhenGenerate=NOW() WHERE EmpId='"+empMaster.getEmpId()+"'";
		System.out.println(query);
		st.executeUpdate(query);
			 		  
	  }
	  else {
		 query = "INSERT INTO active_token(EmpId,ActiveToken,WhenGenerate)"
		 		+ " values('"+empMaster.getEmpId()+"','"+newToken+"',NOW())"; 
		 st.executeUpdate(query);
		 
		 tokenId = new MysqlFuns(st).getLastInsertedId();		 
	  }
	  
	  query = "INSERT INTO active_token_trn(TokenId,ActiveToken,WhenGenerate)"
		 		+ " values('"+tokenId+"','"+newToken+"',NOW())"; 
		 st.executeUpdate(query);
	  
	  }catch(Exception ex) {
		  System.out.println("Error in function idc.emp -> GenerateTokan  -> activateToken : "+ex.toString());	
		}
	  
	  return newToken;
	  
    } 
  
 }

