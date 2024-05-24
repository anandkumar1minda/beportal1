package idc.comdb.bv;

public interface BvCommon {
	
	// DB fields
	public String TABLE_NAME = "prd_mst_bu_vertical";
	public String ID = "BvId";
	public String NAME = "BvName";
	public String STATUS = "BvStatus"; 
	
	// other commons
	
	public String STATUS_ACTIVE= "Active";
	public String STATUS_INACTIVE = "Inactive";
	public String STATUS_ALL = "STATUS_ALL";
	
	public String HASH_ABBR = ID+"-";

}
