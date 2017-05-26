package com.baiHoo.triage.system.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 *<p>Title: AjaxFilter</p>
 *<p>Description:
 *
 *session超时自定义超时 事件
 *在web.config中进行如下配置
 *<system.web>
 *
 *		<sessionState mode="InProc" timeout="30"/>
 *
 *</system.web> 
 * 
 * 
 * 
 * </p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
public class AjaxFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	public void doFilter(ServletRequest servletRequestt, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest request=(HttpServletRequest) servletRequestt;
		 HttpServletResponse response=(HttpServletResponse) servletResponse;
		 
		 //String currentURL = request.getRequestURI();//取得根目录所对应的绝对路径:   
		 //String targetURL = currentURL.substring(currentURL.indexOf("/", 1), currentURL.length());  //截取到当前文件名用于比较
		 /**
		  * X-Requested-With是在服务器端判断request来自Ajax请求(异步)还是传统请求(同步)
		  * 两种请求在请求的Header不同，Ajax 异步请求比传统的同步请求多了一个头参数
		  * request.getHeader("x-requested-with"); 为 null，则为传统同步请求，为 XMLHttpRequest，则为 Ajax 异步请求。
		  */
		 String ajaxSubmit = request.getHeader("X-Requested-With");
		 if(ajaxSubmit != null && ajaxSubmit.equals("XMLHttpRequest")){
			 if (request.getSession(false) == null) {
				 /**
				  * ajax异步请求，session超时处理 
				  * sessionstatus在web开发中，通常会有session超时处理，对于普通的http请求比较容易处理，而对于ajax异步请求，可能就需要特殊处理了
				  */
				 response.setHeader("sessionstatus", "timeout");
				 response.getWriter().print("sessionstatus");
				 return;
			 }
		 }
		 chain.doFilter(servletRequestt, servletResponse);
	}

	public void destroy() {
		
	}
}
