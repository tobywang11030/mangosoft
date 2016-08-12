package com.mangosoft.service.impl;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Service;

import com.mangosoft.Global;
import com.mangosoft.dao.Region.RegionDao;
import com.mangosoft.service.WeixinApiService;
import com.mangosoft.util.HttpsGetData;
import com.mangosoft.util.HttpsPostData;
import com.mangosoft.vo.User;
import com.mangosoft.vo.Userinfo;
import com.mangosoft.vo.UserinfoSelect;
@Service
public class WeixinApiServiceImpl implements WeixinApiService {
	private static final Logger logger = Logger.getLogger(WeixinApiServiceImpl.class);
	private RegionDao regionDao;
	   @Resource(type =RegionDao.class)
		public void setRegionDao(RegionDao regionDao) {
			this.regionDao = regionDao;
		}
//    public String getAccessToken(){
//  		String access_token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+Global.appid.trim()+"&secret="+Global.secret.trim();
//  		System.out.println("access_token_url:"+access_token_url);
//  		HttpsGetData hgd = new HttpsGetData(access_token_url,null);
//  		String access_token_xml = null;
//          try {
//				 access_token_xml = hgd.Do();
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				logger.info("调用微信AccessToken接口错误:"+e);
//			}
//          JSONObject json = JSONObject.fromObject(access_token_xml);
//       //   System.out.println("access_token:"+json.getString("access_token"));
////      	Map<String, String> requestMap =null;
////      	try {
////				requestMap = parseXml(access_token_xml);
////			} catch (Exception e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
//      	
//      
////      	if(requestMap.get("access_token")!=null){
////      		return requestMap.get("access_token");
////      	}else{
////      		return null;
////      	}
//          if(json.containsKey("access_token") && json.getString("access_token")!=null){
//      		return json.getString("access_token");
//      	}else{
//      		return null;
//      	}
//  		
//    }
    public User getUser(String access_token,String openid){
  	
  	  String userinfo_url= "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
  	  HttpsGetData hgd = new HttpsGetData(userinfo_url,null);
        String userinfo_xml = null;
    	Boolean istrue = true;
        
        try {
			userinfo_xml = hgd.Do();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("调用微信获取用户信息接口错误:"+e);
			istrue = false;
		}
        User user = null;
    //	logger.info("userinfo_xml:"+userinfo_xml);
    	 JSONObject json = JSONObject.fromObject(userinfo_xml);
    	 if(json.containsKey("subscribe") && json.getString("subscribe").equals("1")){
		String nickname = null;
    	String sex = null;
    	String city = null;
    	String province = null;
    	String country = null;
    	String headimgurl = null;
  	if(json.getString("nickname")!=null){
  		nickname = json.getString("nickname");
			sex =  json.getString("sex");
			city = json.getString("city");
			province =  json.getString("province");
			country =  json.getString("country");
			headimgurl =  json.getString("headimgurl");
  	}else{
  		istrue = false;
  	}
   
    
    	if(istrue){
    		 user = new User();
    		user.setName(nickname);
    		if(sex.equals("1")){
    			user.setSex(0);
    		}else if(sex.equals("2")){
    			user.setSex(1);
    		}else{
    			user.setSex(null);
    		}
    		user.setUserOpenid(openid);
    		Userinfo userinfo = new Userinfo();
    		UserinfoSelect xs = new UserinfoSelect();
    		xs.setXlUser(user);
    		
    		userinfo.setXlUser(user);
    		Double ProvinceId = regionDao.getProvinceId(province);
    		int cityId = (int) regionDao.getCityId(city, ProvinceId).doubleValue();
    		userinfo.setLocationProvince((int) regionDao.getProvinceId(province).doubleValue()+"");
    		userinfo.setLocationCity(cityId+"");
    		xs.setLocation((int)ProvinceId.doubleValue());
    		user.setUserinfoSelect(xs);
    		user.setUserinfo(userinfo);
    		user.setPhoto(headimgurl);
    		user.setAuthTypePeople(0);
    		user.setAuthTypePhone(0);
    		user.setOnlineFlag(1);
    		user.setIsweixinuser(0);
    		user.setLogintime(new Timestamp(new Date().getTime()));
    		
        	
    	}
    	return user;
	}else {
		return null;
	}
   	
    }
    public static Map<String, String> parseXml(String  xmlstr) throws Exception {  
        // ���������洢��HashMap��  
        Map<String, String> map = new HashMap<String, String>();  
  
        // ��request��ȡ��������  
       // InputStream inputStream = request.getInputStream();  
       // InputStream inputStream = new ByteArrayInputStream(xmlstr.getBytes());
        // ��ȡ������  
      //  SAXReader reader = new SAXReader();  
        Document document = DocumentHelper.parseText(xmlstr);
        // �õ�xml��Ԫ��  
        Element root = document.getRootElement();  
        // �õ���Ԫ�ص������ӽڵ�  
        List<Element> elementList = root.elements();  
  
        // ���������ӽڵ�  
        for (Element e : elementList)  
            map.put(e.getName(), e.getText());  
  
        // �ͷ���Դ  
      //  inputStream.close();  
      //  inputStream = null;  
  
        return map;  
    }  
    private static InputStream checkForUtf8BOMAndDiscardIfAny(InputStream inputStream) throws IOException {
  	    PushbackInputStream pushbackInputStream = new PushbackInputStream(new BufferedInputStream(inputStream), 3);
  	    byte[] bom = new byte[3];
  	    if (pushbackInputStream.read(bom) != -1) {
  	        if (!(bom[0] == (byte) 0xEF && bom[1] == (byte) 0xBB && bom[2] == (byte) 0xBF)) {
  	            pushbackInputStream.unread(bom);
  	        }
  	    }
  	    return pushbackInputStream; 
  	}

    public String getOpenId(String code){      //���openid
  		String access_token_url="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+Global.appid.trim()+"&secret="+Global.secret.trim()+"&code="+code+"&grant_type=authorization_code";
  		System.out.println("access_token_url:"+access_token_url);
  		HttpsGetData hgd = new HttpsGetData(access_token_url,null);
  		String access_token_xml = null;
          try {
				 access_token_xml = hgd.Do();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.info("调用微信getOpenId接口错误:"+e);
			}
          JSONObject json = JSONObject.fromObject(access_token_xml);
         // logger.info("getOpenID:"+access_token_xml);
        //  System.out.println("openid:"+json.getString("openid"));
          if(json.containsKey("openid") && json.getString("openid")!=null){
      		return json.getString("openid");
      	}else{
      		return null;
      	}
  		
    }
    public void sendMsg(User userfrom,User userto,String content,String cid){    //向微信用户推送消息
  		 
  		 if(Global.sendmsg.equals("false")){
  			 logger.info("系统全局设置不允许发送微信消息");
  		 }else if(userto.getIsweixinuser()==1){
  			 logger.info(userto.getId()+":此用户不是微信用户，不能发送微信消息");
  		 }else if(userto.getOnlineFlag()==0){
  			 logger.info(userto.getId()+":此用户已下线，不能发送微信消息");
  		 }else{
  			 HttpsPostData hpd = new HttpsPostData();
  	    	  JSONObject object = new JSONObject();
  	  	    	object.put("touser", userto.getUserOpenid());
  	  	    	object.put("msgtype", "news");
  	  	    	JSONObject news = new JSONObject();
  	  	    	JSONArray array = new JSONArray();
  	  	    	JSONObject articles = new JSONObject();
  	  	    	
  	  	    	articles.put("title", "来自"+userfrom.getName()+"的新消息");
  	  	    	articles.put("description", "以下为消息内容:");
  	  	    	articles.put("url", Global.url+"/weixinpro/web?action=chat&openid="+userto.getUserOpenid()+"&matchid="+userfrom.getId()+"&cid="+cid);
  	  	    	if(userfrom.getPhoto().indexOf("http")==-1){
  	  	    		articles.put("picurl",  Global.url+"/"+userfrom.getPhoto());
  	  	    	}else{
  	  	    		articles.put("picurl",  userfrom.getPhoto());
  	  	    	}
  	  	    	JSONObject articles2 = new JSONObject();
  	  	    	articles2.put("title", userfrom.getName()+"说："+content);
  	  	    	articles2.put("description", userfrom.getName()+"说： "+content);
  	  	    	articles2.put("url", Global.url+"/weixinpro/web?action=chat&openid="+userto.getUserOpenid()+"&matchid="+userfrom.getId()+"&cid="+cid);
  	  	    	JSONObject articles3 = new JSONObject();
  	  	    	String sex = "她";
  	  	    	if(userfrom.getSex()==0){
  	  	    		sex="他";
  	  	    	}
  	  	    	articles3.put("title", "点击进入对话窗口与"+sex+"对话");
  	  	    	articles3.put("description", "点击进入对话窗口与"+sex+"对话");
  	  	    	articles3.put("url", Global.url+"/weixinpro/web?action=chat&openid="+userto.getUserOpenid()+"&matchid="+userfrom.getId()+"&cid="+cid);
  	  	    	array.add(articles);
  	  	     	array.add(articles2);
  	  	    	array.add(articles3);
  	  	    	news.put("articles", array);
  	  	    	object.put("news", news);
  	  	    	
  	  	     
  	  	    	String jsonstr = object.toString();
  	  	    	//System.out.println(jsonstr);
  	  	    	try {
  					hpd.post("https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token="+Global.AccessToken, jsonstr, "utf-8");
  				} catch (KeyManagementException e) {
  					// TODO Auto-generated catch block
  					logger.error("sendMsg1:"+e);
  				} catch (NoSuchAlgorithmException e) {
  					// TODO Auto-generated catch block
  					logger.error("sendMsg2:"+e);
  				} catch (IOException e) {
  					// TODO Auto-generated catch block
  					logger.error("sendMsg3:"+e);
  				}
  		 }
  	 
    }

	
}
