package idc.location.country;

public interface CountryCommon {
	
	public String TABLE_NAME = "prd_mst_country";
	public String TABLE_NAME_SEARCH = "prd_mst_country country";
	
	public String ID  = "CountryId";
	public String NAME = "CountryName";	
	public String STATUS = "CountryStatus";
	
	public String HASH_MAP_ID = ID+"-";
	
	public String QUERY_PARAM = "country."+ID+","+NAME+","+STATUS;


}
