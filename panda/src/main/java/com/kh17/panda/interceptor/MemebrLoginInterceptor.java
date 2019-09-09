package com.kh17.panda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemebrLoginInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		if(id == null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;//컨트롤러로 이동하는 것을 차단
		}
		else {
			return true;//chain.doFilter(request, response);
		}
	}

	
}

