 package idc.utils;

 import java.sql.ResultSet;
 import java.sql.Statement;

 public class MysqlFuns {
	
    Statement st;
    
	public MysqlFuns() {}
	public MysqlFuns(Statement st) {
		this.st = st;
	}
	
	public int getLastInsertedId() {
		int returnInt = 0;
		try {
		
		ResultSet rs = this.st.executeQuery("SELECT LAST_INSERT_ID()");			  
		  
		 if(rs.next()){
		    	 returnInt = rs.getInt(1);
		   }
		 
		}catch(Exception ex) {
			  System.out.println("Error in function "+this.getClass().getName()+".getLastInsertedId: "+ex.toString());	
		}
		return returnInt;
	}

}
