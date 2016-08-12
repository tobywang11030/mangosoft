package com.mangosoft.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.heartsay.HeartSayDao;
import com.mangosoft.service.HeartSayService;
import com.mangosoft.vo.Heartsay;
import com.mangosoft.vo.User;
@Service
public class HeartSayServiceImpl implements HeartSayService {
    private HeartSayDao heartSayDao;
    
	@Override
	public List<Heartsay> getXlHeartsayList(User user) {
		// TODO Auto-generated method stub
		return heartSayDao.findTbyHql("from Heartsay where sex ="+user.getSex());
	}

@Resource(type = HeartSayDao.class)
	public void setHeartSayDao(HeartSayDao heartSayDao) {
		this.heartSayDao = heartSayDao;
	}

}
