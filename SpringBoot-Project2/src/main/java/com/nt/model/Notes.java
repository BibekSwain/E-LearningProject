package com.nt.model;

import java.io.Serializable;
import java.util.Base64;

import io.micrometer.common.lang.NonNull;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="NOTES")
@Getter
@Setter
public class Notes implements Serializable{

	@Id
	private Integer vid;
	
	@NonNull
	private String name;
	
	@NonNull
	private String price;
	
	@Lob
	private byte[] photo;
	
	@Lob
	private byte[] fileNotes;
	
	@Transient
	private String base64Image;

	public Integer getVid() {
		return vid;
	}

	public void setVid(Integer vid) {
		this.vid = vid;
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

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public byte[] getFileNotes() {
		return fileNotes;
	}

	public void setFileNotes(byte[] fileNotes) {
		this.fileNotes = fileNotes;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	
    
}
