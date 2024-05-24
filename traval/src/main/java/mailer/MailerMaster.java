package mailer;

import org.apache.commons.mail.HtmlEmail;

public class MailerMaster {
	
	private MailerEmbedCids embedCid;
	private HtmlEmail htmlEmail;
	private String from;
	private String toList;
	private String ccList;
	private String bbcList;
	private String header;
	private String footer;
	private String content;
	private String subject;
	private String fullMailContent;
	private String actionType;
	
	private String displayToList;
	private String displayCcList;	
	
	public MailerEmbedCids getEmbedCid() {
		return embedCid;
	}
	public void setEmbedCid(MailerEmbedCids embedCid) {
		this.embedCid = embedCid;
	}
	public HtmlEmail getHtmlEmail() {
		return htmlEmail;
	}
	public void setHtmlEmail(HtmlEmail htmlEmail) {
		this.htmlEmail = htmlEmail;
	}
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getToList() {
		return toList;
	}
	public void setToList(String toList) {
		this.toList = toList;
	}
	public String getCcList() {
		return ccList;
	}
	public void setCcList(String ccList) {
		this.ccList = ccList;
	}
	public String getBbcList() {
		return bbcList;
	}
	public void setBbcList(String bbcList) {
		this.bbcList = bbcList;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getFooter() {
		return footer;
	}
	public void setFooter(String footer) {
		this.footer = footer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFullMailContent() {
		return fullMailContent;
	}
	public void setFullMailContent(String fullMailContent) {
		this.fullMailContent = fullMailContent;
	}
	public String getActionType() {
		return actionType;
	}
	public void setActionType(String actionType) {
		this.actionType = actionType;
	}
	
	public String getDisplayToList() {
		return displayToList;
	}
	public void setDisplayToList(String displayToList) {
		this.displayToList = displayToList;
	}
	public String getDisplayCcList() {
		return displayCcList;
	}
	public void setDisplayCcList(String displayCcList) {
		this.displayCcList = displayCcList;
	}

 }




