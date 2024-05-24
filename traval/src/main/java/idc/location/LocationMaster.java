package idc.location;

import java.util.ArrayList;
import idc.location.city.CityMaster;
import idc.location.country.CountryMaster;
import idc.location.office.OfficeMaster;
import idc.location.state.StateMaster;

public class LocationMaster {
	
	 private CountryMaster countryMaster;
	 private CityMaster cityMaster;
	 private OfficeMaster officeMaster;
	 private StateMaster stateMaster;
	 
	 private ArrayList<CountryMaster> countryMasterList;
	 private ArrayList<CityMaster> cityMasterList;
	 private ArrayList<OfficeMaster> officeMasterList;
	 private ArrayList<StateMaster> stateMasterList;
	 
	 public CountryMaster getCountryMaster() {
			return countryMaster;
		}
		public void setCountryMaster(CountryMaster countryMaster) {
			this.countryMaster = countryMaster;
		}
		public CityMaster getCityMaster() {
			return cityMaster;
		}
		public void setCityMaster(CityMaster cityMaster) {
			this.cityMaster = cityMaster;
		}
		public OfficeMaster getOfficeMaster() {
			return officeMaster;
		}
		public void setOfficeMaster(OfficeMaster officeMaster) {
			this.officeMaster = officeMaster;
		}
		
		public StateMaster getStateMaster() {
			return stateMaster;
		}
		public void setStateMaster(StateMaster stateMaster) {
			this.stateMaster = stateMaster;
		}
		public ArrayList<CountryMaster> getCountryMasterList() {
			return countryMasterList;
		}
		public void setCountryMasterList(ArrayList<CountryMaster> countryMasterList) {
			this.countryMasterList = countryMasterList;
		}
		public ArrayList<CityMaster> getCityMasterList() {
			return cityMasterList;
		}
		public void setCityMasterList(ArrayList<CityMaster> cityMasterList) {
			this.cityMasterList = cityMasterList;
		}
		public ArrayList<OfficeMaster> getOfficeMasterList() {
			return officeMasterList;
		}
		public void setOfficeMasterList(ArrayList<OfficeMaster> officeMasterList) {
			this.officeMasterList = officeMasterList;
		}
		public ArrayList<StateMaster> getStateMasterList() {
			return stateMasterList;
		}
		public void setStateMasterList(ArrayList<StateMaster> stateMasterList) {
			this.stateMasterList = stateMasterList;
		}
		
   }


