package com.nt.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Transient;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@EqualsAndHashCode
@RequiredArgsConstructor
@NoArgsConstructor
public class Person implements Serializable {

	
	private static final long serialVersionUID = 1L;
	@Id
	@SequenceGenerator(name="gen1",sequenceName ="Person_Seq",initialValue = 1,allocationSize = 1 )
	@GeneratedValue(generator = "gen1",strategy = GenerationType.SEQUENCE)
	private Integer pid;
	
	@NonNull
	@Column(length=40)
    private String name;
	
	@NonNull
	@Column(length = 40)
    private String mail;
	
	@NonNull
	@Column(length = 7)
    private String gender;
	
	@NonNull
	@Column(length=10)
    private String phone;
	
	
	@NonNull
	@Column(length=20)
	private String password;
	
	@Transient
	private String otp;

	

	public Integer getPid() {
		return pid;
	}



	public void setPid(Integer pid) {
		this.pid = pid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getMail() {
		return mail;
	}



	public void setMail(String mail) {
		this.mail = mail;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getOtp() {
		return otp;
	}



	public void setOtp(String otp) {
		this.otp = otp;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Person [pid=" + pid + ", name=" + name + ", mail=" + mail + ", gender=" + gender + ", phone=" + phone
				+ ", password=" + password + "]";
	}

	
	
}
