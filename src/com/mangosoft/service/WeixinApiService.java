package com.mangosoft.service;

import com.mangosoft.vo.User;

public interface WeixinApiService {
	 // public String getAccessToken();
	  public User getUser(String access_token,String openid);
	  public String getOpenId(String code);
	  public void sendMsg(User userfrom,User userto,String content,String cid);
}
