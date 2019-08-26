package com.kh17.panda;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.repository.OrdersDao;
import com.kh17.panda.vo.OrderViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class Test02 {
	Logger logger = LoggerFactory.getLogger(getClass());


	@Autowired
	private MemberDao memberDao;

	@Autowired
	private OrdersDao ordersDao;

	@Test
	public void test() {
		OrderViewDto orderViewDto = OrderViewDto.builder().status("결제완").build();
		List<OrderViewVO> orderlist = new ArrayList<>();
		orderlist.add(OrderViewVO.builder().type("product_name").keyword("로").build());
		orderlist.add(OrderViewVO.builder().keyword("2019").type("order_id").build());
		
		
		System.out.println(orderlist);
		System.out.println(orderViewDto);
		int start = 1;
		int end = 10;
		List<OrderViewDto> list = ordersDao.list(orderViewDto, orderlist, start, end);
		
		
		System.out.println(list);
	}

}
