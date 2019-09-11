package com.kh17.panda.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class OrderSessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("!!!!?!!?!?!?!?!?!?!??!");
		if (request.getSession().getAttribute("orderVO") != null) {
			String referer = request.getHeader("referer");
			
			if (referer.contains("?")) {
				referer = referer.split("\\?")[0];
			}
			referer = referer.split(request.getContextPath())[1];
			System.out.println(referer);
//			String uri = request.getRequestURI().split(request.getContextPath())[1];
			if (referer.equals("/orders/order")) {
				request.getSession().removeAttribute("orderVO");
				System.out.println("세션삭제!!!!!!!!!");
			}
		}
		return true;
	}

}
