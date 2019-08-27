package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.ProductDao;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CartDao cartDao;
	
	@GetMapping("/view")
	public String view() {
		return "orders/view";
	}
	
	@PostMapping("/view")
	public String view(Model model) {
		return "orders/view";
	}
	
//	@GetMapping("/order")
//	public String order(@RequestParam int product_id, HttpSession session, Model model) {
//		String member_id = (String) session.getAttribute("sid");
//		
//		if(product_id !=null) {
//			ProductDto productDto = productDao.get(product_id);
//			model.addAttribute("productDto", productDto);
//		}
//		else {
//			List<CartViewDto> list = cartDao.list(member_id);
//			model.addAttribute("cList", list);
//		}
//		
//		
//		return "orders/order";
//	}
	
//	@PostMapping("/order")
//	public String order(@ModelAttribute OrderDto orderDto, Model model) {
//		
//		orderDao.insert();
//		model.addAttribute(attributeValue)
//	}
//	
//	@GetMapping("/cancel")
//	public String cancel() {
//		
//	}
}
