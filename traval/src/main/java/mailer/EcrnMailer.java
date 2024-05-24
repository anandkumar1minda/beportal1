package mailer;

import java.net.URL;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.commons.mail.HtmlEmail;

import idc.common.AppCommon;
import idc.common.AppDbCommon;

public class EcrnMailer {

	private String from = "code@mindacorporation.com";
	
	public static void main(String[] args) {
		try {
			
		//	 mailer.sendEcrnHtmlMail("Test", "praveenchauhan334@gmail.com", "praveen.chauhan", "praveen.chauhan", "<h2>this is test mailer</h2>");
				 
			 HtmlEmail email = new HtmlEmail();
			 
			 URL url = new URL(AppDbCommon.COMMON_DOC_IMAGE+"mindalogo.png");
			 String cid = email.embed(url, "mindaLogo");
			 
			 MailerEmbedCids mailerEmbedCids = new MailerEmbedCids(email);
			 mailerEmbedCids.setCheckBoxCid("7px");
			 String checboxcid = mailerEmbedCids.getCheckBoxCid();		 
			 
			 MailerMaster mailerMaster = new MailerMaster();
			 
			 mailerMaster.setToList("praveen.chauhan@mindacorporation.com");
			 mailerMaster.setCcList("praveen.chauhan@mindacorporation.com");
			 
			 mailerMaster.setSubject("Test Image Embed function.. ");			 
			 
			 String mailContent = "<html><h3>this is test mailer with new Mailer Function to embed image.</h3>";
			        mailContent += " image : <img src=cid:"+cid+"></html>";
			        mailContent += " image : <img src=cid:"+checboxcid+"></img></html>";			 
			
			 mailerMaster.setHtmlEmail(email);
			 mailerMaster.setFullMailContent(mailContent);
			 
			 new EcrnMailer().sendCommonEcrnHtmlMail(mailerMaster);
				
			}catch(Exception ex){
			   System.out.println("Error in function  "+ex.toString());
	      }		
	}
		  
    public void appendRecipient(Message message, Message.RecipientType recipientType, String recipents) {
			
		   try{
			   String appendedStr = "";
		       String recipentArr[] = recipents.split(",");
		       int recipentLen = recipentArr.length;
		       if(recipentLen>0){
		    	  for(int i=0;i<recipentLen;i++){
		    		  if(recipentArr[i].contains("@mindacorporation.com" ) || recipentArr[i].contains("@mindavast.com")
		    				  || recipentArr[i].contains("@mindainfac.com")){
		    			  appendedStr = appendedStr.equalsIgnoreCase("")?recipentArr[i]:appendedStr+","+recipentArr[i];	    			  
		    		  }
		    		  else {
		    			  appendedStr = appendedStr.equalsIgnoreCase("")?recipentArr[i]+"@mindacorporation.com":appendedStr+","+recipentArr[i]+"@mindacorporation.com";	  
		    		   }
		    	    }
		        }
		       else {
		    	    if(recipents.contains("@mindacorporation.com")  || recipents.contains("@mindavast.com")
		    	    		|| recipents.contains("@mindainfac.com")){
		    	    	 appendedStr = appendedStr.equalsIgnoreCase("")?recipents:appendedStr+","+recipents;		    	    	 
		    		  }
		    		  else {

		    			  appendedStr = appendedStr.equalsIgnoreCase("")?recipents+"@mindacorporation.com":appendedStr+","+recipents+"@mindacorporation.com";		 	  
		    		}   
		       }		       
			   if(!appendedStr.trim().equalsIgnoreCase("")) { 
				   message.addRecipients(recipientType, InternetAddress.parse(appendedStr));
			   }
			   
			}catch(Exception ex) {
				System.out.println("Error in function idc.utils -> EcrnMailer -> "
		        + "appendRecipient(Message message, Message.RecipientType recipientType, String recipents) :: "+ex.toString());
			}		 
		 }
		 
	public boolean sendEcrnHtmlMail(String subjectLine, String sendFrom, String toList, String ccList,String mailContent) {
			  
			  boolean isMailSent = false; 
			  try {
			   Session session = new EcrnMailSession().getSession();
			   
		       Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(from));
			   
			   appendRecipient(message,Message.RecipientType.TO,toList);
			   appendRecipient(message,Message.RecipientType.CC,ccList);
			   
			 //  message.addRecipients(Message.RecipientType.BCC, InternetAddress.parse("praveen.chauhan@mindacorporation.com"));
			   
			   message.setSubject(subjectLine);
			   message.setContent(mailContent, "text/html");

			   Transport.send(message);
		//	   System.out.println("Sent message successfully....");
			   isMailSent = true;
			   
		      }catch(MessagingException e) {
			     System.out.println(" Error in mail idc.utils -> EcrnMailer -> "
			     		+ " sendEcrnHtmlMail(String subjectLine, String sendFrom, String toList,"
			     		+ " String ccList,String mailContent) "+e.toString());
		      }		  
			  return isMailSent;
		  }
		 
		 public boolean sendEcrnHtmlMail(MailerMaster mailerMaster) {
			  
			  boolean isMailSent = false; 
			  try {
				  
			   Session session = new EcrnMailSession().getSession();  
			   
		       Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(from));
			   
			   appendRecipient(message,Message.RecipientType.TO, mailerMaster.getToList()==null?"":mailerMaster.getToList());
			   appendRecipient(message,Message.RecipientType.CC, mailerMaster.getCcList()==null?"":mailerMaster.getCcList());		   
			   appendRecipient(message,Message.RecipientType.BCC,AppCommon.ECRN_BBC);
			   
			   message.setSubject(mailerMaster.getSubject());
			   message.setContent(mailerMaster.getFullMailContent(), "text/html");

			   Transport.send(message);
			   
			   isMailSent = true;
			   
		      }catch(MessagingException e) {
			   System.out.println("Error in mail idc.mailer -> EcrnMailer -> sendHtmlMail(MailerMaster mailerMaster) "+e.toString());
		      }
			  
			  return isMailSent;
			  
		   }
		 
  // commons mail function ... ... ... 
		 
     public void addCommonRecipient(HtmlEmail email, String listType , String recipents) {
				
		  try{	
			   if(recipents==null) recipents = "";
			   
		       String recipentArr[] = recipents.split(",");
		       int recipentLen = recipentArr.length;
		       
	       if(recipentLen>0){		    
		      for(int i=0;i<recipentLen;i++){
		          String receipent = recipentArr[i];
		      
			       if(receipent.contains("@mindacorporation.com") || receipent.contains("@mindavast.com")
			    		   || receipent.contains("@mindainfac.com")){	}
			       else {
			          receipent = receipent+"@mindacorporation.com";
			    	    }
			       
			       if(listType.equalsIgnoreCase(MailCommon.TO_LIST)) {
			    	   email.addTo(receipent);       
			       }		    	   
			       else if(listType.equalsIgnoreCase(MailCommon.CC_LIST)) {
			    	   email.addCc(receipent);
			       }
	               else if(listType.equalsIgnoreCase(MailCommon.BCC_LIST)) {
	            	    email.addBcc(receipent);
			        }   
		         }
		    }
		    else {
		    	   String receipent = recipents;
				      
			       if(receipent.contains("@mindacorporation.com") || receipent.contains("@mindavast.com") 
			    		   || receipent.contains("@mindainfac.com")){}
			       else {
			        		receipent = receipent+"@mindacorporation.com";
			    	    }
			       
			       if(listType.equalsIgnoreCase(MailCommon.TO_LIST)) {
			    	   email.addTo(receipent);       
			       }		    	   
			       else if(listType.equalsIgnoreCase(MailCommon.CC_LIST)) {
			    	   email.addCc(receipent);
			       }
	               else if(listType.equalsIgnoreCase(MailCommon.BCC_LIST)) {
	            	    email.addBcc(receipent);
			        }			       
		       }		       
			}catch(Exception ex) {
				System.out.println("Error in function "+this.getClass().getName()+" addCommonRecipient(HtmlEmail email, String listType , String recipents) :: "+ex.toString());
		 }		 
	 }
	
	public boolean sendCommonEcrnHtmlMail(MailerMaster mailerMaster) {
			  
			  boolean isMailSent = false; 
			  try{
				  
		      HtmlEmail email = mailerMaster.getHtmlEmail();
		      
		      new EcrnMailSession().setCommonsEmail(email);
		      
			  email.setFrom(from);			  
			  email.setSubject(mailerMaster.getSubject());
	          email.setHtmlMsg(mailerMaster.getFullMailContent());
	          
	          addCommonRecipient(email, MailCommon.TO_LIST ,mailerMaster.getToList());
	          
	          if(mailerMaster.getCcList()!=null && !mailerMaster.getCcList().equalsIgnoreCase("")){
	             addCommonRecipient(email, MailCommon.CC_LIST ,mailerMaster.getCcList());
	          }
	          
	          addCommonRecipient(email, MailCommon.BCC_LIST, AppCommon.ECRN_BBC);
	          
	          email.send();
		       
			  isMailSent = true;
			   
		     }catch(Exception e) {
			   System.out.println("Error in mail "+this.getClass().getName()+".sendCommonEcrnHtmlMail(HtmlEmail email,MailerMaster mailerMaster) "+e.toString());
		      }
			  
			 return isMailSent;			  
		}
		 
  }

