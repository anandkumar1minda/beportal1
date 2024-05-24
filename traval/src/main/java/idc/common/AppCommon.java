package idc.common;

import ecrn.appcommon.EcrnDbCommon;
import ecrn.common.EcrnCommon;

public interface AppCommon {

	/*
 	public String SANJAY_MIL_STAFF = "sanjaygupta@mindacorporation.com,veena.sharma@mindacorporation.com,"
 			+ "ecrn.mil@mindacorporation.com,praveen.chauhan@mindacorporation.com,ashu.dua@mindacorporation.com"; */
 	
 	public String ECRN_BBC = "siddharth.joshi@mindacorporation.com,ashu.dua@mindacorporation.com,anand.kumar1@mindacorporation.com";
	
	/*	public String SANJAY_MIL_STAFF = "ajay.choudhary@mindacorporation.com,gorav.sharma@mindacorporation.com,"
			+ "nitin.saxena@mindacorporation.com,soumya.panda@mindacorporation.com,sunil.gupta@mindacorporation.com,"
			+ "vinay.pawar@mindacorporation.com,nikhil.k@mindacorporation.com,manoj.deshpande@mindacorporation.com";
    */
   
 	public int LOCAL_HOST_ID = 212;
 	public String LOCAL_HOST_NAME  = "Ashu Dua";
 	public String LOCAL_HOST_EMAIL = "ashu.dua@mindacorporation.com";
 	
 	public String LOCAL_HOST_TO_LIST  = "praveen.chauhan@mindacorporation.com,ashu.dua@mindacorporation.com";
 	public String LOCAL_HOST_CC_LIST  = "praveen.chauhan@mindacorporation.com,ashu.dua@mindacorporation.com,anand.kumar1@mindacorporation.com";
 	
	public String PAGE_TITLE = "Minda Corporation";
	public String isSuccess = "isSuccess";
	public String MSG = "msg" ;
	public String ID = "id";
	public String COLOR = "color";
	public String BG_COLOR = "bgColor";
	
	// json response color
	public String JSON_RES_RED = "red";
	public String JSON_RES_BLUE = "blue";
	public String JSON_RES_GREEN = "green";
	public String JSON_RES_ORANGE = "orange";
	
	// Mailer Fonts
	public String MAIL_ACTION_UPDATE = "MAIL_ACTION_UPDATE";
	public String MAIL_ACTION_INSERT = "MAIL_ACTION_INSERT";
	public String MAIL_ACTION_CANCEL = "MAIL_ACTION_CANCEL"; 
	public String MAIL_ACTION_REJECTED = "MAIL_ACTION_REJECTED";
	public String MAIL_ACTION_RE_INITIATED = "MAIL_ACTION_RE_INITIATED";
	public String MAIL_ACTION_APPROVED = "MAIL_ACTION_APPROVED";
	
	public String MailHeaderBackGroundColor = "#AFDCEC";
	public String MailFontFamily = "Arial, sans-serif, Open Sans";
	public String MailFontTextSize = "14px";
	public String MailFontHeaderSize = "14px";
	public String MailerCommonStyle = "font-family:"+AppCommon.MailFontFamily+";padding:4px;";
	
	public String MAIL_HEAD_BODY_START = "<html><body style='font:"+AppCommon.MailFontFamily+";font-size:"+AppCommon.MailFontTextSize+"'>";
	public String MAIL_HEAD_BODY_END = "<p style='"+AppCommon.MailerCommonStyle+"'>Thank you and best regards,<br/><a href='"+EcrnDbCommon.ECRN_START_URL+"/index.jsp'>"+EcrnCommon.M_A_NAME+" Online System</a></p></body></head>";

  }



