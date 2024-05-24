package idc.comdb.doc;

public interface DocCommon {
	
	// DB fields
		public String TABLE_NAME = "doc_master";
		public String ID = "DocId";
		public String NAME = "DocName";
		public String STATUS = "DocStatus"; 
		
		// other commons
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "STATUS_ALL";
		
		public String HASH_ABBR = "Doc-";

}
