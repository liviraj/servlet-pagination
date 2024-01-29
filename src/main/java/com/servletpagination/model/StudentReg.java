package com.servletpagination.model;

import java.sql.Date;

public class StudentReg {
	private int regId;
	private String name;
	private String mobileNo;
	private String emailId;
	private String gender;
	private Date dob;
	private String address;
	private String department;

	// Default constructor
	public StudentReg() {
	}

	public int getRegId() {
		return regId;
	}

	public void setRegId(int regId) {
		this.regId = regId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "StudentReg [regId=" + regId + ", name=" + name + ", mobileNo=" + mobileNo + ", emailId=" + emailId
				+ ", gender=" + gender + ", dob=" + dob + ", address=" + address + ", department=" + department + "]";
	}

}
