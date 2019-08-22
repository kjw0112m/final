package com.kh17.panda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.entity.SellerDto;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.SellerDao;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@GetMapping("/newArrivals")
	public String newArrivals(Model model) {
		List<ProductDto> list = productDao.newArrivals();
		model.addAttribute("list", list);
		return "product/newArrivals";
	}
	
	@GetMapping("/sellers")
	public String sellers(Model model) {
		List<SellerDto> list = sellerDao.list();
		model.addAttribute("list", list);
		return "product/sellers";
	}
	
	@GetMapping("/nickList")
	public String nickList(
			@RequestParam String nickname, 
			Model model) {
		List<ProductDto> list = productDao.nickList(nickname);
		model.addAttribute("list", list);
		model.addAttribute("nickname", nickname);
		return "product/nickList";
	}
	
	@GetMapping("/categoryList")
	public String categorylist(
			@RequestParam String name,
			Model model) {
		List<ProductDto> list = productDao.categoryList(name);
		model.addAttribute("list", list);
		model.addAttribute("name", name);
		return "product/categoryList";
	}
	
	
}
