package com.kh17.panda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kh17.panda.entity.FollowDto;
import com.kh17.panda.repository.FollowDao;
import com.kh17.panda.repository.SellerDao;

@Controller
public class FollowController {
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired
	private SellerDao sellerDao;
	
	@GetMapping("/follow")
	public void follow(@ModelAttribute FollowDto followDto,HttpServletResponse resp) throws IOException {
		followDao.follow(followDto);
		int count = followDao.count(FollowDto.builder().seller_id(followDto.getSeller_id()).build());
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(count);
	}
	
	@GetMapping("/unfollow")
	public void unFollow(@ModelAttribute FollowDto followDto,HttpServletResponse resp) throws IOException {
		followDao.unFollow(followDto);
		int count = followDao.count(FollowDto.builder().seller_id(followDto.getSeller_id()).build());
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(count);
	}
	
	@GetMapping("/follow/list")
	public String list(Model model, HttpSession session) {
		String member_id = (String) session.getAttribute("sid");
		
		List<FollowDto> list = followDao.list(member_id);
		int count = followDao.count(FollowDto.builder().member_id(member_id).build());
		model.addAttribute("followDto", list);
		model.addAttribute("follows", count);
		return "follow/list";
	}
}
