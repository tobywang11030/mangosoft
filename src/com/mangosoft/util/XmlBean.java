package com.mangosoft.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mangosoft.vo.Article;
import com.mangosoft.vo.NewsMessage;



public class XmlBean {
    private static String fromUserName;
    private static String toUserName;
    private static Date CreateTime;
    private static String MsgType;
    private static int FuncFlag;
    NewsMessage newsMessage = null;
    public XmlBean(String fromUserName,String toUserName){
    	this.fromUserName=fromUserName;
    	this.toUserName = toUserName;
    	
    	newsMessage = new NewsMessage();  
        newsMessage.setToUserName(fromUserName);  
        newsMessage.setFromUserName(toUserName);  
        newsMessage.setCreateTime(new Date().getTime());  
        newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);  
        newsMessage.setFuncFlag(0);  
    }
    public String   setarticle(String article_Title,String picUrl,String description,String url){
    	 List<Article> articleList =new ArrayList<Article>();
         Article article = new Article();
         article.setTitle(article_Title);
         article.setPicUrl(picUrl);
         article.setDescription(description);
         article.setUrl(url);
         articleList.add(article);
         newsMessage.setArticleCount(articleList.size());  
         newsMessage.setArticles(articleList);  
        
    	
    	return  MessageUtil.newsMessageToXml(newsMessage); 
    }
	public static String getFromUserName() {
		return fromUserName;
	}
	public static void setFromUserName(String fromUserName) {
		XmlBean.fromUserName = fromUserName;
	}
	public static String getToUserName() {
		return toUserName;
	}
	public static void setToUserName(String toUserName) {
		XmlBean.toUserName = toUserName;
	}
	public static Date getCreateTime() {
		return CreateTime;
	}
	public static void setCreateTime(Date createTime) {
		CreateTime = createTime;
	}
	public static String getMsgType() {
		return MsgType;
	}
	public static void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public static int getFuncFlag() {
		return FuncFlag;
	}
	public static void setFuncFlag(int funcFlag) {
		FuncFlag = funcFlag;
	}
    
}
