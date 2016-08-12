package com.mangosoft.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * XlUserinfoSelect entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_userinfo_select", catalog = "ai_alice")
public class UserinfoSelect implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User xlUser;
	private Integer ageSelect;
	private Integer ageSelectMax;
	private Integer heightSelect;
	private Integer heightSelectMax;
	private Integer eduSelect;
	private Integer incomSelect;
	private Integer location;

	// Constructors

	/** default constructor */
	public UserinfoSelect() {
	}

	/** minimal constructor */
	public UserinfoSelect(User xlUser) {
		this.xlUser = xlUser;
	}

	/** full constructor */
	public UserinfoSelect(User xlUser, Integer ageSelect,
			Integer ageSelectMax, Integer heightSelect,
			Integer heightSelectMax, Integer eduSelect, Integer incomSelect,
			Integer location) {
		this.xlUser = xlUser;
		this.ageSelect = ageSelect;
		this.ageSelectMax = ageSelectMax;
		this.heightSelect = heightSelect;
		this.heightSelectMax = heightSelectMax;
		this.eduSelect = eduSelect;
		this.incomSelect = incomSelect;
		this.location = location;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id", unique = true, nullable = false, insertable = false, updatable = false)
	public User getXlUser() {
		return this.xlUser;
	}

	public void setXlUser(User xlUser) {
		this.xlUser = xlUser;
	}

	@Column(name = "age_select")
	public Integer getAgeSelect() {
		return this.ageSelect;
	}

	public void setAgeSelect(Integer ageSelect) {
		this.ageSelect = ageSelect;
	}

	@Column(name = "age_select_max")
	public Integer getAgeSelectMax() {
		return this.ageSelectMax;
	}

	public void setAgeSelectMax(Integer ageSelectMax) {
		this.ageSelectMax = ageSelectMax;
	}

	@Column(name = "height_select")
	public Integer getHeightSelect() {
		return this.heightSelect;
	}

	public void setHeightSelect(Integer heightSelect) {
		this.heightSelect = heightSelect;
	}

	@Column(name = "height_select_max")
	public Integer getHeightSelectMax() {
		return this.heightSelectMax;
	}

	public void setHeightSelectMax(Integer heightSelectMax) {
		this.heightSelectMax = heightSelectMax;
	}

	@Column(name = "edu_select")
	public Integer getEduSelect() {
		return this.eduSelect;
	}

	public void setEduSelect(Integer eduSelect) {
		this.eduSelect = eduSelect;
	}

	@Column(name = "incom_select")
	public Integer getIncomSelect() {
		return this.incomSelect;
	}

	public void setIncomSelect(Integer incomSelect) {
		this.incomSelect = incomSelect;
	}

	@Column(name = "location")
	public Integer getLocation() {
		return this.location;
	}

	public void setLocation(Integer location) {
		this.location = location;
	}

}