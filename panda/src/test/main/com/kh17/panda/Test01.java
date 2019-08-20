package com.kh17.panda;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
locations= {
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"
}
)
@WebAppConfiguration
public class Test01 {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		List<MemberDto> list = sqlSession.selectList("member.test");
		for(MemberDto memberDto : list) {
			System.out.println(memberDto);
		}
	}
	
}
