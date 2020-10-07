package com.auto.bo;


/**Vehicle Info  Class to set and get the Vehicle information Details 
 * 
 *
 */
public class Vehicle_Info {
	
	
	private String sellername="";
	private String address="";
	private String city="";
	private String province="";
	private String postalCode="";
	private String phone="";
	private String eMail="";
	private String v_make="";
	private String v_model="";
	private String v_year="";
	private String   v_kilometers="";
	private String v_features="";
	private String v_ownership="";

	/**
	 * 
	 */
	public Vehicle_Info()
	{
		
	}
	
	
	/**
	 * @param sellername to set
	 */
	
	public void setSellerName(String sellername) {
		this.sellername=sellername;
	}
	
	/**
	 * @return the sellername
	 */
	public String getSellerName() {
		
		return sellername;
	}
	/**
	 * @return the address
	 */
	
	
	
	public String getAddress() {
		return address;
	}


	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}


	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}


	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}


	/**
	 * @return the province
	 */
	public String getProvince() {
		return province;
	}


	/**
	 * @param state the state to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}


	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}


	/**
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}


	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}


	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}


	/**
	 * @return the eMail
	 */
	public String getEMail() {
		return eMail;
	}


	/**
	 * @param eMail the eMail to set
	 */
	public void setEMail(String eMail) {
		this.eMail = eMail;
	}


	/**
	 * @return the v_make
	 */
	public String getVMake() {
		return v_make;
	}


	/**
	 * @param v_male the v_make to set
	 */
	public void setVMake(String v_make) {
		this.v_make = v_make;
	}
	
	
	/**
	 * @return the v_year
	 */
	public String getVYear() {
		return v_year;
	}


	/**
	 * @param v_year the v_year to set
	 */
	public void setVYear(String v_year) {
		this.v_year = v_year;
	}
	
	/**
	 * @return the v_kilometers
	 */
	public String getVKM() {
		return v_kilometers;
	}


	/**
	 * @param v_kilometers the v_kilometers to set
	 */
	public void setVKM(String v_kilometers) {
		this.v_kilometers = v_kilometers;
	}
	
	
	/**
	 * @return the v_features
	 */
	public String getVFeatures() {
		return v_features;
	}


	/**
	 * @param v_features the v_features to set
	 */
	public void setVFeatures(String v_features) {
		this.v_features = v_features;
	}
	
	/**
	 * @return the v_ownership
	 */
	public String getVOwnership() {
		return v_ownership;
	}


	/**
	 * @param v_ownership the v_ownership to set
	 */
	public void setVOwnership(String v_ownership) {
		this.v_ownership = v_ownership;
	}


	/**
	 * @return the v_model
	 */
	public String getV_model() {
		return v_model;
	}


	/**
	 * @param v_model the v_model to set
	 */
	public void setV_model(String v_model) {
		this.v_model = v_model;
	}
	
	

}
