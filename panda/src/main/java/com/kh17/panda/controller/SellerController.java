package com.kh17.panda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh17.panda.entity.SellerDto;
import com.kh17.panda.repository.SellerDao;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerDao sellerDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "seller/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute SellerDto sellerDto) {
		sellerDao.regist(sellerDto);
		return "seller/regist_result";
	}
	
	@GetMapping("/edit")
	public String edit() {
		return "seller/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute SellerDto sellerDto, RedirectAttributes model) {
		sellerDao.edit(sellerDto);
		model.addAttribute("sellerDto", sellerDao.get(sellerDto.getId()));
		
		return "redirect:info";
	}
	
	@GetMapping("/login")
	public String login() {
		return "seller/login";
	}
}
