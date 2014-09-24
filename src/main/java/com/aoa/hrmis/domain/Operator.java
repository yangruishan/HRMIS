package com.aoa.hrmis.domain;

import java.io.Serializable;

public class Operator extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5250150841410314391L;
	
	private String account;
	private String password;
	private Integer employeeID;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(Integer empID) {
		this.employeeID = empID;
	}

	@Override
	public String toString() {
		return "Operator [id=" + id + ", account=" + account + ", password=" + password + "]";
	}

}