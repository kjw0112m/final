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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.repository.SubcategoryDao;
import com.kh17.panda.service.ProductService;
import com.kh17.panda.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private SubcategoryDao subcategoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SizesDao sizesDao;
	
	@GetMapping("/regist")
	public String regist(Model model) {
		model.addAttribute("list", subcategoryDao.list());
		return "product/regist";		
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute ProductVO vo,
			HttpSession session,
			MultipartRequest mRequest,
			Model model) {
//		vo.setSeller_id((String) session.getAttribute("sid"));
		vo.setSeller_id("abc");
		int id = productService.regist(vo);
		
		return "product/regist_result";
	}
	
	@GetMapping("/edit")
	public String edit(
			@RequestParam int id,
			Model model
			) {
		ProductDto productDto = productDao.get(id);
		model.addAttribute("productDto", productDto);
		model.addAttribute("list", sizesDao.get(id));
		model.addAttribute("subcategory", subcategoryDao.get(productDto.getSub_category_id()));
		return "product/edit";
	}
	
	@PostMapping("/edit")
	public String edit(
			@ModelAttribute ProductVO vo,
			RedirectAttributes model,
			HttpSession session) {
		productService.edit(vo);
		
		model.addAttribute("id", (String) session.getAttribute("sid"));
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int id) {
		productDao.delete(id);
		return "redirect:list";
	}
	
	
	@GetMapping("/list")
	public String list(HttpSession session,
			Model model) {
//		String seller_id = (String) session.getAttribute("sid");
		String seller_id = "abc";
		List<ProductDto> list = productDao.list(seller_id);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	
	
	
}
