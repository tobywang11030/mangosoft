package com.mangosoft.vo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * XlPhoto entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_photo", catalog = "ai_alice")
public class Photo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User uid;
	private String src;
	public Photo(){
		
	}
	public Photo(Integer id, com.mangosoft.vo.User uid, String src) {
	
		this.id = id;
		this.setUid(uid);
		this.src = src;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	 @ManyToOne 
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}

	

}