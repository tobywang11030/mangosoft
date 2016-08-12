package com.mangosoft.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Region entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "region", catalog = "ai_alice")
public class Region implements java.io.Serializable {

 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Double regionId;
	private String regionCode;
	private String regionName;
	private Double parentId;
	private Double regionLevel;
	private Double regionOrder;
	private String regionNameEn;
	private String regionShortnameEn;

	// Constructors

	/** default constructor */
	public Region() {
	}

	/** full constructor */
	public Region(Double regionId, String regionCode, String regionName,
			Double parentId, Double regionLevel, Double regionOrder,
			String regionNameEn, String regionShortnameEn) {
		this.regionId = regionId;
		this.regionCode = regionCode;
		this.regionName = regionName;
		this.parentId = parentId;
		this.regionLevel = regionLevel;
		this.regionOrder = regionOrder;
		this.regionNameEn = regionNameEn;
		this.regionShortnameEn = regionShortnameEn;
	}

	// Property accessors
	@Id
	@Column(name = "REGION_ID", unique = true, nullable = false, precision = 22, scale = 0)
	public Double getRegionId() {
		return this.regionId;
	}

	public void setRegionId(Double regionId) {
		this.regionId = regionId;
	}

	@Column(name = "REGION_CODE", nullable = false, length = 100)
	public String getRegionCode() {
		return this.regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	@Column(name = "REGION_NAME", nullable = false, length = 100)
	public String getRegionName() {
		return this.regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	@Column(name = "PARENT_ID", nullable = false, precision = 22, scale = 0)
	public Double getParentId() {
		return this.parentId;
	}

	public void setParentId(Double parentId) {
		this.parentId = parentId;
	}

	@Column(name = "REGION_LEVEL", nullable = false, precision = 22, scale = 0)
	public Double getRegionLevel() {
		return this.regionLevel;
	}

	public void setRegionLevel(Double regionLevel) {
		this.regionLevel = regionLevel;
	}

	@Column(name = "REGION_ORDER", nullable = false, precision = 22, scale = 0)
	public Double getRegionOrder() {
		return this.regionOrder;
	}

	public void setRegionOrder(Double regionOrder) {
		this.regionOrder = regionOrder;
	}

	@Column(name = "REGION_NAME_EN", nullable = false, length = 100)
	public String getRegionNameEn() {
		return this.regionNameEn;
	}

	public void setRegionNameEn(String regionNameEn) {
		this.regionNameEn = regionNameEn;
	}

	@Column(name = "REGION_SHORTNAME_EN", nullable = false, length = 10)
	public String getRegionShortnameEn() {
		return this.regionShortnameEn;
	}

	public void setRegionShortnameEn(String regionShortnameEn) {
		this.regionShortnameEn = regionShortnameEn;
	}

}