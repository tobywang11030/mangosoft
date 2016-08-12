package com.mangosoft.quartz;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.mangosoft.service.UserService;
import com.mangosoft.vo.User;

@Component("CheckLoginTimeQuartz")
public class CheckLoginTimeQuartz {
	private static final Logger logger = Logger.getLogger(CheckLoginTimeQuartz.class);
	private UserService userService;
	@Resource(type = UserService.class)
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void doJob() {
		logger.info("CheckLoginTimeQuartz-----doJob------start");
		   List<User> userlist = userService.getWeixinUser();
           for (int i = 0; i < userlist.size(); i++) {
        	   User user = userlist.get(i);
				  Calendar c1=Calendar.getInstance();
				    Calendar c2=Calendar.getInstance();
				    c1.setTime(new Date());
				    c2.setTime(user.getLogintime());
				    long l=c1.getTimeInMillis()-c2.getTimeInMillis();
				    int hours=new Long(l/(1000*60*60)).intValue();
				    logger.info("userid:"+user.getId()+" 距上次操作已过"+hours+"小时");
				    if(hours>46){
				    	logger.info("userid:"+user.getId()+"操作超时，用户下线");
				    	userService.updateUserstate(user, 0);
				    }
				    try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
      }  
	
}
