package com.kh17.panda.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh17.panda.entity.CartViewDto;
import com.kh17.panda.entity.KakaoPayDto;
import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.entity.PointDto;
import com.kh17.panda.entity.SizesDto;
import com.kh17.panda.repository.CartDao;
import com.kh17.panda.repository.GradeDao;
import com.kh17.panda.repository.KakaopayDao;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.repository.PointDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.vo.KakaoPayCancelVO;
import com.kh17.panda.vo.OrderAddressVO;
import com.kh17.panda.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private CartDao cartDao;

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private GradeDao gradeDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private PointDao pointDao;

	@Autowired
	private KakaopayDao kakaopayDao;
	
	@Autowired
	private SizesDao sizesDao;

	@Override
	@Transactional
	public String order(OrdersDto ordersDto, int[] c_id, OrderAddressVO orderAddressVO, String[] re_phones,
			HttpSession session, String t_id) {
		StringBuffer re_phone = new StringBuffer();
		for (String s : re_phones) {
			re_phone.append(s);
		}

		// 기본 DTO 설정
		ordersDto.setMember_id((String) session.getAttribute("sid"));
		if (ordersDto.getPay_type().equals("카카오페이")) {
			ordersDto.setPay_status("결제완료");
			ordersDto.setT_status("배송준비중");
		} else if (ordersDto.getPay_type().equals("무통장입금"))
			ordersDto.setPay_status("입금전");
		ordersDto.setRe_phone(re_phone.toString());
		ordersDto.setRe_addr("[" + orderAddressVO.getPost_code() + "]" + orderAddressVO.getBasic_addr()
				+ orderAddressVO.getDetail_addr());

		int count = 0;
		String team = null;
//		장바구니에서 주문할 경우
		if (c_id != null) {
			List<CartViewDto> list = cartDao.list(c_id);

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
				cartDao.delete(cartViewDto.getCart_id());
				sizesDao.minus(SizesDto.builder().quantity(ordersDto.getQuantity()).product_id(ordersDto.getProduct_id()).sizes(ordersDto.getSizes()).build());
			}
		}
//		상품 상세화면에서 단일 주문할 경우
		else {
			@SuppressWarnings("unchecked")
			List<OrderVO> voList = (List<OrderVO>) session.getAttribute("orderVO");
			
			for (OrderVO orderVO : voList) {
				ordersDto.setId(ordersDao.seq());
				ordersDto.setQuantity(orderVO.getQuantity());
				ordersDto.setTotal_price(orderVO.getQuantity() * orderVO.getProductDto().getPrice());
				ordersDto.setSizes(orderVO.getSize());
				ordersDto.setProduct_id(orderVO.getProductDto().getId());

				if (count > 0) {
					ordersDto.setTeam(team);
				}

				ordersDao.insert(ordersDto);
				if (count == 0) {
					team = ordersDao.getOrderId(ordersDto.getId());
				}
				count++;
				sizesDao.minus(SizesDto.builder().quantity(ordersDto.getQuantity()).product_id(ordersDto.getProduct_id()).sizes(ordersDto.getSizes()).build());
			}
		}
		if (t_id != null)
			kakaopayDao.team(KakaoPayDto.builder().t_id(t_id).team(team).build());
		return team;
	}

	@Override
	@Transactional
	public void gradeCheck(HttpSession session) {
		String member_id = (String) session.getAttribute("sid");

		int total_amount = ordersDao.orderAmount(member_id);
		int grade = memberDao.get(member_id).getGrade_id();

		switch (grade) {
		case 1:
			if (gradeAmount(4) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(4).build());
			} else if (gradeAmount(3) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(3).build());
			} else if (gradeAmount(2) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(2).build());
			}
			break;
		case 2:
			if (gradeAmount(4) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(4).build());
			} else if (gradeAmount(3) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(3).build());
			}
			break;
		case 3:
			if (gradeAmount(4) <= total_amount) {
				memberDao.gradeChange(MemberDto.builder().id(member_id).grade_id(4).build());
			}
			break;
		case 4:
			break;
		}
	}

	public int gradeAmount(int i) {
		return gradeDao.get(i).getAmount();
	}

	@Override
	public void save(OrdersDto ordersDto, HttpSession session, int point, String[] item_name, String team) {
		String member_id = (String) session.getAttribute("sid");
		int grade = memberDao.get(member_id).getGrade_id();
		int rate = gradeDao.get(grade).getRate();
		int use = ordersDto.getDiscount_price();
		int save = (int) (ordersDto.getTotal_price() * rate / 100);

		StringBuffer items_name = new StringBuffer();
		for (String s : item_name) {
			items_name.append(s + "/");
		}

		if (use > 0) {
			pointDao.save(PointDto.builder().type("사용").use_point(use).current_point(point - use)
					.content(items_name.substring(0, items_name.length() - 1)).member_id(member_id).team(team).build());
		}
		pointDao.save(PointDto.builder().type("대기").use_point(save)
				.content(items_name.substring(0, items_name.length() - 1)).member_id(member_id).team(team).build());
	}

	@Override
	public void cancelOrder(String tid, int total_amount, Model model) throws URISyntaxException {

		RestTemplate template = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK fcbd26f3de78094b5e8d5ca18b4b7c3b");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);

		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", tid);
		params.add("cancel_amount", String.valueOf(total_amount));
		params.add("cancel_tax_free_amount", "0");

		HttpEntity<MultiValueMap<String, String>> send = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");

		KakaoPayCancelVO cancel = template.postForObject(uri, send, KakaoPayCancelVO.class);

//		model.addAttribute("cancel", cancel);
		kakaopayDao.delete(tid);
	}

}
