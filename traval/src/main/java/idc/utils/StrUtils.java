package idc.utils;

public class StrUtils {
	
	public String replaceAll(String inStr,String delimiter,String replaceWith) {
	
		
		if(inStr!=null) {
			if(inStr.contains("'")) {
			    inStr = inStr.replaceAll("'","''");
			}
			inStr = inStr.replaceAll(delimiter,replaceWith);
		}
		return inStr;
	}

}
