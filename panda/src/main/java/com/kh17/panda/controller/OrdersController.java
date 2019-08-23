package com.kh17.panda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.vo.OrderViewListVO;

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
//	public String order(@RequestParam String product_id, HttpSession session, Model model) {
//		String member_id = (String) session.getAttribute("sid");
//		
//		if(product_id !=null) {
//			ProductDto productDto = productDao.get(poduct_id);
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
//	
//	@PostMapping("/order")
//	public String order(@ModelAttribute OrderDto orderDto, Model model) {
//		
//		orderDao.insert();
//		model
//	}
	@GetMapping("/list")
	public String list() {
		return "orders/list";
	}
	
	@PostMapping("/list")
	public String list(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO, Model model){
		System.out.println(orderViewDto);
		System.out.println(orderViewListVO);
		ordersDao.list(orderViewDto, orderViewListVO);
		return "orders/list";
	}
	
//	@GetMapping("/cancel")
//	public String cancel() {
//		
//	}
}
