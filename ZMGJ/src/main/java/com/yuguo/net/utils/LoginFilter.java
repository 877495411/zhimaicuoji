package com.yuguo.net.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 是否需要验证
 * 
 * @author AIDAN 2015-0730
 */
public class LoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		String path = servletRequest.getRequestURI();// 获得用户请求的URI
		String userName = session.getAttribute("userName") + "";

		// 判断
        if ((path.contains("/builder/"))) {
        	if(userName!=null && !"".equals(userName) && !"null".equals(userName)){
        		chain.doFilter(request, response);
        	}else{
        		servletResponse.sendRedirect(servletRequest.getContextPath()+"/system/login/tohome.do");
        		return;
        	}
        }else{
        	chain.doFilter(request, response);
        }

	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

}
