package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.FollowDto;
import com.kh17.panda.entity.MyInfoDto;
import com.kh17.panda.entity.PointDto;
import com.kh17.panda.repository.FollowDao;
import com.kh17.panda.repository.PointDao;
import com.kh17.panda.service.MyInfoService;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	private PointDao pointDao;
	
	@Autowired
	private FollowDao followDao;

	@Autowired
	private MyInfoService myInfoService;

	@RequestMapping(value = { "/", "" })
	public String point(Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "1") int page) {

		String member_id = (String) session.getAttribute("sid");
		int pagesize = 20;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;

		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);

		int count = pointDao.count(member_id);
		int pageCount = (count - 1) / pagesize + 1;
		if (endBlock > pageCount) {
			endBlock = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("pageCount", pageCount);

		List<PointDto> pointList = pointDao.list(member_id, start, end);
		model.addAttribute("pointDto", pointList);

		MyInfoDto myInfo = myInfoService.myInfo(member_id);
		model.addAttribute("myInfo", myInfo);
		
		int follows = followDao.count(FollowDto.builder().member_id(member_id).build());
		model.addAttribute("follows", follows);
		return "point/list";
	}
}
