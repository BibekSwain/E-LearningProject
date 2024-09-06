package com.nt.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CourseDetails implements Serializable{

	private Integer id;
	private String  name;
	private  String  price;
	private MultipartFile photoContent;
	private MultipartFile pdfContent;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public MultipartFile getPhotoContent() {
		return photoContent;
	}
	public void setPhotoContent(MultipartFile photoContent) {
		this.photoContent = photoContent;
	}
	public MultipartFile getPdfContent() {
		return pdfContent;
	}
	public void setPdfContent(MultipartFile pdfContent) {
		this.pdfContent = pdfContent;
	}
	
	
}
