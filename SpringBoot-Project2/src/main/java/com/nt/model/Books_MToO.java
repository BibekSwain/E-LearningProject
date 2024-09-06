package com.nt.model;

import java.io.Serializable;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
public class Books_MToO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer bookid;
	
	
	private Integer bid;
	
	@NonNull
	private String bname;
	
	@NonNull
	@Column(length = 10)
	private String bprice;
	
	@ManyToOne(targetEntity=User_OToM.class,cascade=CascadeType.ALL)
	@JoinColumn(name="Use_Id",referencedColumnName = "UNID") 
	private User_OToM user;

	
	public Integer getBookid() {
		return bookid;
	}


	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}


	public Integer getBid() {
		return bid;
	}


	public void setBid(Integer bid) {
		this.bid = bid;
	}


	public String getBname() {
		return bname;
	}


	public void setBname(String bname) {
		this.bname = bname;
	}


	public String getBprice() {
		return bprice;
	}


	public void setBprice(String bprice) {
		this.bprice = bprice;
	}


	public User_OToM getUser() {
		return user;
	}


	public void setUser(User_OToM user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "Courses [bid=" + bid + ", bname=" + bname + ", bprice=" + bprice + "]";
	}
}
