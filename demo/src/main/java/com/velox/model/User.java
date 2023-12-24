package com.velox.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int user_id;

	private String username;
	private String email;
	private String password;
	private String Birthday;
	private String Telephone;
	private String Gender;
	private String Country;
	private String vehicle;
	private String userrole;

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthday() {
		return Birthday;
	}

	public void setBirthday(String birthday) {
		Birthday = birthday;
	}

	public String getTelephone() {
		return Telephone;
	}

	public void setTelephone(String telephone) {
		Telephone = telephone;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getVehicle() {
		return vehicle;
	}

	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", Birthday=" + Birthday + ", Telephone=" + Telephone + ", Gender=" + Gender + ", Country=" + Country
				+ ", vehicle=" + vehicle + ", userrole=" + userrole + "]";
	}
}
