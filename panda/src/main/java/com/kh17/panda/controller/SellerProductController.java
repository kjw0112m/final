package com.kh17.panda.controller;

import java.io.File;
import java.io.IOException;
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
import com.kh17.panda.entity.ProductSubcategoryDto;
import com.kh17.panda.repository.FilesDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.ProductSubcategoryDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.repository.SubcategoryDao;
import com.kh17.panda.service.ProductService;
import com.kh17.panda.vo.ProductVO;

@Controller
@RequestMapping("/seller/product")
public class SellerProductController {
	
	@Autowired
	private SubcategoryDao subcategoryDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SizesDao sizesDao;
	
	@Autowired
	private ProductSubcategoryDao productSubcategoryDao;
	
	@Autowired
	private FilesDao filesDao;
	
	@GetMapping("/regist")
	public String regist(Model model) {
		model.addAttribute("list", subcategoryDao.list());
		return "seller/product/regist";		
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute ProductVO vo,
			HttpSession session,
			MultipartRequest mRequest,
			Model model) throws IllegalStateException, IOException {

		vo.setSeller_id((String) session.getAttribute("ssid"));
//		vo.setSeller_id("abc");
		//id를 반환해서 사용할지 말지 결정
		int id = productService.regist(vo);

		return "redirect:list";
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
		return "seller/product/edit";
	}
	@PostMapping("/edit")
	public String edit(
			@ModelAttribute ProductVO vo,
			RedirectAttributes model,
			HttpSession session) throws IllegalStateException, IOException {
		productService.edit(vo);
		
		model.addAttribute("id", (String) session.getAttribute("ssid"));
		return "redirect:list";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int[] product_id) {
		
		for(int id : product_id) {
			ProductDto productDto = productDao.get(id);
			int main = 0;
			int detail = 0;
			if(productDto.getMainfile() != 0) {
				main = productDto.getMainfile();				
			}
			if(productDto.getDetailfile() != 0) {
				detail = productDto.getDetailfile();				
			}
			
			//상품 삭제
			productDao.delete(id);
			
			if(main != 0) {
				//메인 이미지 삭제(물리+DB)
				String mainsv = filesDao.getSaveName(main);
				File file1 = new File("D:/upload/kh17/product", mainsv);
				file1.delete();
				filesDao.delete(main);
			}
			if(detail != 0) {
				//상세 이미지 삭제(물리+DB)
				String detailsv = filesDao.getSaveName(detail);
				File file2 = new File("D:/upload/kh17/product", detailsv);
				file2.delete();
				filesDao.delete(detail);				
			}
		}
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String list1(
			HttpSession session,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model) {

		String seller_id = (String) session.getAttribute("ssid");
//		String seller_id = "abc";

		
		int pagesize = 10;
		int start = 1;
		int end = 10;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count;
		if(seller_id != null) {
			count = productSubcategoryDao.count(seller_id, null, null);
		}
		else {
			count = productSubcategoryDao.count(null, null, null);
		}
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		List<ProductSubcategoryDto> list = productSubcategoryDao.list(seller_id, start, end);
		model.addAttribute("list", list);
		return "seller/product/list";
	}
	
	@PostMapping("/list")
	public String list2(
			HttpSession session,
			@RequestParam (required = false) String type,
			@RequestParam (required = false) String keyword,
			@RequestParam (required = false, defaultValue = "1") int page,
			Model model
			) {
		String seller_id = (String) session.getAttribute("ssid");
//		String seller_id = "abc";

		
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = productSubcategoryDao.count(seller_id, type, keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		
		if(type != null && keyword != null) {
			List<ProductSubcategoryDto> list = productSubcategoryDao.search(type, keyword, start, end, seller_id);
			model.addAttribute("keyword", keyword);
			model.addAttribute("type", type);
			model.addAttribute("list", list);
		}
		else {
			List<ProductSubcategoryDto> list = productSubcategoryDao.list(seller_id, start, end);
			model.addAttribute("list", list);
		}
		return "seller/product/list";
	}
	
}
