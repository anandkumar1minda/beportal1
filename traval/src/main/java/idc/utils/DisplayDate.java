package idc.utils;

public class DisplayDate {
	
	public String getDDMMYYFormat(String mysqlDate) {
		
		String returnDate = mysqlDate;
		try {
		
		if(mysqlDate.contains("2000-01-01")) {
			returnDate = "";
		}
		else if(mysqlDate.contains("-")){
			
		 String dateTime[] = mysqlDate.split(" ");
		 if(dateTime.length==2) {
		 String mysqlArr[] = dateTime[0].split("-");
		 if(mysqlArr.length==3) {
			 returnDate = mysqlArr[2]+"-"+ mysqlArr[1]+"-"+ mysqlArr[0];
		   }
		 returnDate = returnDate+" "+dateTime[0];
		 }
		 else {
			 String mysqlArr[] = dateTime[0].split("-");
			 if(mysqlArr.length==3) {
				 returnDate = mysqlArr[2]+"-"+ mysqlArr[1]+"-"+ mysqlArr[0];
			  }	 
		    }		 
		  }			
		}
		catch(Exception ex) {
		  System.out.println("Error in function "+this.getClass().getName()+". getLocalDateFormat "+ex.toString());
		}
		return returnDate;
	}
}
