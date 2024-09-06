package com.nt.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
public class Courses implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private Integer cid;
	
	@NonNull
	@Column(length=50,unique = true)
	private String name;
	
	@NonNull
	@Column(length = 10)
	private String price;
	
	@Column(length = 150)
	private String pdfPath;
	
	@Column(length = 150)
	private  String photoPath;
	
	
	
	public Integer getCid() {
		return cid;
	}



	public void setCid(Integer cid) {
		this.cid = cid;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getPdfPath() {
		return pdfPath;
	}



	public void setPdfPath(String pdfPath) {
		this.pdfPath = pdfPath;
	}



	public String getPhotoPath() {
		return photoPath;
	}



	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Courses [cid=" + cid + ", name=" + name + ", price=" + price + "]";
	}
	

	
	
	
}
