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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.vo.OrderViewListVO;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CartDao cartDao;

	@GetMapping("/order")
	public String order(@RequestParam int product_id, HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("sid");

		if (product_id > 0) {
			ProductDto productDto = productDao.get(product_id);
			model.addAttribute("productDto", productDto);
		} else {
			List<CartViewDto> list = cartDao.list(member_id);
			model.addAttribute("cList", list);
		}

		return "orders/order";
	}

	@PostMapping("/order")
	public String order(@ModelAttribute OrdersDto ordersDto, Model model) {
		ordersDto.setId(ordersDao.seq());
		ordersDao.insert(ordersDto);

		return "orders/order_result";
	}

	@GetMapping("/list")
	public String list(@ModelAttribute OrderViewDto orderViewDto, Model model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = ordersDao.count(orderViewDto, null, null, null);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		List<OrderViewDto> list = ordersDao.list(orderViewDto, null, start, end, null, null);
		model.addAttribute("orderViewDto", list);
		return "orders/list";
	}

	@GetMapping("/cancel")
	public String cancel(@ModelAttribute OrderViewDto orderViewDto, RedirectAttributes model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		String cs_status = null;
		String pay_status = orderViewDto.getPay_status();
		if (pay_status.equals("입금완료") || pay_status.equals("결제완료")) {
			cs_status = "환불";
		} else if (pay_status.equals("입금전")) {
			cs_status = "취소";
		}

		OrdersDto ordersDto = OrdersDto.builder().cs_status(cs_status).team(orderViewDto.getTeam()).build();

		ordersDao.cancel(ordersDto);

		model.addAttribute("orderViewDto", orderViewDto);
		model.addAttribute("page", page);
		return "redirect:list";
	}
}
