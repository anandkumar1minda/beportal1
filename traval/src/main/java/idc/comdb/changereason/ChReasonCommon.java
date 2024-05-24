package idc.comdb.changereason;

public interface ChReasonCommon {
	

	// DB fields
	    
		public String TABLE_NAME = "prd_mst_change_reason";
		public String ID = "ChangeReasonId";
		public String NAME = "ChangeReasonName";
		public String DESC = "ChangeReasonStatus";
		public String STATUS = "ChangeReasonStatus";
		public String SEQ = "ChangeReasonSeq";
		
		
	// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "ChReason-";
		public String HASH_ABBR_DESC = "ChReason-Desc-";

}
