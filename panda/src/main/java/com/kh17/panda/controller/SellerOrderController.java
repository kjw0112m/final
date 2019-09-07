package com.kh17.panda.controller;

import java.util.ArrayList;
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

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.entity.TransportDto;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.TransportDao;
import com.kh17.panda.vo.OrderListVO;
import com.kh17.panda.vo.OrderViewListVO;
import com.kh17.panda.vo.OrderViewVO;

@Controller
@RequestMapping("/seller/orders")
public class SellerOrderController {

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private TransportDao transportDao;

	@GetMapping("/search")
	public String list() {
		return "seller/orders/search";
	}

	@PostMapping("/search")
	public String list(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "10") int rows,HttpSession session,
			@RequestParam(required = false) String[] csStatus, @RequestParam(required = false) String[] tStatus) {
		if (session.getAttribute("sid") != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;

			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);

			List<OrderViewVO> search = orderViewListVO.getSearch();

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}

			int count = ordersDao.count(orderViewDto, search, csStatus, tStatus);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}
			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);

			List<OrderViewDto> list = ordersDao.list(orderViewDto, search, start, end, csStatus, tStatus);
			model.addAttribute("orderViewDto", list);
			model.addAttribute("searchCount", count);
			return "seller/orders/search";
		} else {
			model.addAttribute("orderViewDto", null);
			return "seller/orders/search";
		}
	}

	public void deTab(Model model, String seller_id) {
		int before = ordersDao.deliveryCount(OrderViewDto.builder().pay_status("입금전").build());
		int complete = ordersDao.deliveryCount(OrderViewDto.builder().t_status("배송완료").build());
		int ready = ordersDao.deliveryCount(OrderViewDto.builder().t_status("배송준비중").build());
		int shipping = ordersDao.deliveryCount(OrderViewDto.builder().t_status("배송중").build());
		int waiting = ordersDao.deliveryCount(OrderViewDto.builder().t_status("배송대기").build());
		model.addAttribute("before", before);
		model.addAttribute("complete", complete);
		model.addAttribute("ready", ready);
		model.addAttribute("shipping", shipping);
		model.addAttribute("waiting", waiting);
	}

	@GetMapping("/delivery/before_deposit")
	public String delivery(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "10") int rows, HttpSession session) {
		String seller_id = (String) session.getAttribute("sid");
		orderViewDto.setPay_status("입금전");

		deTab(model, seller_id);

		if (seller_id != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;

			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);

			List<OrderViewVO> search = orderViewListVO.getSearch();

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}

//			orderViewDto.setSeller_id("abc");
			int count = ordersDao.count(orderViewDto, search);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}

			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);

			List<OrderListVO> list = ordersDao.list(orderViewDto, search, start, end);
			model.addAttribute("orderListVO", list);
			model.addAttribute("searchCount", count);

			return "seller/orders/delivery/before_deposit";
		} else {
			model.addAttribute("orderListVO", null);
			return "seller/orders/delivery/before_deposit";
		}
	}

	@GetMapping("/delivery/ready")
	public String ready(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int rows, HttpSession session) {
		String seller_id = (String) session.getAttribute("sid");
		orderViewDto.setT_status("배송준비중");

		deTab(model, seller_id);

		if (seller_id != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;

			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);

			List<OrderViewVO> search = orderViewListVO.getSearch();

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}

			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}

			int count = ordersDao.count(orderViewDto, search);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}

			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);

			List<OrderListVO> list = ordersDao.list(orderViewDto, search, start, end);

			model.addAttribute("orderListVO", list);
			model.addAttribute("searchCount", count);

			List<TransportDto> tList = transportDao.list();

			model.addAttribute("transportDto", tList);

			return "seller/orders/delivery/ready";
		} else {
			model.addAttribute("orderListVO", null);
			return "seller/orders/delivery/ready";
		}
	}
	
	@GetMapping("/delivery/waiting")
	public String wating(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int rows, HttpSession session) {
		String seller_id = (String) session.getAttribute("sid");
		orderViewDto.setT_status("배송대기");
		
		deTab(model, seller_id);
		
		if (seller_id != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;
			
			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);
			
			List<OrderViewVO> search = orderViewListVO.getSearch();
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}
			
			int count = ordersDao.count(orderViewDto, search);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}
			
			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);
			
			List<OrderListVO> list = ordersDao.list(orderViewDto, search, start, end);
			
			model.addAttribute("orderListVO", list);
			model.addAttribute("searchCount", count);
			
			List<TransportDto> tList = transportDao.list();
			
			model.addAttribute("transportDto", tList);
			
			return "seller/orders/delivery/waiting";
		} else {
			model.addAttribute("orderListVO", null);
			return "seller/orders/delivery/waiting";
		}
	}
	
	@GetMapping("/delivery/shipping")
	public String shipping(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page,@RequestParam(required = false, defaultValue = "10") int rows, HttpSession session) {
		String seller_id = (String) session.getAttribute("sid");
		orderViewDto.setT_status("배송중");
		
		deTab(model, seller_id);
		
		if (seller_id != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;
			
			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);
			
			List<OrderViewVO> search = orderViewListVO.getSearch();
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}
			
			int count = ordersDao.count(orderViewDto, search);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}
			
			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);
			
			List<OrderListVO> list = ordersDao.list(orderViewDto, search, start, end);
			
			model.addAttribute("orderListVO", list);
			model.addAttribute("searchCount", count);
			
			List<TransportDto> tList = transportDao.list();
			
			model.addAttribute("transportDto", tList);
			
			return "seller/orders/delivery/shipping";
		} else {
			model.addAttribute("orderListVO", null);
			return "seller/orders/delivery/shipping";
		}
	}
	
	@GetMapping("/delivery/complete")
	public String complete(@ModelAttribute OrderViewDto orderViewDto, @ModelAttribute OrderViewListVO orderViewListVO,
			Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "10") int rows,HttpSession session) {
		String seller_id = (String) session.getAttribute("sid");
		orderViewDto.setT_status("배송완료");
		
		deTab(model, seller_id);
		
		if (seller_id != null) {
			int pagesize = rows;
			int start = pagesize * page - (pagesize - 1);
			int end = pagesize * page;
			
			int blocksize = 10;
			int startBlock = (page - 1) / blocksize * blocksize + 1;
			int endBlock = startBlock + (blocksize - 1);
			
			List<OrderViewVO> search = orderViewListVO.getSearch();
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getKeyword().isEmpty()) {
					search.remove(i);
					i--;
				}
			}
			
			for (int i = 0; i < search.size(); i++) {
				if (search.get(i).getType() == null) {
					search.remove(i);
				}
			}
			
			int count = ordersDao.count(orderViewDto, search);
			int pageCount = (count - 1) / pagesize + 1;
			if (endBlock > pageCount) {
				endBlock = pageCount;
			}
			
			model.addAttribute("page", page);
			model.addAttribute("startBlock", startBlock);
			model.addAttribute("endBlock", endBlock);
			model.addAttribute("pageCount", pageCount);
			
			List<OrderListVO> list = ordersDao.list(orderViewDto, search, start, end);
			
			model.addAttribute("orderListVO", list);
			model.addAttribute("searchCount", count);
			
			List<TransportDto> tList = transportDao.list();
			
			model.addAttribute("transportDto", tList);
			
			return "seller/orders/delivery/complete";
		} else {
			model.addAttribute("orderListVO", null);
			return "seller/orders/delivery/complete";
		}
	}

	@PostMapping("/delivery/before_deposit/confirm")
	public void deposit_comfirm(@RequestParam String[] idAry, HttpServletResponse resp) {
		for (String team : idAry) {
			ordersDao.pay_change(OrdersDto.builder().team(team).pay_status("입금완료").build());
			ordersDao.t_change(OrdersDto.builder().team(team).t_status("배송준비중").build());
		}
	}

	@PostMapping("/delivery/ready/invoice")
	public void invoice(@ModelAttribute OrdersDto ordersDto, @RequestParam String[] idAry, HttpServletResponse resp) {
		if (ordersDto.getT_invoice() != null) {
			for (String team : idAry) {
				ordersDto.setTeam(team);
				ordersDao.invoice(ordersDto);
				ordersDao.t_change(ordersDto);
				break;
			}
		}
	}
	@PostMapping("/delivery/waiting/ready")
	public void ready(@ModelAttribute OrdersDto ordersDto, @RequestParam String[] idAry, HttpServletResponse resp) {
			for (String order_id : idAry) {
				ordersDto.setOrder_id(order_id);;
				ordersDao.t_change(ordersDto);
				ordersDao.detach(order_id);
			}
	}
	
	@PostMapping("/delivery/waiting/shipping")
	public void shipping(@ModelAttribute OrdersDto ordersDto, @RequestParam String[] idAry, HttpServletResponse resp) {
			for (String team : idAry) {
				ordersDto.setTeam(team);
				ordersDao.t_change(ordersDto);
				break;
			}
	}
	
	@PostMapping("/delivery/shipping/complete")
	public void complete(@ModelAttribute OrdersDto ordersDto, @RequestParam String[] idAry, HttpServletResponse resp) {
		for (String team : idAry) {
			ordersDto.setTeam(team);
			ordersDao.t_change(ordersDto);
		}
	}

	@PostMapping("/delivery/ready/detach")
	public void detach(@RequestParam String[] idAry, HttpServletResponse resp) {
		for (String order_id : idAry) {
			ordersDao.detach(order_id);
		}
	}

	@GetMapping("/content")
	public String cotent(@ModelAttribute OrdersDto ordersDto, Model model) {
		model.addAttribute("ordersDto", ordersDao.getTeam(ordersDto.getTeam()));
		return "seller/orders/content";
	}
}
