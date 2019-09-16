package com.kh17.panda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.repository.StaticDao;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	
	@Autowired
	private StaticDao staticDao;
	
	@GetMapping("/proceed")
	public String proceed(Model model) {
		List<OrdersDto> list = staticDao.month();
		
		model.addAttribute("day", list);
		model.addAttribute("detail", staticDao.detail());
		
		return "statistics/proceed";
	}
	
	@GetMapping("/product")
	public String product(Model model) {
		List<OrderViewDto> product = staticDao.product_top();
		List<OrderViewDto> seller = staticDao.seller_top();
		
		model.addAttribute("product", product);
		model.addAttribute("seller", seller);
		return "statistics/product";
	}
}
