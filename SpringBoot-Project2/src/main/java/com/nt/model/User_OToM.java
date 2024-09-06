package com.nt.model;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;


import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Satya")
public class User_OToM implements Serializable{
	
	@Id
	private Integer unid;
	
	@NonNull
	@Column(length=40)
    private String uname;
	
	@NonNull
	@Column(length = 40)
    private String umail;
	
	@NonNull
	@Column(length = 7)
    private String ugender;
	
	@NonNull
	@Column(length=10)
    private String uphone;
	
	
	@NonNull
	@Column(length=20)
	private String upassword;
	
	@Transient
	private String otp;

	@OneToMany(targetEntity = Books_MToO.class,cascade = CascadeType.ALL,mappedBy = "user")
	private Set<Books_MToO> books;
	

	
	
	public Integer getUnid() {
		return unid;
	}




	public void setUnid(Integer unid) {
		this.unid = unid;
	}




	public String getUname() {
		return uname;
	}




	public void setUname(String uname) {
		this.uname = uname;
	}




	public String getUmail() {
		return umail;
	}




	public void setUmail(String umail) {
		this.umail = umail;
	}




	public String getUgender() {
		return ugender;
	}




	public void setUgender(String ugender) {
		this.ugender = ugender;
	}




	public String getUphone() {
		return uphone;
	}




	public void setUphone(String uphone) {
		this.uphone = uphone;
	}




	public String getUpassword() {
		return upassword;
	}




	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}




	public String getOtp() {
		return otp;
	}




	public void setOtp(String otp) {
		this.otp = otp;
	}




	public Set<Books_MToO> getBooks() {
		return books;
	}




	public void setBooks(Set<Books_MToO> books) {
		this.books = books;
	}




	@Override
	public String toString() {
		return "User [uid=" + unid + ", uname=" + uname + ", umail=" + umail + ", ugender=" + ugender + ", uphone=" + uphone
				+ ", upassword=" + upassword + "]";
	}


}
