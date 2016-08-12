package com.mangosoft.filter;

import java.io.IOException;  


import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletContext;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
  
import org.springframework.web.context.WebApplicationContext;  
import org.springframework.web.context.support.WebApplicationContextUtils;  
  
  
//Filter 的代理类。系统所有的 Filter 共用此一个  
public class CheckUserFilterProxy implements Filter {  
    private String targetFilterBean;  
    private Filter proxy;  
  
    @Override  
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,  
            FilterChain filterChain) throws IOException, ServletException {  
        proxy.doFilter(servletRequest, servletResponse, filterChain);  
    }  
  
    @Override  
    public void init(FilterConfig config) throws ServletException {  
        this.targetFilterBean = config.getInitParameter("targetFilterBean");  
        ServletContext servletContext = null;  
        servletContext = config.getServletContext();  
        WebApplicationContext wac = null;  
        wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);  
        this.proxy = (Filter) wac.getBean(this.targetFilterBean);  
        this.proxy.init(config);  
    }  
  
    @Override  
    public void destroy() {}  
}  
