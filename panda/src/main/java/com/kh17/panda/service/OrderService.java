package com.kh17.panda.service;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.vo.KakaoPaySuccessVO;
import com.kh17.panda.vo.OrderAddressVO;

public interface OrderService {

	String order(OrdersDto ordersDto, int[] c_id, OrderAddressVO orderAddressVO, String[] re_phones, HttpSession session, String t_id);
	
	void gradeCheck(HttpSession session);

	void save(OrdersDto ordersDto, HttpSession session, int point, String[] item_name, String team);
	
	void cancelOrder(String t_id, int total_amount, Model model) throws URISyntaxException;
}
