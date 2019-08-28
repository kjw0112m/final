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
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.vo.OrderViewListVO;
import com.kh17.panda.vo.OrderViewVO;

@Controller
@RequestMapping("/seller/orders")
public class SellerOrderController {

	@Autowired
	private OrdersDao ordersDao;



	@GetMapping("/search")
	public String list(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page, HttpSession session,
			@RequestParam(required = false) String[] csStatus, @RequestParam(required = false) String[] tStatus) {
		if (orderViewDto.getSeller_id() != null) {
			int pagesize = 10;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;

			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);

			int count = ordersDao.count(orderViewDto, orderViewListVO.getSearch(), csStatus, tStatus);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}

			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);

			List<OrderViewVO> search = orderViewListVO.getSearch();

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
				}
			}

			List<OrderViewDto> list = ordersDao.list(orderViewDto, search, start, end, csStatus, tStatus);
			System.out.println(list);
			model.addAttribute("orderViewDto", list);
			model.addAttribute("searchCount", count);
			return "seller/orders/search";
		} else {
			model.addAttribute("orderViewDto", null);
			return "seller/orders/search";
		}
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
