package com.kh17.panda;

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
	
	@Test
	public void test() {
		MemberDto memberDto = memberDao.get("ssssssss");
	System.out.println(memberDto);
	
	}
	
}
