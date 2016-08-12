package com.mangosoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.interest.InterestDao;
import com.mangosoft.service.InterestService;
import com.mangosoft.vo.Interest;
import com.mangosoft.vo.User;
@Service
public class InterestServiceImpl implements InterestService {
    private InterestDao interestDao;
    @Resource(type = InterestDao.class)
    public void setInterestDao(InterestDao interestDao){
    	this.interestDao = interestDao;
    }
	@Override
	public List<Interest> getInterestList(User user) {
		// TODO Auto-generated method stub
		return interestDao.findTbyHql("from Interest where sex <> "+user.getSex());
	}
	@Override
	public List<Interest> getInterestList(String ids) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		List<Interest> pc = new ArrayList<Interest>();
		if(ids!=null && !ids.equals("")){
    		String[] idss = ids.split(",");
    		for (int i = 0; i < idss.length; i++) {
    		
    			List<Interest>	xis =interestDao.findTbyHql("from Interest where id = "+idss[i]);
    			if(xis.size()>0){
    				pc.add(xis.get(0));
    			}
    			
			}
    	}
		return pc;
	}

}
