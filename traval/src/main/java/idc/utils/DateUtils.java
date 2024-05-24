package idc.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtils {

	public String MySqlDate(String inputDate,String inputFormat) {
		
		String returnDate = inputDate;	
		
		try {
		if(inputFormat.equalsIgnoreCase("dd-mm-yyyy")){
			String inputFormatArr[] =  inputDate.split("-");
		//	System.out.println(inputFormatArr[2]+" , "+inputFormatArr[1]+" , "+inputFormatArr[0]);
			if(inputFormatArr.length>2) {
				returnDate = inputFormatArr[2]+"-"+inputFormatArr[1]+"-"+inputFormatArr[0];
			}		
		 }
		if(inputFormat.equalsIgnoreCase("dd/mm/yyyy")){
			String inputFormatArr[] =  inputDate.split("/");
			if(inputFormatArr.length>2) {
				returnDate = inputFormatArr[2]+"-"+inputFormatArr[1]+"-"+inputFormatArr[0];
			}		
		 }
		if(inputFormat.equalsIgnoreCase("mm-dd-yyyy")){
			String inputFormatArr[] =  inputDate.split("-");
			if(inputFormatArr.length>2) {
				returnDate = inputFormatArr[2]+"-"+inputFormatArr[0]+"-"+inputFormatArr[1];
			}		
		 }
		if(inputFormat.equalsIgnoreCase("mm/dd/yyyy")){
			String inputFormatArr[] =  inputDate.split("/");
			if(inputFormatArr.length>2) {
				returnDate = inputFormatArr[2]+"-"+inputFormatArr[0]+"-"+inputFormatArr[1];
			}		
		 }
		}catch(Exception ex){
			System.out.println("Error in function idc.utils -> DateUtils -> MySqlDate "+ex.toString());
		}
		return returnDate;
	}
	
	public String getNewDate(int addDay){
		
		String retrunStr = "";
		try {			
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, addDay);	
			
			SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy");	
			sdf.applyPattern("EEEE, d MMM yyyy");  			
		    retrunStr = sdf.format(cal.getTime());		    
	
		}catch(Exception ex){
			System.out.println("Error in function idc.utils -> DateUtils -> getNewDate "+ex.toString());
		}
		
		return retrunStr;
	}
	
	public String getDateFormatDDMMYY(String fieldName) {		
		return "if("+fieldName+" is null,'',if("+fieldName+"='2000-01-01','',date_format("+fieldName+",'%d-%m-%Y')))";
	}
	public String getDDMMYYwithTime(String fieldName) {		
		return "if("+fieldName+" is null,'',if("+fieldName+"='2000-01-01 00:00:00','',date_format("+fieldName+",'%d-%m-%Y %H:%i:%s')))";
	}
 }
