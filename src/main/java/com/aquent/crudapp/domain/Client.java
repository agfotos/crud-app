package com.aquent.crudapp.domain;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

public class Client {

	private Integer clientId;

    @NotNull
    @Size(min = 1, max = 50, message = "Company Name is required with maximum length of 50")
    private String companyName;

    @NotNull
    @Size(min = 1, max = 50, message = "Website is required with maximum length of 50")
    @Pattern(regexp="^(http://|https://)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}.?([a-z]+)?$",
    message="Invalid format for website")
    private String website;

    @NotNull
    @Size(min = 10, max = 12, message = "Phone Number is required")
    @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$",
    message="Invalid format for phone number")
    private String phone;

    @NotNull
    @Size(min = 1, max = 50, message = "Physical Street address is required with maximum length of 50")
    private String pStreetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "Physical City is required with maximum length of 50")
    private String pCity;

    @NotNull
    @Size(min = 2, max = 2, message = "Physical State is required with length 2")
    private String pState;

    @NotNull
    @Size(min = 5, max = 5, message = "Physical Zip code is required with length 5")
    private String pZipCode;
    
    @NotNull
    @Size(min = 1, max = 50, message = "Mailing Street address is required with maximum length of 50")
    private String mStreetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "Mailing City is required with maximum length of 50")
    private String mCity;

    @NotNull
    @Size(min = 2, max = 2, message = "Mailing State is required with length 2")
    private String mState;

    @NotNull
    @Size(min = 5, max = 5, message = "Mailing Zip code is required with length 5")
    private String mZipCode;
    
    
    private List<Person> contacts = new ArrayList<Person>();;
    

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public String getpStreetAddress() {
		return pStreetAddress;
	}

	public void setpStreetAddress(String pStreetAddress) {
		this.pStreetAddress = pStreetAddress;
	}

	public String getpCity() {
		return pCity;
	}

	public void setpCity(String pCity) {
		this.pCity = pCity;
	}

	public String getpState() {
		return pState;
	}

	public void setpState(String pState) {
		this.pState = pState;
	}

	public String getpZipCode() {
		return pZipCode;
	}

	public void setpZipCode(String pZipCode) {
		this.pZipCode = pZipCode;
	}

	public String getmStreetAddress() {
		return mStreetAddress;
	}

	public void setmStreetAddress(String mStreetAddress) {
		this.mStreetAddress = mStreetAddress;
	}

	public String getmCity() {
		return mCity;
	}

	public void setmCity(String mCity) {
		this.mCity = mCity;
	}

	public String getmState() {
		return mState;
	}

	public void setmState(String mState) {
		this.mState = mState;
	}

	public String getmZipCode() {
		return mZipCode;
	}

	public void setmZipCode(String mZipCode) {
		this.mZipCode = mZipCode;
	}

	public List<Person> getContacts() {
		return contacts;
	}
	
	public void setContacts(List<Person> contacts){
		this.contacts = contacts;
	}

	public void addContact(Person person) {
		this.contacts.add(person);
	}
    
}
