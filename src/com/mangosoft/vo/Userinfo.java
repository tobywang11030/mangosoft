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
 * XlUserinfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_userinfo", catalog = "ai_alice")
public class Userinfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User xlUser;
	private String VName;
	private Integer birthdayYear;
	private Integer birthdayMonth;
	private Integer birthdayDay;
	private String locationProvince;
	private String locationCity;
	private String locationArea;
	private String locationStreet;
	private String height;
	private String weight;
	private String bloodType;
	private Integer education;
	private Integer work;
	private Integer income;
	private Integer maritalstatus;
	private Integer horse;

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(User xlUser) {
		this.xlUser = xlUser;
	}

	/** full constructor */
	public Userinfo(User xlUser, String VName, Integer birthdayYear,
			Integer birthdayMonth, Integer birthdayDay,
			String locationProvince, String locationCity, String locationArea,
			String locationStreet, String height, String weight,
			String bloodType, Integer education, Integer work, Integer income,
			Integer maritalstatus, Integer horse) {
		this.xlUser = xlUser;
		this.VName = VName;
		this.birthdayYear = birthdayYear;
		this.birthdayMonth = birthdayMonth;
		this.birthdayDay = birthdayDay;
		this.locationProvince = locationProvince;
		this.locationCity = locationCity;
		this.locationArea = locationArea;
		this.locationStreet = locationStreet;
		this.height = height;
		this.weight = weight;
		this.bloodType = bloodType;
		this.education = education;
		this.work = work;
		this.income = income;
		this.maritalstatus = maritalstatus;
		this.horse = horse;
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

	@Column(name = "v_name", length = 50)
	public String getVName() {
		return this.VName;
	}

	public void setVName(String VName) {
		this.VName = VName;
	}

	@Column(name = "birthday_year")
	public Integer getBirthdayYear() {
		return this.birthdayYear;
	}

	public void setBirthdayYear(Integer birthdayYear) {
		this.birthdayYear = birthdayYear;
	}

	@Column(name = "birthday_month")
	public Integer getBirthdayMonth() {
		return this.birthdayMonth;
	}

	public void setBirthdayMonth(Integer birthdayMonth) {
		this.birthdayMonth = birthdayMonth;
	}

	@Column(name = "birthday_day")
	public Integer getBirthdayDay() {
		return this.birthdayDay;
	}

	public void setBirthdayDay(Integer birthdayDay) {
		this.birthdayDay = birthdayDay;
	}

	@Column(name = "location_province", length = 50)
	public String getLocationProvince() {
		return this.locationProvince;
	}

	public void setLocationProvince(String locationProvince) {
		this.locationProvince = locationProvince;
	}

	@Column(name = "location_city", length = 50)
	public String getLocationCity() {
		return this.locationCity;
	}

	public void setLocationCity(String locationCity) {
		this.locationCity = locationCity;
	}

	@Column(name = "location_area", length = 50)
	public String getLocationArea() {
		return this.locationArea;
	}

	public void setLocationArea(String locationArea) {
		this.locationArea = locationArea;
	}

	@Column(name = "location_street", length = 50)
	public String getLocationStreet() {
		return this.locationStreet;
	}

	public void setLocationStreet(String locationStreet) {
		this.locationStreet = locationStreet;
	}

	@Column(name = "height", length = 10)
	public String getHeight() {
		return this.height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	@Column(name = "weight", length = 10)
	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	@Column(name = "blood_type", length = 10)
	public String getBloodType() {
		return this.bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	@Column(name = "education")
	public Integer getEducation() {
		return this.education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	@Column(name = "work")
	public Integer getWork() {
		return this.work;
	}

	public void setWork(Integer work) {
		this.work = work;
	}

	@Column(name = "income")
	public Integer getIncome() {
		return this.income;
	}

	public void setIncome(Integer income) {
		this.income = income;
	}

	@Column(name = "maritalstatus")
	public Integer getMaritalstatus() {
		return this.maritalstatus;
	}

	public void setMaritalstatus(Integer maritalstatus) {
		this.maritalstatus = maritalstatus;
	}

	@Column(name = "horse")
	public Integer getHorse() {
		return this.horse;
	}

	public void setHorse(Integer horse) {
		this.horse = horse;
	}

}