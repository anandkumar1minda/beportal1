package idc.comdb.department;

public interface DeptCommon {
	

	// DB fields
	    public String TABLE_NAME = "prd_mst_department";
		public String ID = "DepartmentId";
		public String NAME = "DepartmentName";
		public String STATUS = "DepartmentStatus"; 
		
   // other commons		
		
		public String STATUS_ACTIVE= "Active";
		public String STATUS_INACTIVE = "Inactive";
		public String STATUS_ALL = "ALL";
		
		public String HASH_ABBR = "Dept-";
		public String HASH_ABBR_DESC = "Dept-Desc-";

}
