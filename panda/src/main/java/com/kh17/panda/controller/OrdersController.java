package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.vo.OrderAddressVO;
import com.kh17.panda.vo.OrderListVO;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CartDao cartDao;

	@Autowired
	private MemberDao memberDao;

	@GetMapping("/result")
	public String result() {
		return "orders/result";
	}

	@GetMapping("/order")
	public String order(@RequestParam(required = false, defaultValue = "0") int product_id,
			@RequestParam(required = false) String[] sizes, @RequestParam(required = false) int[] id,
			@RequestParam String totalPrice, HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("sid");
		if (product_id > 0) {
			ProductDto productDto = productDao.get(product_id);
			model.addAttribute("productDto", productDto);
		} else {
			List<CartViewDto> list = cartDao.list(id);
			model.addAttribute("cartList", list);
			model.addAttribute("orderCount", list.size());
		}
		model.addAttribute("memberDto", memberDao.get(member_id));
		model.addAttribute("totalPrice", totalPrice);
		return "orders/order";
	}

	@PostMapping("/order")
	public String order(@ModelAttribute OrdersDto ordersDto, @RequestParam(required = false) int[] c_id,
			@ModelAttribute OrderAddressVO orderAddressVO, @RequestParam(required = false) String[] re_phones,
			Model model, HttpSession session) {
		StringBuffer re_phone = new StringBuffer();
		for (String s : re_phones) {
			re_phone.append(s);
		}

		// 기본 DTO 설정
		ordersDto.setMember_id((String) session.getAttribute("sid"));
		if (ordersDto.getPay_type().equals("카카오페이")) {
			ordersDto.setPay_status("결제완료");
			ordersDto.setT_status("배송준비중");
		}
		else if (ordersDto.getPay_type().equals("무통장입금"))
			ordersDto.setPay_status("입금전");
		ordersDto.setRe_phone(re_phone.toString());
		ordersDto.setRe_addr("[" + orderAddressVO.getPost_code() + "]" + orderAddressVO.getBasic_addr()
				+ orderAddressVO.getDetail_addr());

//		장바구니에서 주문할 경우
		if (c_id.length > 0) {
			List<CartViewDto> list = cartDao.list(c_id);
			int count = 0;
			String team = null;

			for (CartViewDto cartViewDto : list) {
				ordersDto.setId(ordersDao.seq());
				ordersDto.setQuantity(cartViewDto.getQuantity());
				ordersDto.setTotal_price(cartViewDto.getQuantity() * cartViewDto.getProduct_price());
				ordersDto.setSizes(cartViewDto.getSizes());
				ordersDto.setProduct_id(cartViewDto.getProduct_id());

				if (count > 0) {
					ordersDto.setTeam(team);
				}

				ordersDao.insert(ordersDto);
				if (count == 0) {
					team = ordersDao.getOrderId(ordersDto.getId());
				}
				count++;
			}
		}
//		상품 상세화면에서 단일 주문할 경우
		else {
			ordersDto.setId(ordersDao.seq());
			ordersDto.setRe_phone(re_phone.toString());
			ordersDto.setRe_addr("[" + orderAddressVO.getPost_code() + "]" + orderAddressVO.getBasic_addr()
					+ orderAddressVO.getDetail_addr());
			ordersDao.insert(ordersDto);
		}

		return "orders/result";
	}

	@GetMapping("/list")
	public String list(@ModelAttribute OrderViewDto orderViewDto, Model model,
			@RequestParam(required = false, defaultValue = "1") int page, HttpSession session) {

		String member_id = (String) session.getAttribute("sid");
		orderViewDto.setMember_id(member_id);
		int pagesize = 5;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = ordersDao.count(orderViewDto);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}

		List<OrderListVO> list = ordersDao.list(orderViewDto, start, end);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("myOrder", list);

		return "orders/list";
	}

	@GetMapping("/detail/{team}")
	public String detail(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			List<OrderViewDto> list = ordersDao.list(team);
			int price = 0;
			for(OrderViewDto dto : list) {
				price+=dto.getTotal_price();
			}
			
			model.addAttribute("price", price);
			model.addAttribute("orderViewDto", list);
		}
		return "orders/detail";
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

//		ordersDao.cancel(ordersDto);

		model.addAttribute("orderViewDto", orderViewDto);
		model.addAttribute("page", page);
		return "redirect:list";
	}
}
