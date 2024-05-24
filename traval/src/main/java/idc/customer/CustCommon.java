package idc.customer;

public interface CustCommon {
	
	// DB fields
				public String TABLE_NAME = "prd_mst_customer";
				public String ID = "CustomerId"; 
				public String SAP_ID = "CustomerSapId";
				public String ABBR = "CustomerAbbr";
				public String NAME = "CustomerName";
				public String CAT  = "CustCategory";
				public String SUBCAT = "CustSubCategory";
				public String STATUS = "CustomerStatus"; 
				
   // other commons
				
				public String STATUS_ACTIVE= "Active";
				public String STATUS_INACTIVE = "Inactive";
				public String STATUS_ALL = "STATUS_ALL";
				
				public String HASH_ABBR = "CustId-";
				public String HASH_ABBR_ABBR = "CustId-Abbr-";
				

}
