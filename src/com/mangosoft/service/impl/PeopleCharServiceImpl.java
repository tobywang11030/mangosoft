package com.mangosoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.mangosoft.dao.peoplechar.PeopleCharDao;
import com.mangosoft.service.PeopleCharService;
import com.mangosoft.vo.PeopleChar;
import com.mangosoft.vo.User;
@Service
public class PeopleCharServiceImpl implements PeopleCharService {
    private PeopleCharDao peopleCharDao;
    @Resource(type = PeopleCharDao.class)
    public void setPeopleCharDao(PeopleCharDao peopleCharDao){
    	this.peopleCharDao = peopleCharDao;
    }
	@Override
	public List<PeopleChar> getPeopleChar(User user) {
		// TODO Auto-generated method stub
		return peopleCharDao.findTbyHql("from PeopleChar where sex <>"+user.getSex());
	}
	@Override
	public List<PeopleChar> getPeopleChar(String ids) {
		// TODO Auto-generated method stub
		List<PeopleChar> pc = new ArrayList<PeopleChar>();
		if(ids!=null && !ids.equals("")){
    		String[] idss = ids.split(",");
    		for (int i = 0; i < idss.length; i++) {
    		
    			List<PeopleChar>	xis =peopleCharDao.findTbyHql("from PeopleChar where id = "+idss[i]);
    			if(xis.size()>0){
    				pc.add(xis.get(0));
    			}
    			
			}
    	}
		return pc;
	}

}
