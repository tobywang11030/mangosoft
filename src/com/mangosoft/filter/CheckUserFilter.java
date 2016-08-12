package com.mangosoft.filter;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.mangosoft.Global;
import com.mangosoft.service.UserService;
import com.mangosoft.service.WeixinApiService;
import com.mangosoft.vo.User;



/**
* Session过期检查Filter
*
* @author   Moon
*/
@Component("CheckUserFilter")
public class CheckUserFilter implements Filter
{
	/**
	 * Logger for this class
	 * 
	 */
	private WeixinApiService weixinApiService;
	@Resource(type=WeixinApiService.class)
	public void setWeixinApiService(WeixinApiService weixinApiService){
		this.weixinApiService = weixinApiService;
	}
	private UserService userService;
	@Resource(type = UserService.class)
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private final static Logger logger = LoggerFactory.getLogger(CheckUserFilter.class);

	/**
	 * 过滤器配置对象
	 */
	protected FilterConfig filterConfig = null;

	/**
	 * 注销filter服务
	 */
	public void destroy(){}

	/**
	 * 检查当前请求的session是否过期
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
		throws IOException, ServletException 
	{
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		String url = request.getRequestURI();
		String root = request.getContextPath();//root = /uc
		logger.debug("项目发布名称:" + root);
		url = url.substring(root.length());
		logger.debug("请求的URL为:" + url);	
		if(url.indexOf("weixinpro")!=-1){
			if(request.getSession().getAttribute("sessionuser")!=null){
				logger.debug("session中user存在");
				chain.doFilter(request, response);
			}else{
				String openid = request.getParameter("openid");
				if(openid==null){
					String code = request.getParameter("code");
					System.out.println("request.code:"+code);
				
					if(code!=null){
					//	logger.info("准备调用微信获取openid接口，code:"+code);
						openid = weixinApiService.getOpenId(code);
						//logger.info("通过微信接口获得的openid:"+openid);
						if(openid==null){
							logger.info("未能从微信接口获得openid,code:"+code);
						}
					}else {
						logger.info("未收到code和openid");
					}
				}
				
				
				System.out.println("request.openid:"+openid);
				
				if (openid != null) {

					User user = userService.getUser(openid);
					if(user==null){
						logger.info("库中没有此用户:"+openid+"，尝试调用微信接口添加此用户");
						user = weixinApiService.getUser(Global.AccessToken, openid);
						if(user !=null){
							userService.addUser(user);
							logger.info("库中没有此用户:"+openid+"，尝试调用微信接口添加此用户成功");
							request.getSession().setAttribute("sessionuser", user);
							chain.doFilter(request, response);
						}else{
							logger.info("此用户未订阅，无法获取用户信息，跳转至订阅页面");
							response.sendRedirect(request.getContextPath() + "/subscribe.jsp");
						}
						
						
					
					}else{
						request.getSession().setAttribute("sessionuser", user);
						chain.doFilter(request, response);
					}
					
				
			     }else{
			    	 logger.info("openid为空，跳转至订阅页面");
						response.sendRedirect(request.getContextPath() + "/subscribe.jsp");
			     }
			}	
		}else{
			chain.doFilter(request, response);
		}
		
		
		
	}

	/**
	 * 初始化Filter参数
	 * @param filterConfig The filter configuration object
	 */
	public void init(FilterConfig filterConfig) throws ServletException
	{
		this.filterConfig = filterConfig;
	}

}