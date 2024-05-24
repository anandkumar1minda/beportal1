package idc.comdb.phase;

public interface PhaseCommon {	

	// DB fields
	    
		public String TABLE_NAME = "prd_mst_dev_phase";
		public String ID = "PhaseId";
		public String NAME = "PhaseName";
		public String DESC = "PhaseDesc";
		public String STATUS = "PhaseStatus"; 
		
		
	// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "Phase-";
		public String HASH_ABBR_DESC = "Phase-Desc-";
		
 }


