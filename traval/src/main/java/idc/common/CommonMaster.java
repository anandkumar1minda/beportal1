package idc.common;

import ecrn.appcommon.EcrnDbCommon;

public class CommonMaster {
	
	public String getUatMsg(){
		return AppDbCommon.UAT_MSG;
	}
	
	public String getPageTitle() {
		return AppCommon.PAGE_TITLE;
	}
	
	public String getStartURL() {
		return EcrnDbCommon.ECRN_MAIN_FOLDER;
	}
	
	public String getStartUploadURL() {
		return AppDbCommon.COMMON_DOC_UPLOAD;
	}
	
	public String getStartFileURL() {
		return AppDbCommon.COMMON_DOC_FILE;
	}
	
	public String getHttpHost() {
		return AppDbCommon.HTTP_HOST;
	}
	
	public String getServerScheme() {
		return AppDbCommon.SERVER_SCHEME;
	}
	
    public int getServerPort() {
		return AppDbCommon.SERVER_PORT;
	}
    
    public String getServerName() {
    	return AppDbCommon.SERVER_NAME;
    }

}
