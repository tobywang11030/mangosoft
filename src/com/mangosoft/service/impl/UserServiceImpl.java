package com.mangosoft.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;












import com.mangosoft.dao.user.UserDao;
import com.mangosoft.service.UserService;
import com.mangosoft.vo.User;
import com.mangosoft.vo.Userinfo;
import com.mangosoft.vo.UserinfoMore;
import com.mangosoft.vo.UserinfoSelect;
@Service
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    @Resource(type = UserDao.class)
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public User getUser(String openid) {
		// TODO Auto-generated method stub
		User user = null;
		String hql = "from User where userOpenid = '"+openid.trim()+"'";
		List<User> userlist = userDao.findTbyHql(hql);
		if(userlist!=null && userlist.size()>0){
			user = (User)userlist.get(0);
		}
		return user;
	}
	@Override
	public User getUserByid(String id) {
		// TODO Auto-generated method stub
		return userDao.get(Integer.parseInt(id));
	}
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		 userDao.save(user);
	}
	
	@Override
	public void setUserAge(User user, String age) {
		// TODO Auto-generated method stub
		user.setAge(Integer.parseInt(age));
		userDao.update(user);
	}
	@Override
	public void setUserBasic(User user, String nick_name, String year,
			String month, String day, String height, String province,
			String city, String weight, String blood_type, String edu,
			String work, String income, String marry_type, String have_house) {
		// TODO Auto-generated method stub
		if(nick_name!=null && !nick_name.equals("")){
    		user.setName(nick_name);
    	}
    	
    	if(user.getUserinfo()==null){
    		Userinfo userinfo = new Userinfo();
    		userinfo.setXlUser(user);
    		user.setUserinfo(userinfo);
    	}
    	user.getUserinfo().setBirthdayYear(Integer.parseInt(year));
    	user.getUserinfo().setBirthdayMonth(Integer.parseInt(month));
    	user.getUserinfo().setBirthdayDay(Integer.parseInt(day));
    	user.getUserinfo().setHeight(height);
    	user.getUserinfo().setLocationProvince(province);
    	user.getUserinfo().setLocationCity(city);
    	user.getUserinfo().setWeight(weight);
    	user.getUserinfo().setBloodType(blood_type);
    	user.getUserinfo().setEducation(Integer.parseInt(edu));
    	user.getUserinfo().setWork(Integer.parseInt(work));
    	user.getUserinfo().setMaritalstatus(Integer.parseInt(marry_type));
    	user.getUserinfo().setIncome(Integer.parseInt(income));
    	user.getUserinfo().setHorse(Integer.parseInt(have_house));
    	user.setOnlineFlag(1);
    	userDao.update(user);
	}
	@Override
	public void setUserMoreInfo(User user, String need_baby,
			String diff_area_love, String lover_type, String sex_first,
			String live_with_parent, String charm, String characteristic,
			String interest) {
		// TODO Auto-generated method stub
		if(user.getUserinfoMore()==null){
    		UserinfoMore xm = new UserinfoMore();
    		xm.setXlUser(user);
    		user.setUserinfoMore(xm);
    	}
    	user.getUserinfoMore().setChild(Integer.parseInt(need_baby));
    	user.getUserinfoMore().setDistanceLove(Integer.parseInt(diff_area_love));
    	user.getUserinfoMore().setLovePeopleType(Integer.parseInt(lover_type));
    	user.getUserinfoMore().setPsb(Integer.parseInt(sex_first));
    	user.getUserinfoMore().setLiveWithParents(Integer.parseInt(live_with_parent));
    	user.getUserinfoMore().setCharm(Integer.parseInt(charm));
    	user.getUserinfoMore().setHobbies(characteristic);
    	user.getUserinfoMore().setPersonalType(interest);
    	user.setOnlineFlag(1);
    	userDao.update(user);
	}
	@Override
	public void setUserMatch(User user, String con_age_min,
			String con_age_max, String con_height_min, String con_height_max,
			String con_income, String con_province, String con_edu) {
		// TODO Auto-generated method stub
		if(user.getUserinfoSelect()==null){
    		UserinfoSelect xs = new UserinfoSelect();
    		xs.setXlUser(user);
    		user.setUserinfoSelect(xs);
    	}
    	if(con_age_min!=null && !con_age_min.equals("")){
    		user.getUserinfoSelect().setAgeSelect(Integer.parseInt(con_age_min));
    	}
    	if(con_age_max!=null && !con_age_max.equals("")){
    		user.getUserinfoSelect().setAgeSelectMax(Integer.parseInt(con_age_max));
    	}
    	if(con_height_min!=null && !con_height_min.equals("")){
    		user.getUserinfoSelect().setHeightSelect(Integer.parseInt(con_height_min));
    	}
    	if(con_height_max!=null && !con_height_max.equals("")){
    		user.getUserinfoSelect().setHeightSelectMax(Integer.parseInt(con_height_max));
    	}
    	if(con_income!=null && !con_income.equals("")){
    		user.getUserinfoSelect().setIncomSelect(Integer.parseInt(con_income));
    	}
    	if(con_edu!=null && !con_edu.equals("")){
    		user.getUserinfoSelect().setEduSelect(Integer.parseInt(con_edu));
    	}
    	
    	if(con_province!=null && !con_province.equals("")){
    		user.getUserinfoSelect().setLocation(Integer.parseInt(con_province));
    	}
    	user.setOnlineFlag(1);
    	userDao.update(user);
	}
	@Override
	public void setUserheartsay(User user, String heartsay) {
		// TODO Auto-generated method stub
		user.setHeartSay(heartsay);
		userDao.update(user);
	}
	@Override
	public List<User> getOnlineUser(User user) {
		// TODO Auto-generated method stub
		List<User> hsl = new ArrayList<User>();
		String hql = "from User where sex <> "+user.getSex()+" and onlineFlag =1 and userinfo.locationProvince = '"+user.getUserinfo().getLocationProvince()+"' and userinfo.locationCity='"+user.getUserinfo().getLocationCity()+"' order by id desc";
		hsl = userDao.findTbyHql(hql);
		List<User> list = new ArrayList<User>();
		if(hsl !=null && hsl.size() > 0 && hsl.size() <=5){
			return hsl;
		}else if(hsl !=null && hsl.size() > 0 && hsl.size() > 5){
			//取锟斤拷
			int maxId = hsl.size();
			Map<Integer,Integer> map = new HashMap<Integer,Integer>();
			while(true){
				float tp =(float) (Math.random()*maxId);
				int t = (int)tp;
				map.put(t, t);
				if(map.size() == 5){
				  break;
				}
			
			}
			for (int k : map.keySet()) {
				list.add(hsl.get(k));
			}
			
			return list;
		}else{
		    return hsl;
		}
	}
	@Override
	public List<User> getMatchUser(User user,int offset,int size) {
		// TODO Auto-generated method stub
		offset = offset*size;
		String wheresql = " and sex <> ? and userinfo.locationProvince= ? ";
		Object[] queryParams = new Object[]{user.getSex(),user.getUserinfoSelect().getLocation().toString()};
		LinkedHashMap<String, Object> orderby = new LinkedHashMap<String, Object>();
		orderby.put("logintime", "desc");
		orderby.put("id", "desc");
		return userDao.limitFindByHql(offset, size, wheresql, queryParams, orderby);
	}
	@Override
	public List<User> getWeixinUser() {
		// TODO Auto-generated method stub
		return userDao.findTbyHql("from User where onlineFlag=1 and isweixinuser=0");
	}
	@Override
	public void updateLogintime(User user) {
		// TODO Auto-generated method stub
		user.setLogintime(new Timestamp(new Date().getTime()));
		user.setOnlineFlag(1);
		userDao.update(user);
	}
	@Override
	public void updateUserstate(User user, int state) {
		// TODO Auto-generated method stub
		user.setOnlineFlag(state);
		userDao.update(user);
	}
	
	@Override
	public void settx(User user, String path) {
		// TODO Auto-generated method stub
		user.setPhoto(path);
		userDao.update(user);
		
	}
}
