package mailer;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;

public class EcrnMailSession {
	
	  private static final String SMTP_HOST = "smtp.office365.com";
	  private static final int SMTP_PORT = 587;
	  private static final boolean SMTP_AUTH = true;
	  private static final boolean SMTP_STARTTLS = true;
	  
	  private static final String USERNAME = "code@mindacorporation.com";
	  private static final String PASSWORD = "bfflkfmwjsggwzff";
	  
	  Session session;
	  HtmlEmail email;
	
	public Session getSession() {
		setSession();
		return this.session;
	}	

	public void setSession(){
		
	    Properties props = new Properties();
	    props.put("mail.smtp.auth", SMTP_AUTH);
	    props.put("mail.smtp.starttls.enable", SMTP_STARTTLS);
	    props.put("mail.smtp.host", SMTP_HOST);
	    props.put("mail.smtp.port", SMTP_PORT);	      
	    
	    this.session = Session.getInstance(props,
	         new javax.mail.Authenticator(){
	             protected PasswordAuthentication getPasswordAuthentication(){
	             return new PasswordAuthentication(USERNAME, PASSWORD);
	         }
		 });	      
	 }
	
	public void setCommonsEmail(HtmlEmail email){ 
		try {
		
		 email.setHostName(SMTP_HOST);
		 email.setSmtpPort(SMTP_PORT);
		 email.setStartTLSEnabled(SMTP_STARTTLS);
		 email.setStartTLSRequired(true);
		 email.setSSLCheckServerIdentity(true);
		 email.setAuthenticator(new DefaultAuthenticator(USERNAME, PASSWORD));
		 email.setDebug(false);
		 
		}
		catch(Exception ex) {
			System.out.println("Error in function mailer-> EcrnMailSession -> setCommonsEmail :: "+toString());
		}
	}
	
 }



