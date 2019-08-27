package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.vo.OrderViewListVO;

@Controller
@RequestMapping("/seller/orders")
public class SellerOrderController {

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CartDao cartDao;

	@GetMapping("/list")
	public String list(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page, HttpSession session) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
		int count = ordersDao.count(orderViewDto, orderViewListVO.getSearch());
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		orderViewDto.setSeller_id((String) session.getAttribute("sid"));
		List<OrderViewDto> list = ordersDao.list(orderViewDto, orderViewListVO.getSearch(), start, end);
		model.addAttribute("orderViewDto", list);
		return "seller/orders/list";
	}
	
	@GetMapping("/invoice")
	public String invoice(@ModelAttribute OrdersDto ordersDto, RedirectAttributes model) {
		ordersDao.invoice(ordersDto);
		model.addAttribute("ordersDto", ordersDao.getTeam(ordersDto.getTeam()));
		return "redirect:content";
	}
	
	@GetMapping("/content")
	public String cotent(@ModelAttribute OrdersDto ordersDto, Model model) {
		model.addAttribute("ordersDto", ordersDao.getTeam(ordersDto.getTeam()));
		return "seller/orders/content";
	}
}
