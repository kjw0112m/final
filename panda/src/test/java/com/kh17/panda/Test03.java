package com.kh17.panda;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.vo.OrderListVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class Test03 {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	SqlSession sqlSession;

	@Test
	public void test() {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", OrderViewDto.builder().member_id("55555555").build());
		map.put("start", 1);
		map.put("end", 10);
		List<OrderListVO> list = sqlSession.selectList("myOrder", map);
		for(OrderListVO vo : list) {
			System.out.println(vo);
		}
	}

}
