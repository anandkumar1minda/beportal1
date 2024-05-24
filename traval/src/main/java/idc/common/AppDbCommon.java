package idc.common;

public interface AppDbCommon {	
	
	
	// local site
	public boolean isLocalHost = true;
	public boolean isMailLocalHost = true;
	public boolean isUAT = true;
	
	public String DB_HOST   = "localhost";
	public String DB_PORT   = "3306";
	public String DB        = "minda_org";
	public String DB_USER   = "root";
	public String DB_PASS   = "Unix@101";	
	public String MINDA_DB  = "minda_org";
	public String SUGGESTION_DB  = "suggestion_box";
	
	public String APP_LOG_PATH = "C:/Users/praveen.chauhan/OneDrive/minda_apps/idc/src/main/webapp/WEB-INF/log4j.properties";	
	public String COMMON_DOC_DATA = "C:/Users/praveen.chauhan/OneDrive/minda_apps/appdocuments/src/main/webapp/data/";
	public String COMMON_DOC_FILE = "http://localhost:8080/appdocuments/files/";
	public String COMMON_DOC_UPLOAD = "C:/Users/praveen.chauhan/OneDrive/minda_apps/appdocuments/src/main/webapp/docs/";
	public String COMMON_DOC_IMAGE = "C:\\Users\\praveen.chauhan\\OneDrive\\minda_apps\\appdocuments\\src\\main\\webapp\\images\\";
		
	public String HTTP_HOST = "http://localhost:8080/";
	public String START_URL = "http://localhost:8080/idc/";
	
	public String SERVER_SCHEME = "http";
	public int      SERVER_PORT = 8080;
	public String   SERVER_NAME = "localhost";
	
	public String UAT_MSG = "This is test URL. Data Updated at this URL will not be visible at production URL..";
	
    /*	
 // UAT Site 
	public boolean isLocalHost = false;
	public boolean isMailLocalHost = true;	
	public boolean isUAT = true;
	
	public String DB_HOST = "localhost";
	public String DB_PORT = "3306";
	public String DB      = "test_minda_org";
	public String DB_USER = "root";
	public String DB_PASS = "FGh%4#45ndF32";
	
	public String MINDA_DB = "test_minda_org";
	public String SUGGESTION_DB  = "test_suggestion_box";
	
	public String APP_LOG_PATH = "";
	public String COMMON_DOC_DATA   = "C:/Program Files/Apache/Tomcat_9.0/webapps/uat_appdocuments/data/";
	public String COMMON_DOC_UPLOAD = "C:/Program Files/Apache/Tomcat_9.0/webapps/uat_appdocuments/docs/";
	public String COMMON_DOC_FILE   = "https://ecn.sparkminda.in/uat_appdocuments/files/";
	public String COMMON_DOC_IMAGE = "C:\\Program Files\\Apache\\Tomcat_9.0\\webapps\\uat_appdocuments\\images\\";
	
	public String HTTP_HOST = "https://ecn.sparkminda.in/";
	public String START_URL = "https://ecn.sparkminda.in/uat_ecn/";
	
	public String SERVER_SCHEME = "https";
	public int SERVER_PORT = 443;
	public String SERVER_NAME = "ecn.sparkminda.in";
	
	public String UAT_MSG = "This is test URL. Data Updated at this URL will not be visible at production URL..";
	
	 /*
	 // Main Site 
	public boolean isLocalHost = false ;	
	public boolean isMailLocalHost = true ; 
	public boolean isUAT = false ;
	
	public String DB_HOST = "localhost";
    public String DB_PORT = "3306";
	public String DB      = "minda_org";
	public String DB_USER = "root";
	public String DB_PASS = "FGh%4#45ndF32";
			
	public String MINDA_DB = "minda_org";
	public String SUGGESTION_DB  = "suggestion_box";
		
	public String SERVER_SCHEME = "https";
	public int    SERVER_PORT = 443;
	public String SERVER_NAME = "code.sparkminda.in";
	
	public String APP_LOG_PATH = "";
	public String COMMON_DOC_DATA = "C:/Program Files/Apache/Tomcat_9.0/webapps/appdocuments/data/";
	public String COMMON_DOC_UPLOAD = "C:/Program Files/Apache/Tomcat_9.0/webapps/appdocuments/docs/";
	public String COMMON_DOC_FILE   = "https://ecn.sparkminda.in/appdocuments/files/";
	public String COMMON_DOC_IMAGE  = "C:\\Program Files\\Apache\\Tomcat_9.0\\webapps\\appdocuments\\images\\";
	
	public String HTTP_HOST = "https://code.sparkminda.in/";	
	public String START_URL = "https://code.sparkminda.in/travaldash/";
		
	public String UAT_MSG = "" ;
	 */
  }









