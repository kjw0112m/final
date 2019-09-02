package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.CartDto;
import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.repository.CartDao;

@Controller
@RequestMapping("/cart")
public class CartController {
//	기능 실행을 위한 dao를 선언
	@Autowired
	private CartDao cartDao;
	
	@GetMapping("/add")
//	장바구니 추가를 눌렀을 때 넘어오는 파라미터값 두개를 받는다.
	public String cart(@ModelAttribute CartDto cartDto) {
//		카트 담기		
		cartDao.insert(cartDto);
		
//		장바구니 페이지로 이동
		return "redirect:view";
	}
	
	@GetMapping("/delete")
	public void delete(@RequestParam int[] id, HttpServletResponse resp) {
		for(int no : id) {
			cartDao.delete(no);
		}
	}
	
	@GetMapping("/view")
	public String view(Model model, HttpSession session) {
//		카트 목록 불러오기
		String member_id = (String) session.getAttribute("sid");
		List<CartViewDto> list = cartDao.list(member_id); 
		model.addAttribute("cList",list);
		
		return "cart/view"; 
	}
	
	@PostMapping("/quantity")
	public void quantityChange(@RequestParam int id, @RequestParam int quantity, HttpServletResponse resp) {
		cartDao.quantity(id, quantity);
	}
}
