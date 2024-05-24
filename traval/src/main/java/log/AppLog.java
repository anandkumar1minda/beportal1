package log;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import idc.common.AppDbCommon;

public class AppLog {
	
	 private static Logger log = Logger.getLogger(AppLog.class);
	 String log4jConfPath = AppDbCommon.APP_LOG_PATH;
	 
     public static void main(String args[]) {	  
		
    	 AppLog appLog = new AppLog();
    	 appLog.Log("Info Message!");  
	      
	    }

	 public void Log(String message) {	  
		 
		 PropertyConfigurator.configure(log4jConfPath);
		 
	      log.info("Info Message!");  
	      
	    }
	 
  }



