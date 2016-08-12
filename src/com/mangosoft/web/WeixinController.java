package com.mangosoft.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;













import com.mangosoft.Global;
import com.mangosoft.service.UserService;
import com.mangosoft.service.WeixinApiService;
import com.mangosoft.util.MessageUtil;
import com.mangosoft.util.XmlBean;
import com.mangosoft.vo.TextMessage;
import com.mangosoft.vo.User;



@Controller
@RequestMapping("/weixin")
public class WeixinController {
	private static final Logger logger = Logger.getLogger(WeixinController.class);
	private UserService userService;
	private WeixinApiService weixinApiService;
	@Resource(type = UserService.class)
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Resource(type=WeixinApiService.class)
	public void setWeixinApiService(WeixinApiService weixinApiService){
		this.weixinApiService = weixinApiService;
	}
	@RequestMapping(value="/doit")
     public String doit( HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("UTF-8");
		 PrintWriter out = null;
		 
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		
		 if(Global.Debugmode.equals("true")){
			 logger.info("接入模式");
//	        String signature = request.getParameter("signature");  
//	        String timestamp = request.getParameter("timestamp");  
//	        String nonce = request.getParameter("nonce");  
	        String echostr = request.getParameter("echostr");  
	       
	        out.print(echostr);  
	     
			}else{
			   
		        String respMessage = null;  
		        String say = "";
		        try {  
		            String respContent = Global.sayunknow;  
		            System.out.println("respContent:"+respContent);
		            Map<String, String> requestMap = MessageUtil.parseXml(request);  
		            String fromUserName = requestMap.get("FromUserName");  
		            String toUserName = requestMap.get("ToUserName");  
		            String msgType = requestMap.get("MsgType");  
		             say = requestMap.get("Content");  
		             System.out.println("say:"+say);
		             if(say==null){
		            	 say="";
		             }
		          if(say.indexOf("#")==-1){
		            TextMessage textMessage = new TextMessage();  
		            textMessage.setToUserName(fromUserName);  
		            textMessage.setFromUserName(toUserName);  
		            textMessage.setCreateTime(new Date().getTime());  
		            textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
		            textMessage.setFuncFlag(0);  
		  
		            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {  
		            
                     System.out.println("respContent2:"+respContent);
	            	  textMessage.setContent(respContent);  
	                  respMessage = MessageUtil.textMessageToXml(textMessage);  
		            }  
		            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {  
		            	 String PicUrl = requestMap.get("PicUrl");  
		            	logger.info("PicUrl："+PicUrl);
		            	
		            		 respContent = "我看不懂你发送的图片";  
		            		
		            	
		                
		                textMessage.setContent(respContent);  
		                respMessage = MessageUtil.textMessageToXml(textMessage);  
		            }  
		            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {  
		                respContent = "我已知道你的位置啦";  
		               logger.info("地理位置:");
		               logger.info(requestMap.get("Latitude"));
		               logger.info(requestMap.get("Longitude"));
		               logger.info(requestMap.get("Precision"));
		              // obp.setJwd(fromUserName, requestMap.get("Latitude"), requestMap.get("Longitude"), requestMap.get("Precision"));
		            }  
		            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {  
		                respContent = "";  
		            }  
		            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {  
		                respContent = "";  
		            }  
		            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {  
		                String eventType = requestMap.get("Event");  
		                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {  
		                logger.info("收到新用户关注请求");
		          		 logger.info("toUserName:"+toUserName);
		          		 logger.info("fromUserName:"+fromUserName);  //openid
		          		
		          		 logger.info("准备添加用户："+fromUserName);
		            
		             	String access_token =Global.AccessToken;
		             	if(access_token!=null){
		             		User user = weixinApiService.getUser(access_token, fromUserName);
		             		if(user!=null){
		             			if(userService.getUser(user.getUserOpenid())==null){
		             				logger.info("用户:"+user.getUserOpenid()+" 从没关注过，新添加");
		             				userService.addUser(user);
		             			}else{
		             				logger.info("用户:"+user.getUserOpenid()+" 之前关注过，不用添加");
		             			}
		             			
		             		}else{
		             			logger.info("未从微信返回用户信息");
		             		}
		             	}else{
		             		logger.info("AccessToken为空");
		             	}
		          		
		          		  if(Global.guanzhulist.equals("true")){
		          			 textMessage.setContent(Global.guanzhu);  
		               		
		               		
		                     respMessage = MessageUtil.textMessageToXml(textMessage);  
		          		  }else{
		          			 textMessage.setContent(Global.guanzhu);  
		               		
		               		
		                     respMessage = MessageUtil.textMessageToXml(textMessage);  
		          		  }
		          			
		                }  
		                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
		                	logger.info("用户"+fromUserName+"取消关注");
		                	User user = userService.getUser(fromUserName);
		                	if(user!=null && user.getOnlineFlag()==1){
		                		logger.info("取消关注后，将userid:"+user.getId()+"设为下线");
		                		userService.updateUserstate(user, 0);
		                	}
		                }  
		                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
		                	String EventKey = requestMap.get("EventKey"); 
		                	System.out.println("EventKey:"+EventKey);
		                	XmlBean xb = new XmlBean(fromUserName, toUserName);
		                	String  article_Title = "";
		                	String picUrl = "";
		                	String description = "";
		                	String url = "";
		                	if(EventKey.equals("KEY_HOME")){
		                		article_Title = "个人中心";
		                		picUrl = Global.msg_pic;
		                		description = "点此进入个人中心";
		                		url = Global.url+"/weixinpro/web?action=myhome&openid="+fromUserName;
		                	}else if(EventKey.equals("KEY_MSG")){
		                		article_Title = "缘分信箱";
		                		picUrl = Global.msg_pic;
		                		description = "点此进入缘分信箱";
		                		url = Global.url+"/weixinpro/web?action=chatlist&openid="+fromUserName;
		                	}else if(EventKey.equals("KEY_MATCH")){
		                		article_Title = "缘分天空";
		                		picUrl = Global.msg_pic;
		                		description = "点此进入缘分天空";
		                		url = Global.url+"/weixinpro/web?action=userlist&openid="+fromUserName;
		                	}
		                	
		                    respMessage = xb.setarticle(article_Title, picUrl, description,url);
		                	
		                }  else if (eventType.equals("LOCATION")) {  

		                    logger.info(requestMap.get("Latitude"));
		                    logger.info(requestMap.get("Longitude"));
		                    logger.info(requestMap.get("Precision"));
		                   // obp.setJwd(fromUserName, requestMap.get("Latitude"), requestMap.get("Longitude"), requestMap.get("Precision"));
		                }  
		            }  
		          
		          
		          }
		        	 
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }    
		     
		      System.out.println("respMessage1:"+respMessage);
		        out.print(respMessage);  
		      
			}
		   out.close();  
	        out = null;  
		 return null;
	 }

	
}
