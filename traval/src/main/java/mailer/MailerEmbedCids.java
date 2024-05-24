package mailer;

import javax.activation.DataSource;
import javax.activation.FileDataSource;

import org.apache.commons.mail.HtmlEmail;

import idc.common.AppDbCommon;

public class MailerEmbedCids {
	
	HtmlEmail email;
	public MailerEmbedCids(HtmlEmail email) {
		this.email = email;
	}
	
	String checkBoxCid="", downloadCid="";
	
	public String getCheckBoxCid() {
		return this.checkBoxCid;
	}
	public String getDownloadCid() {
		return this.downloadCid;
	}
	
	public void setCheckBoxCid(String size){
		try {
			
		DataSource fds = new FileDataSource(AppDbCommon.COMMON_DOC_IMAGE+"filledcheckbox7px.png");
		this.checkBoxCid = email.embed(fds, "filledCheckbox");
					
		}catch(Exception ex) {
		  System.out.println("Error in function "+this.getClass().getSimpleName()+"  "+ex.toString());
		}		
	} 
	public void setDownloadCid(String size){
		try {
		
		DataSource fds = new FileDataSource(AppDbCommon.COMMON_DOC_IMAGE+"download7px.png");
		this.downloadCid = email.embed(fds, "downloadFile");
					
		}catch(Exception ex) {
		  System.out.println("Error in function "+this.getClass().getSimpleName()+"  "+ex.toString());
		}		
	}

 }
