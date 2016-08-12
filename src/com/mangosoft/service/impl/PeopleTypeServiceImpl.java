package com.mangosoft.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.peopletype.PeopleTypeDao;
import com.mangosoft.service.PeopleTypeService;
import com.mangosoft.vo.PeopleType;
import com.mangosoft.vo.User;
@Service
public class PeopleTypeServiceImpl implements PeopleTypeService {
     private PeopleTypeDao peopleTypeDao;
     @Resource(type = PeopleTypeDao.class)
     public void setPeopleTypeDao(PeopleTypeDao peopleTypeDao){
    	 this.peopleTypeDao = peopleTypeDao;
     }
	@Override
	public List<PeopleType> getPeopleType(User user) {
		// TODO Auto-generated method stub
		return peopleTypeDao.findTbyHql("from PeopleType where sex <> "+user.getSex());
	}

}
