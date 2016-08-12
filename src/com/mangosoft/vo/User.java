package com.mangosoft.vo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * XlUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_user", catalog = "ai_alice")
public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String userOpenid;
	private String name;
	private Integer sex;
	private Integer age;
	private String photo;
	private String locationWeidu;
	private String locationJingdu;
	private Integer locationJd;
	private Integer userType;
	private Integer authTypePhone;
	private Integer authTypePeople;
	private String heartSay;
	private Integer onlineFlag;
	private Integer isweixinuser;
	private Timestamp logintime;
	private Userinfo userinfo ;
	private UserinfoMore userinfoMore ;
	private UserinfoSelect userinfoSelect;
	private List<PeopleChar> peopleCharList;
	private List<Interest> interestList;

	 @Transient
	public List<PeopleChar> getPeopleCharList() {
		return peopleCharList;
	}




	public void setPeopleCharList(List<PeopleChar> peopleCharList) {
		this.peopleCharList = peopleCharList;
	}







	private Set<Photo> xlPhotos = new HashSet<Photo>(0);
	

	// Constructors

	/** default constructor */
	public User() {
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

	@Column(name = "user_openid", length = 50)
	public String getUserOpenid() {
		return this.userOpenid;
	}

	public void setUserOpenid(String userOpenid) {
		this.userOpenid = userOpenid;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "age")
	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "photo")
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "location_weidu")
	public String getLocationWeidu() {
		return this.locationWeidu;
	}

	public void setLocationWeidu(String locationWeidu) {
		this.locationWeidu = locationWeidu;
	}

	@Column(name = "location_jingdu")
	public String getLocationJingdu() {
		return this.locationJingdu;
	}

	public void setLocationJingdu(String locationJingdu) {
		this.locationJingdu = locationJingdu;
	}

	@Column(name = "location_jd")
	public Integer getLocationJd() {
		return this.locationJd;
	}

	public void setLocationJd(Integer locationJd) {
		this.locationJd = locationJd;
	}

	@Column(name = "user_type")
	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	@Column(name = "auth_type_phone")
	public Integer getAuthTypePhone() {
		return this.authTypePhone;
	}

	public void setAuthTypePhone(Integer authTypePhone) {
		this.authTypePhone = authTypePhone;
	}

	@Column(name = "auth_type_people")
	public Integer getAuthTypePeople() {
		return this.authTypePeople;
	}

	public void setAuthTypePeople(Integer authTypePeople) {
		this.authTypePeople = authTypePeople;
	}

	@Column(name = "heart_say")
	public String getHeartSay() {
		return this.heartSay;
	}

	public void setHeartSay(String heartSay) {
		this.heartSay = heartSay;
	}

	@Column(name = "onlineFlag")
	public Integer getOnlineFlag() {
		return this.onlineFlag;
	}

	public void setOnlineFlag(Integer onlineFlag) {
		this.onlineFlag = onlineFlag;
	}

	@Column(name = "isweixinuser")
	public Integer getIsweixinuser() {
		return this.isweixinuser;
	}

	public void setIsweixinuser(Integer isweixinuser) {
		this.isweixinuser = isweixinuser;
	}

	@Column(name = "logintime", length = 19)
	public Timestamp getLogintime() {
		return this.logintime;
	}

	public void setLogintime(Timestamp logintime) {
		this.logintime = logintime;
	}

	

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "uid")
	@OrderBy("id")
	public Set<Photo> getXlPhotos() {
		return this.xlPhotos;
	}

	public void setXlPhotos(Set<Photo> xlPhotos) {
		this.xlPhotos = xlPhotos;
	}






	@OneToOne
    @JoinColumn(name="id")
	   public Userinfo getUserinfo() {
		return userinfo;
	}




	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}




	@OneToOne
    @JoinColumn(name="id")
	public UserinfoMore getUserinfoMore() {
		return userinfoMore;
	}




	public void setUserinfoMore(UserinfoMore userinfoMore) {
		this.userinfoMore = userinfoMore;
	}




	public User(Integer id, String userOpenid, String name, Integer sex,
			Integer age, String photo, String locationWeidu,
			String locationJingdu, Integer locationJd, Integer userType,
			Integer authTypePhone, Integer authTypePeople, String heartSay,
			Integer onlineFlag, Integer isweixinuser, Timestamp logintime,
			Userinfo userinfo, UserinfoMore userinfoMore,
			UserinfoSelect userinfoSelect, Set<Photo> xlPhotos) {
		super();
		this.id = id;
		this.userOpenid = userOpenid;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.photo = photo;
		this.locationWeidu = locationWeidu;
		this.locationJingdu = locationJingdu;
		this.locationJd = locationJd;
		this.userType = userType;
		this.authTypePhone = authTypePhone;
		this.authTypePeople = authTypePeople;
		this.heartSay = heartSay;
		this.onlineFlag = onlineFlag;
		this.isweixinuser = isweixinuser;
		this.logintime = logintime;
		this.userinfo = userinfo;
		this.userinfoMore = userinfoMore;
		this.userinfoSelect = userinfoSelect;
		this.xlPhotos = xlPhotos;
	}



	@OneToOne
    @JoinColumn(name="id")
	public UserinfoSelect getUserinfoSelect() {
		return userinfoSelect;
	}




	public void setUserinfoSelect(UserinfoSelect userinfoSelect) {
		this.userinfoSelect = userinfoSelect;
	}



	 @Transient
	public List<Interest> getInterestList() {
		return interestList;
	}




	public void setInterestList(List<Interest> interestList) {
		this.interestList = interestList;
	}



}