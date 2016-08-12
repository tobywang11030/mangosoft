package com.mangosoft.dao.impl.region;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mangosoft.dao.Region.RegionDao;
import com.mangosoft.dao.impl.base.GenericDaoImpl;
import com.mangosoft.vo.Region;
@Repository
public class RegionDaoImpl extends GenericDaoImpl<Region> implements RegionDao {

	@Override
	public Double getProvinceId(String province) {
		// TODO Auto-generated method stub
		String hql="from Region where regionName like '%"+province+"%'";
		List<Region> r = new ArrayList<Region>();
		r = this.findTbyHql(hql);
		if(r.size()>0){
			return r.get(0).getRegionId();
		}else{
			return null;
		}
	}

	@Override
	public Double getCityId(String city, Double provinceId) {
		// TODO Auto-generated method stub
		String hql = "from Region where regionName like '%"+city+"%' and parentId = "+provinceId;
		List<Region> r = new ArrayList<Region>();
		r = this.findTbyHql(hql);
		if(r.size()>0){
			return r.get(0).getRegionId();
		}else{
			return null;
		}
	}

}
