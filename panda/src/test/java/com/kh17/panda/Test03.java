package com.kh17.panda;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh17.panda.repository.FilesDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
public class Test03 {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FilesDao filesDao;
	
	@Test
	public void test() {
//		int seq = sqlSession.selectOne("files.seq");
//		System.out.println(seq);
//		seq = sqlSession.selectOne("files.seq");
//		System.out.println(seq);
//		seq = sqlSession.selectOne("files.seq");
//		System.out.println(seq);
//		seq = sqlSession.selectOne("files.seq");
//		System.out.println(seq);
//		seq = sqlSession.selectOne("files.seq");
//		System.out.println(seq);
		
		int main_id = filesDao.getSequenceNumber();
		int details_id = filesDao.getSequenceNumber();
		System.out.println(main_id);
		System.out.println(details_id);
	}
}
