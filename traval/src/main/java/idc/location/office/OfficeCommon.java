package idc.location.office;

public interface OfficeCommon {
	
	public String TABLE_NAME = "prd_mst_office";
	public String TABLE_NAME_SEARCH = "prd_mst_office office";
	
	public String ID  = "OfficeId";
	public String NAME = "OfficeName";	
	public String STATUS = "OfficeStatus";
	
	public String HASH_MAP_ID = ID+"-";
	
	public String QUERY_PARAM = "office."+ID+","+NAME+","+STATUS;

}
