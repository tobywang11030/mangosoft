package com.mangosoft.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.Region.RegionDao;
import com.mangosoft.service.RegionService;
import com.mangosoft.vo.Region;
import com.mangosoft.vo.User;
@Service
public class RegionServiceImpl implements RegionService {
    private RegionDao regionDao;
    @Resource(type=RegionDao.class)
    public void setRegionDao(RegionDao regionDao){
    	this.regionDao = regionDao;
    }
	@Override
	public List<Region> getRegion_pro() {
		// TODO Auto-generated method stub
		String hql = "from Region where parentId = 1";
		return regionDao.findTbyHql(hql);
	}
	@Override
	public List<Region> getRegion_city(String pid) {
		// TODO Auto-generated method stub
		String hql = "from Region where parentId = "+pid;
		return regionDao.findTbyHql(hql);
	}
	@Override
	public Region getRegion(User user) {
		// TODO Auto-generated method stub
		Region r = new Region();
		String hql = "from Region where regionId = "+user.getUserinfo().getLocationProvince()+" and parentId=1";
		List<Region> list = regionDao.findTbyHql(hql);
		if(list!=null && list.size()>0){
			r = list.get(0);
		}
		return r;
	}
	@Override
	public Region getMatchRegion(User user) {
		// TODO Auto-generated method stub
		Region r = new Region();
		String hql = "from Region where regionId = "+user.getUserinfoSelect().getLocation()+" and parentId=1";
		List<Region> list = regionDao.findTbyHql(hql);
		if(list!=null && list.size()>0){
			r = list.get(0);
		}
		return r;
	}

}
