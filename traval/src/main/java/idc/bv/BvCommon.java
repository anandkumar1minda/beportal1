package idc.bv;

import java.util.ArrayList;

public class BvCommon {

	public ArrayList<BvMaster> getBvArr(){
		
		ArrayList<BvMaster> bvArr = new ArrayList<BvMaster>();
		try {
			
			BvMaster bvMaster = new BvMaster();
			bvMaster.setId(1);
			bvMaster.setName("BV-1");
			bvArr.add(bvMaster);
			
			bvMaster = new BvMaster();
			bvMaster.setId(2);
			bvMaster.setName("BV-2");
			bvArr.add(bvMaster);
			
			bvMaster = new BvMaster();
			bvMaster.setId(3);
			bvMaster.setName("BV-3");
			bvArr.add(bvMaster);
			
			bvMaster = new BvMaster();
			bvMaster.setId(4);
			bvMaster.setName("BV-4");
			bvArr.add(bvMaster);
			
			bvMaster = new BvMaster();
			bvMaster.setId(5);
			bvMaster.setName("BV-5");
			bvArr.add(bvMaster);			
			
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		return bvArr;
	}
	
 public ArrayList<ProDivMaster> getProDivisionArr(){
		
		ArrayList<ProDivMaster> pdArr = new ArrayList<ProDivMaster>();
		try {
			
			ProDivMaster master = new ProDivMaster();
			master.setId(1);
			master.setName("Clustor");
			pdArr.add(master);
			
			master = new ProDivMaster();
			master.setId(2);
			master.setName("EV");
			pdArr.add(master);
			
			master = new ProDivMaster();
			master.setId(3);
			master.setName("EME");
			pdArr.add(master);
			
			master = new ProDivMaster();
			master.setId(4);
			master.setName("INFAC");
			pdArr.add(master);
			
			master = new ProDivMaster();
			master.setId(5);
			master.setName("Sensor");
			pdArr.add(master);
			
			master = new ProDivMaster();
			master.setId(6);
			master.setName("SMGM");
			pdArr.add(master);
						
			
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
		return pdArr;
	}
	
	
}
