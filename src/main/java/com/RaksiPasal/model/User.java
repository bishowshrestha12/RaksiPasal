package com.RaksiPasal.model;

public class User {
	private String email;
	private String firstname;
	private String lastname;
	private String dob;
	private String password;

	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public User(String email, String firstname, String lastname, String dob, String password) {
		this.email = email;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
