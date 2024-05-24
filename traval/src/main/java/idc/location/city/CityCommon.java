package idc.location.city;

public interface CityCommon {
	
	public String TABLE_NAME = "prd_mst_city";
	public String TABLE_NAME_SEARCH = "prd_mst_city city";
	
	public String ID  = "CityId";
	public String NAME = "CityName";	
	public String STATUS = "CityStatus";
	
	public String HASH_MAP_ID = ID+"-";
	
	public String QUERY_PARAM = "city."+ID+","+NAME+","+STATUS;

}
