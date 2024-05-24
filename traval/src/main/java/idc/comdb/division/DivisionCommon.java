package idc.comdb.division;

public interface DivisionCommon {
	

	// DB fields
	    public String TABLE_NAME = "prd_mst_production_division";
		public String ID = "ProdDivId";
		public String NAME = "ProdDivName";
		public String STATUS = "ProdDivStatus"; 
		
	// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "ProdDiv-";
		public String HASH_ABBR_DESC = "ProdDiv-Desc-";


}
