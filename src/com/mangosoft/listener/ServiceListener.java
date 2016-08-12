package com.mangosoft.listener;

import java.io.InputStream;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.mangosoft.Global;
import com.mangosoft.util.HttpsGetData;





public class ServiceListener  implements ServletContextListener{
	 private static final Logger log = Logger.getLogger(ServiceListener.class);

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		log.info("-------------------微信服务结束-------------------");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		log.info("-------------------微信服务启动-------------------");
		try {
			log.info("开始加载全局设置");
			loadDsmProperties();
			if(Global.getaccesstoken.equals("true")){
				  log.info("自动获得Accesstoken开启");
				  getAccessToken();
			}else{
				  log.info("自动获得Accesstoken关闭,手动填写："+Global.AccessToken);
			}
			if(Global.checkstate.equals("true")){
				 log.info("定时检查微信用户在线状态已开启");
				
			}else{
				 log.info("定时检查微信用户在线状态已关闭");
			}
			if(Global.sendmsg.equals("true")){
				 log.info("新消息主动推送已开启");
			}else{
				 log.info("新消息主动推送已关闭");
			}
			if(Global.sendmsg.equals("true")){
				 log.info("机器人主动对话已开启");
			}else{
				 log.info("机器人主动对话已关闭");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			log.info("加载全局设置错误："+e);
		}
	}
	  private void loadDsmProperties()
			    throws Exception
			  {
			    InputStream input = null;
			    try
			    {
			      input = ServiceListener.class.getClassLoader().getResourceAsStream("xianglian.properties");
			      Properties pro = new Properties();
			      pro.load(input);
                  
			      Global.Debugmode = pro.getProperty("dbugmode");
	              log.info("接入模式:"+Global.Debugmode);
	              Global.appid = pro.getProperty("appid");
	              log.info("appid:"+Global.appid);
	              Global.secret = pro.getProperty("secret");
	              log.info("secret:"+Global.secret);
	              Global.guanzhu = pro.getProperty("guanzhu");
	              Global.guanzhulist = pro.getProperty("guanzhulist");
	              Global.sayunknow = pro.getProperty("sayunknow");
	              Global.url = pro.getProperty("url");
	              Global.msg_pic = pro.getProperty("msg_pic");
	              Global.checkstate = pro.getProperty("checkstate");
	              Global.sendmsg = pro.getProperty("sendmsg");
	              Global.getaccesstoken = pro.getProperty("getaccesstoken");
	              if(Global.getaccesstoken.equals("false")){
	            	  Global.AccessToken = pro.getProperty("accesstoken");
	              }
	              Global.sendrobotmsg = pro.getProperty("sendrobotmsg");
	              Global.sayhello = pro.getProperty("sayhello");
	              Global.sayneedphoto = pro.getProperty("sayneedphoto");
			    }
			    catch (Exception e)
			    {
			      log.error("加载全局设置错误：", e);
			      throw new Exception(e);
			    }
			    finally
			    {
			      try
			      {
			        input.close();
			      }
			      catch (Exception e)
			      {
			        log.error("init xianglian.properties error!", e);
			        throw new Exception(e);
			      }
			    }
			  }
	  public void getAccessToken(){                //定时获得AccessToken
		  Runnable runnable = new Runnable() {  
	            public void run() {  
	                // task to run goes here  
	            	String AccessToken = getAccessTokenByWeixin();
	              log.info("获得AccessToken:"+AccessToken);
	              if(AccessToken!=null && !"".equals(AccessToken)){
	            	  Global.AccessToken = AccessToken;
	              }
	            }  
	        };  
	        ScheduledExecutorService service = Executors  
	                .newSingleThreadScheduledExecutor();  
	        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
	        service.scheduleAtFixedRate(runnable,0, 2, TimeUnit.HOURS);  
	    
	  }
	  public String getAccessTokenByWeixin(){
	  		String access_token_url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+Global.appid.trim()+"&secret="+Global.secret.trim();
	  		System.out.println("access_token_url:"+access_token_url);
	  		HttpsGetData hgd = new HttpsGetData(access_token_url,null);
	  		String access_token_xml = null;
	          try {
					 access_token_xml = hgd.Do();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					log.info("调用微信AccessToken接口错误:"+e);
				}
	          JSONObject json = JSONObject.fromObject(access_token_xml);

	          if(json.containsKey("access_token") && json.getString("access_token")!=null){
	      		return json.getString("access_token");
	      	}else{
	      		return null;
	      	}
	  		
	    }

}
