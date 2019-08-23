package com.kh17.panda;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.vo.OrderViewListVO;
import com.kh17.panda.vo.OrderViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class Test02 {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrdersDao ordersDao;

	@Test
	public void test() {
		OrderViewDto orderViewDto = OrderViewDto.builder().member_id("5555555").build();
		List<OrderViewVO> orderlist = new ArrayList<>();
		orderlist.add(OrderViewVO.builder().type("product_name").keyword("로").build());
		orderlist.add(OrderViewVO.builder().keyword("2019").type("order_id").build());
		
		OrderViewListVO orderViewVO = OrderViewListVO.builder().search(orderlist).build();
		
		System.out.println(orderViewVO.getSearch().toString());

		List<OrderViewDto> list = ordersDao.list(orderViewDto, orderViewVO);

		System.out.println(list);
	}

}
