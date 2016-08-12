package com.mangosoft.dao.Region;

import com.mangosoft.dao.base.GenericDao;
import com.mangosoft.vo.Region;
public interface RegionDao extends GenericDao<Region>{
	 public Double getProvinceId(String province);
	 public Double getCityId(String city,Double provinceId);
}
