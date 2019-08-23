package com.kh17.panda;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class Test01 {

	private MockMvc mock;
	
	@Autowired
	private WebApplicationContext context;
	
	@Before
	public void prepare() {
		mock = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void test() throws Exception {
		mock.perform(
				get("/orders/list")
				.param("searchType", "1")
				.param("searchType", "2")
				.param("searchType", "3")
				.param("searchType", "4")
				.param("searchType", "5")
				.param("searchKeyword", "11")
				.param("searchKeyword", "12")
				.param("searchKeyword", "13")
				.param("searchKeyword", "14")
				.param("searchKeyword", "15")
		).andDo(print()).andExpect(status().is2xxSuccessful()).andReturn();
	}
	
}
