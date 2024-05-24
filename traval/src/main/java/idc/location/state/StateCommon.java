package idc.location.state;

public interface StateCommon {
	
	public String TABLE_NAME = "prd_mst_state";
	public String TABLE_NAME_SEARCH = "prd_mst_state state";
	
	public String ID  = "StateId";
	public String NAME = "StateName";	
	public String STATUS = "StateStatus";
	
	public String HASH_MAP_ID = ID+"-";
	
	public String QUERY_PARAM = "state."+ID+","+NAME+","+STATUS;

}
