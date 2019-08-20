package com.kh17.panda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.repository.OrdersDao;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@Autowired
	private OrdersDao ordersDao;
	
	@GetMapping("/view")
	public String view() {
		return "orders/view";
	}
	
	@PostMapping("/view")
	public String view(Model model) {
		return "orders/view";
	}
	
//	@GetMapping("/order")
//	public String order(@ModelAttribute CartDto cartDto, Model model) {
//		
//		model.addAttribute("product", cartDto);
//		return "orders/order";
//	}
//	
//	@PostMapping("/order")
//	public String order(@ModelAttribute OrderDto orderDto, Model model) {
//		
//		orderDao.insert();
//		model
//	}
//	
}
