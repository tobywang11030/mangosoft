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
 * XlUserinfoMore entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_userinfo_more", catalog = "ai_alice")
public class UserinfoMore implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User xlUser;
	private Integer child;
	private Integer distanceLove;
	private Integer lovePeopleType;
	private Integer psb;
	private Integer liveWithParents;
	private Integer charm;
	private String hobbies;
	private String personalType;

	// Constructors

	/** default constructor */
	public UserinfoMore() {
	}

	/** minimal constructor */
	public UserinfoMore(User xlUser) {
		this.xlUser = xlUser;
	}

	/** full constructor */
	public UserinfoMore(User xlUser, Integer child, Integer distanceLove,
			Integer lovePeopleType, Integer psb, Integer liveWithParents,
			Integer charm, String hobbies, String personalType) {
		this.xlUser = xlUser;
		this.child = child;
		this.distanceLove = distanceLove;
		this.lovePeopleType = lovePeopleType;
		this.psb = psb;
		this.liveWithParents = liveWithParents;
		this.charm = charm;
		this.hobbies = hobbies;
		this.personalType = personalType;
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

	@Column(name = "child")
	public Integer getChild() {
		return this.child;
	}

	public void setChild(Integer child) {
		this.child = child;
	}

	@Column(name = "distance_love")
	public Integer getDistanceLove() {
		return this.distanceLove;
	}

	public void setDistanceLove(Integer distanceLove) {
		this.distanceLove = distanceLove;
	}

	@Column(name = "love_people_type")
	public Integer getLovePeopleType() {
		return this.lovePeopleType;
	}

	public void setLovePeopleType(Integer lovePeopleType) {
		this.lovePeopleType = lovePeopleType;
	}

	@Column(name = "psb")
	public Integer getPsb() {
		return this.psb;
	}

	public void setPsb(Integer psb) {
		this.psb = psb;
	}

	@Column(name = "live_with_parents")
	public Integer getLiveWithParents() {
		return this.liveWithParents;
	}

	public void setLiveWithParents(Integer liveWithParents) {
		this.liveWithParents = liveWithParents;
	}

	@Column(name = "charm")
	public Integer getCharm() {
		return this.charm;
	}

	public void setCharm(Integer charm) {
		this.charm = charm;
	}

	@Column(name = "hobbies", length = 50)
	public String getHobbies() {
		return this.hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	@Column(name = "personal_type", length = 50)
	public String getPersonalType() {
		return this.personalType;
	}

	public void setPersonalType(String personalType) {
		this.personalType = personalType;
	}

}