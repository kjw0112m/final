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

import com.kh17.panda.entity.CategoryDto;
import com.kh17.panda.entity.CategoryListDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.entity.ProductSellerDto;
import com.kh17.panda.entity.SubcategoryDto;
import com.kh17.panda.repository.CategoryDao;
import com.kh17.panda.repository.CategoryListDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.ProductSellerDao;
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
	private ProductSellerDao productSellerDao;

	@Autowired
	private CategoryListDao categoryListDao;

	@Autowired
	private CategoryDao categoryDao;

	@GetMapping("/newArrivals")
	public String newArrivals(Model model) {
		List<ProductSellerDto> list = productSellerDao.newArrivals();
		model.addAttribute("list", list);
		return "product/newArrivals";
	}

	@GetMapping("/sellerList")
	public String sellers(@RequestParam String seller_id, Model model) {
		List<ProductSellerDto> list = productSellerDao.sellerList(seller_id);
		model.addAttribute("list", list);
		model.addAttribute("seller_id", seller_id);
		return "product/sellerList";
	}

	@GetMapping("/subcategoryList")
	public String subcategorylist(@RequestParam int sub_category_id, Model model) {
		SubcategoryDto subcategoryDto = subcategoryDao.getDto(sub_category_id);
		List<ProductSellerDto> list = productSellerDao.categoryList(sub_category_id);
		model.addAttribute("list", list);
		model.addAttribute("subcategoryDto", subcategoryDto);
		return "product/subcategoryList";
	}

	@GetMapping("/categoryList")
	public String categorylist(@RequestParam int category_id, Model model) {
		CategoryDto categoryDto = categoryDao.get(category_id);
		List<CategoryListDto> list = categoryListDao.list(category_id);
		model.addAttribute("list", list);
		model.addAttribute("categoryDto", categoryDto);
		return "product/categoryList";
	}


	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
//		String seller_id = (String) session.getAttribute("sid");
		String seller_id = "abc";
		List<ProductDto> list = productDao.list(seller_id);
		model.addAttribute("list", list);
		return "product/list";
	}

}
