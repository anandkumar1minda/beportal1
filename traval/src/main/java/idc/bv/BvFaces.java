package idc.bv;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import idc.connection.ConnectionMaster;

public class BvFaces {
	
	public HashMap<String,String> getCommonHash(){		
		HashMap<String,String> hMap = new HashMap<String,String>();
		try{
			
			hMap.put("BV-1", "BV-1");
			hMap.put("BV-2", "BV-2");
			hMap.put("BV-3", "BV-3");
			hMap.put("BV-4", "BV-4");
			hMap.put("BV-5", "BV-5");
			
		}catch(Exception ex){
			System.out.println("Error in function idc.ecrn -> BvFaces -> getCommonHash :: "+ex.toString());
		}
		return hMap;
	}
	
	public ArrayList<BvMaster> getBvArrList(){
	
		ArrayList<BvMaster> bvArr = new ArrayList<BvMaster>();
		
		try {
		 Connection conn = new ConnectionMaster().getMindaConnection();
		 Statement st = conn.createStatement();
		 
		 String query = "SELECT bvId, bvName FROM b_vertical WHERE bv_Active='A' order by bvName desc";
		 ResultSet rs = st.executeQuery(query);
		 
		 while(rs.next()) {
			 BvMaster bvMaster = new BvMaster();			 
			 
			 bvMaster.setId(rs.getInt("bvId"));
			 bvMaster.setName(rs.getString("bvName"));
			 bvArr.add(bvMaster);
			 
		   }
		}
		catch(Exception ex) {
			System.out.println("Error in function idc.bv.BvFaces -> getBvArrList "+ex.toString());
		}
		return bvArr;
	}
	
 }



