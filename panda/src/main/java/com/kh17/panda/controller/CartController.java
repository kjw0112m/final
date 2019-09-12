package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.CartDto;
import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.repository.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartDao cartDao;

	@PostMapping("/add")
	public String cart(@RequestParam(required = false, defaultValue = "0") int product_id,
			@RequestParam(required = false) String[] s_q, HttpSession session) {

		String member_id = (String) session.getAttribute("sid");

		for (String s : s_q) {
			String size = s.split("-")[0];
			int quantity = Integer.parseInt(s.split("-")[1]);
			cartDao.insert(CartDto.builder().member_id(member_id).product_id(product_id).quantity(quantity).sizes(size)
					.build());
		}

		return "redirect:view";
	}

	@GetMapping("/delete")
	public void delete(@RequestParam int[] id, HttpServletResponse resp) {
		for (int no : id) {
			cartDao.delete(no);
		}
	}

	@GetMapping("/view")
	public String view(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("sid");
		List<CartViewDto> list = cartDao.list(member_id);
		model.addAttribute("cList", list);
		return "cart/view";
	}

	@PostMapping("/quantity")
	public void quantityChange(@RequestParam int id, @RequestParam int quantity, HttpServletResponse resp) {
		cartDao.quantity(id, quantity);
	}
}
