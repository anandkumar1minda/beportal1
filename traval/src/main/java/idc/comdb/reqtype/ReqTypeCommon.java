package idc.comdb.reqtype;

public interface ReqTypeCommon {	

	// DB fields
		public String TABLE_NAME = "prd_mst_req_type";
		public String ID   = "ReqTypeId";
		public String NAME = "ReqTypeName";
		public String DESC = "ReqTypeDesc";
		public String STATUS = "ReqTypeStatus"; 	
		
	// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "ReqType-";
		public String HASH_ABBR_DESC = "ReqType-Desc-";

}
