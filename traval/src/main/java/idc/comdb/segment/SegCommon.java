package idc.comdb.segment;

public interface SegCommon {
	
	// DB fields
	    public String TABLE_NAME = "prd_mst_segment";
		public String ID = "SegmentId";
		public String NAME = "SegmentName";
		public String STATUS = "SegmentStatus"; 
		
		// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "Seg-";
		public String HASH_ABBR_DESC = "Seg-Desc-";
 
 }
