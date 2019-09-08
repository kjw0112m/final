package com.kh17.panda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemebrLoginInterceptor extends HandlerInterceptorAdapter{
	
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

