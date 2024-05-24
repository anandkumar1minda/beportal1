package idc.connection;

import java.sql.Connection;

public class ConnectionMaster {

	@SuppressWarnings("unused")
	private Connection mindaConnection;
	
	public Connection getMindaConnection() {
		return new ConnectionObj().mindaMysqlConnect();
	}
	
	public void closeConnections() {
		try {
			
			
		}catch(Exception ex){
			System.out.println("Error in function idc.connection -> ConnectionMaster -> closeConnections "+ex.toString());
		}
	}
}
