package com.mangosoft.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * XlHeartsay entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_heartsay", catalog = "ai_alice")
public class Heartsay implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer sex;
	private String content;

	// Constructors

	/** default constructor */
	public Heartsay() {
	}

	/** minimal constructor */
	public Heartsay(Integer sex) {
		this.sex = sex;
	}

	/** full constructor */
	public Heartsay(Integer sex, String content) {
		this.sex = sex;
		this.content = content;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "sex", nullable = false)
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "content", length = 50)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}