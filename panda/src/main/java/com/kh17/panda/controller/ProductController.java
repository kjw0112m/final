package com.kh17.panda.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.CategoryDto;
import com.kh17.panda.entity.CategoryListDto;
import com.kh17.panda.entity.FilesDto;
import com.kh17.panda.entity.ProductSellerDto;
import com.kh17.panda.entity.SubcategoryDto;
import com.kh17.panda.repository.CategoryDao;
import com.kh17.panda.repository.CategoryListDao;
import com.kh17.panda.repository.FilesDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.ProductSellerDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.repository.SubcategoryDao;
import com.kh17.panda.service.ProductService;

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
	
	@Autowired
	private SizesDao sizesDao;
	
	@Autowired
	private FilesDao filesDao;

	@GetMapping("/newArrivals")
	public String newArrivals(
			Model model,
			@RequestParam (required = false, defaultValue = "1") int page) {
		
		int pagesize = 15;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = productSellerDao.count();
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		List<ProductSellerDto> list = productSellerDao.newArrivals(start, end);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		return "product/newArrivals";
	}

	@GetMapping("/sellerList")
	public String sellers(
			@RequestParam (required = false, defaultValue = "1") int page,
			@RequestParam String seller_id,
			Model model) {
		int pagesize = 8;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		int count = productSellerDao.count(seller_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		List<ProductSellerDto> list = productSellerDao.sellerList(seller_id, start, end);
		model.addAttribute("list", list);
		model.addAttribute("seller_id", seller_id);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		return "product/sellerList";
	}

	@GetMapping("/subcategoryList")
	public String subcategorylist(
			@RequestParam (required = false, defaultValue = "1") int page,
			@RequestParam int sub_category_id,
			Model model) {
		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = productSellerDao.count(sub_category_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		SubcategoryDto subcategoryDto = subcategoryDao.getDto(sub_category_id);
		List<ProductSellerDto> list = productSellerDao.categoryList(sub_category_id, start, end);
		int category_id = subcategoryDao.getCg(sub_category_id);
		List<SubcategoryDto> sclist = subcategoryDao.list(category_id);
		model.addAttribute("list", list);
		model.addAttribute("sclist", sclist);
		model.addAttribute("subcategoryDto", subcategoryDto);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		return "product/subcategoryList";
	}

	@GetMapping("/tops")
	public String topsList(
			HttpServletRequest request,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model) {
		
		model.addAttribute("address", request.getRequestURI());
		
		int category_id = 1;
		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = categoryListDao.count(category_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		CategoryDto categoryDto = categoryDao.get(category_id);
		List<CategoryListDto> list = categoryListDao.list(category_id, start, end);
		List<SubcategoryDto> sclist = subcategoryDao.list(category_id);
		model.addAttribute("list", list);
		model.addAttribute("sclist", sclist);
		model.addAttribute("categoryDto", categoryDto);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		return "product/categoryList";
	}
	
	@GetMapping("/bottoms")
	public String bottomsList(
			HttpServletRequest request,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model) {
		
		model.addAttribute("address", request.getRequestURI());
		
		int category_id = 2;
		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = categoryListDao.count(category_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
				
		CategoryDto categoryDto = categoryDao.get(category_id);
		List<CategoryListDto> list = categoryListDao.list(category_id, start, end);
		List<SubcategoryDto> sclist = subcategoryDao.list(category_id);
		model.addAttribute("list", list);
		model.addAttribute("sclist", sclist);
		model.addAttribute("categoryDto", categoryDto);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		return "product/categoryList";
	}
	
	@GetMapping("/acc")
	public String accList(
			HttpServletRequest request,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model) {
		model.addAttribute("address", request.getRequestURI());
		
		int category_id = 3;
		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = categoryListDao.count(category_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		CategoryDto categoryDto = categoryDao.get(category_id);
		List<CategoryListDto> list = categoryListDao.list(category_id, start, end);
		List<SubcategoryDto> sclist = subcategoryDao.list(category_id);
		model.addAttribute("list", list);
		model.addAttribute("sclist", sclist);
		model.addAttribute("categoryDto", categoryDto);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		return "product/categoryList";
	}
	
	@GetMapping("/salesList")
	public String salesList(
			Model model,
			@RequestParam (required = false, defaultValue = "1") int page) {
		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = productSellerDao.countSales();
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		List<ProductSellerDto> list = productSellerDao.salesList(start, end);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		return "product/salesList";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int product_id,
			Model model
			) {
		ProductSellerDto productSellerDto = productSellerDao.get(product_id);
		model.addAttribute("productSellerDto", productSellerDto);
		model.addAttribute("list", sizesDao.get(product_id));
		return "product/detail";
	}
	
	@GetMapping("/search")
	public String search(
			@RequestParam(required=false) String keyword,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model) {
		
		if(keyword != null) {	
			
			int pagesize = 12;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;
			
			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);
			
			int count = productSellerDao.countSearch(keyword);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}
			
		List<ProductSellerDto> list = productSellerDao.search(keyword, start, end);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		}
		return "product/search";
	}

	@GetMapping("/image")
	public ResponseEntity<ByteArrayResource> getImage(@RequestParam int id) throws IOException {
		FilesDto filesDto = filesDao.get(id);
		
		File file = new File("D:/upload/kh17/product", filesDto.getSavename());
		
		byte[] data = FileUtils.readFileToByteArray(file);
		ByteArrayResource res = new ByteArrayResource(data);
				
		return ResponseEntity.ok()
													//.contentType(filesDto.getType())
													.header(HttpHeaders.CONTENT_TYPE, filesDto.getType())
													.body(res);
	}
	
}
