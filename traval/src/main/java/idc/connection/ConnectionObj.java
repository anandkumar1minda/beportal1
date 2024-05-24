package idc.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import idc.common.AppDbCommon;

public class ConnectionObj {
	
		public Connection mindaMysqlConnect(){  
			
			Connection connection = null;
			try{  
			Class.forName("com.mysql.cj.jdbc.Driver");		
			
			connection = DriverManager.getConnection("jdbc:mysql://"+AppDbCommon.DB_HOST+":"+AppDbCommon.DB_PORT+"/"+AppDbCommon.DB,AppDbCommon.DB_USER,AppDbCommon.DB_PASS); 
			
			}
			catch(Exception e){
			System.out.println(e);
			}
			
		      return connection;
	    }
   }
