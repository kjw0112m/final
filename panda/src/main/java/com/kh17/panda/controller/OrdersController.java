package com.kh17.panda.controller;

import java.net.URISyntaxException;
import java.util.ArrayList;
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
import com.kh17.panda.entity.KakaoPayDto;
import com.kh17.panda.entity.MyInfoDto;
import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.entity.PointDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.entity.SizesDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.KakaopayDao;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.PointDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.service.MyInfoService;
import com.kh17.panda.service.OrderService;
import com.kh17.panda.vo.OrderAddressVO;
import com.kh17.panda.vo.OrderListVO;
import com.kh17.panda.vo.OrderVO;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CartDao cartDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PointDao pointDao;

	@Autowired
	private KakaopayDao kakaopayDao;

	@Autowired
	private MyInfoService myInfoService;
	
	@Autowired
	private SizesDao sizesDao;

	@GetMapping("/result")
	public String result() {
		return "orders/result";
	}

	@PostMapping("/order_form")
	public String order(@RequestParam(required = false, defaultValue = "0") int product_id,
			@RequestParam(required = false) String[] s_q, @RequestParam(required = false) int[] id,
			@RequestParam int totalPrice, HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("sid");
		int point = pointDao.current(member_id);
		List<OrderVO> voList = new ArrayList<>();
		if (product_id > 0) {
			ProductDto productDto = productDao.get(product_id);
			for (String s : s_q) {
				String size = s.split("-")[0];
				int quantity = Integer.parseInt(s.split("-")[1]);
				voList.add(OrderVO.builder().productDto(productDto).size(size).quantity(quantity).build());
			}
			session.setAttribute("orderVO", voList);
			model.addAttribute("orderCount", voList.size());
		} else {
			List<CartViewDto> list = cartDao.list(id);
			model.addAttribute("cartList", list);
			model.addAttribute("orderCount", list.size());
		}
		model.addAttribute("memberDto", memberDao.get(member_id));
		model.addAttribute("totalPrice", totalPrice);
		int canPoint = (int) ((totalPrice * 0.5) / 100 * 100);
		if (point >= canPoint)
			model.addAttribute("canPoint", canPoint);
		else
			model.addAttribute("canPoint", (int) ((point) / 100 * 100));
		model.addAttribute("point", point);
		return "orders/order";
	}

	@PostMapping("/order")
	public String order(@ModelAttribute OrdersDto ordersDto, @RequestParam(required = false) int[] c_id,
			@ModelAttribute OrderAddressVO orderAddressVO, @RequestParam(required = false) String[] re_phones,
			@RequestParam(required = false) String t_id, @RequestParam int point, @RequestParam String[] item_name,
			Model model, HttpSession session) {
		String team = orderService.order(ordersDto, c_id, orderAddressVO, re_phones, session, t_id);
		session.removeAttribute("orderVO");

		orderService.save(ordersDto, session, point, item_name, team);
		orderService.gradeCheck(session);
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

		MyInfoDto myInfo = myInfoService.myInfo(member_id);
		model.addAttribute("myInfo", myInfo);
		return "orders/list";
	}

	@GetMapping("/stat_list")
	public String statList(@ModelAttribute OrderViewDto orderViewDto, Model model,
			@RequestParam(required = false, defaultValue = "1") int page, HttpSession session) {

		String member_id = (String) session.getAttribute("sid");
		orderViewDto.setMember_id(member_id);
		int pagesize = 5;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = ordersDao.statCount(orderViewDto);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}

		List<OrderListVO> list = ordersDao.statList(orderViewDto, start, end);
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("myOrder", list);

		MyInfoDto myInfo = myInfoService.myInfo(member_id);
		model.addAttribute("myInfo", myInfo);
		return "orders/stat_list";
	}

	@GetMapping("/confirm/{team}")
	public String confirm(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			ordersDao.pay_change(OrdersDto.builder().pay_status("구매확정").team(team).build());
			pointDao.typeChange(PointDto.builder().type("적립").team(team).build());
		}
		return "redirect:list";
	}

	@GetMapping("/detail/{team}")
	public String detail(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			List<OrderViewDto> list = ordersDao.list(team);
			int price = 0;
			for (OrderViewDto dto : list) {
				price += dto.getTotal_price();
			}

			model.addAttribute("price", price);
			model.addAttribute("orderViewDto", list);
			model.addAttribute("point", list.get(0).getDiscount_price());
		}
		return "orders/detail";
	}

	@GetMapping("/csList")
	public String csList(@ModelAttribute OrderViewDto orderViewDto, RedirectAttributes model,
			@RequestParam(required = false, defaultValue = "1") int page) {
		return "redirect:csList";
	}

	@GetMapping("/cancel/{team}")
	public String cancel(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			List<OrderViewDto> list = ordersDao.list(team);

			model.addAttribute("orderViewDto", list);
		}
		return "orders/cancel";
	}

	@GetMapping("/exchange/{team}")
	public String exchange(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			List<OrderViewDto> list = ordersDao.list(team);

			model.addAttribute("orderViewDto", list);
		}
		return "orders/exchange";
	}

	@GetMapping("/return/{team}")
	public String returns(@PathVariable String team, Model model, HttpSession session) {
		String id = (String) session.getAttribute("sid");

		if (id != null) {
			List<OrderViewDto> list = ordersDao.list(team);

			model.addAttribute("orderViewDto", list);
		}
		return "orders/return";
	}

	@PostMapping("/cancel")
	public String cancel(@RequestParam String[] order_id, @RequestParam String team, @RequestParam String pay_status,
			@RequestParam int discount_price, Model model, HttpSession session) throws URISyntaxException {
		String id = (String) session.getAttribute("sid");
		List<OrdersDto> cancelList = ordersDao.cancelInfo(team);
		KakaoPayDto kakaoPayDto = kakaopayDao.get(team);

		if (id != null) {
			for (String order : order_id) {
				if (pay_status.equals("무통장입금"))
					ordersDao.cs_change(OrdersDto.builder().cs_status("환불").order_id(order).build());
				else
					ordersDao.cs_change(OrdersDto.builder().cs_status("취소").team(team).build());
				ordersDao.t_change(OrdersDto.builder().t_status("").team(team).build());
				ordersDao.pay_change(OrdersDto.builder().pay_status("").team(team).build());
				break;
			}
		}

		int current = pointDao.current(id);
		int cancel = pointDao.getPoint(team);

		if (discount_price > 0) {
			pointDao.save(
					PointDto.builder().type("반환").use_point(discount_price).current_point(current + discount_price)
							.content("주문취소로 인한 포인트 반환").member_id(id).team(team).build());
		}
		pointDao.cancel(PointDto.builder().type("대기").team(team).build());
		
		for(OrdersDto dto : cancelList) {
			sizesDao.plus(SizesDto.builder().product_id(dto.getProduct_id()).quantity(dto.getQuantity()).sizes(dto.getSizes()).build());
		}
		
		if (kakaoPayDto != null)
			orderService.cancelOrder(kakaoPayDto.getT_id(), kakaoPayDto.getTotal_amount(), model);
		return "redirect:list";
	}

	@PostMapping("/return")
	public String returns(@RequestParam String[] order_id, @RequestParam String pay_status, Model model,
			HttpSession session) {
		String id = (String) session.getAttribute("sid");
		if (id != null) {
			for (String order : order_id) {
				ordersDao.cs_change(OrdersDto.builder().cs_status("반품").order_id(order).build());
				ordersDao.t_change(OrdersDto.builder().t_status("").order_id(order).build());
				ordersDao.pay_change(OrdersDto.builder().pay_status("").order_id(order).build());
			}
		}
		return "redirect:list";
	}

	@PostMapping("/exchange")
	public String exchange(@RequestParam String[] order_id, @RequestParam String pay_status, Model model,
			HttpSession session) {
		String id = (String) session.getAttribute("sid");
		if (id != null) {
			for (String order : order_id) {
				ordersDao.cs_change(OrdersDto.builder().cs_status("교환").order_id(order).build());
				ordersDao.t_change(OrdersDto.builder().t_status("").order_id(order).build());
				ordersDao.pay_change(OrdersDto.builder().pay_status("").order_id(order).build());
			}
		}
		return "redirect:list";
	}
}
