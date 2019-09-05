package com.kh17.panda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ProtectInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(" NoCacheHeaderInterceptor NoCacheHeaderInterceptor NoCacheHeaderInterceptor NoCacheHeaderInterceptor NoCacheHeaderInterceptor");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//페이지 생성 후 : 
		super.afterCompletion(request, response, handler, ex);
	}
}
