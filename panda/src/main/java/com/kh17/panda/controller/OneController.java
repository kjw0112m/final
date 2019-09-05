package com.kh17.panda.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.NoticeDto;
import com.kh17.panda.entity.OneDto;
import com.kh17.panda.repository.OneDao;




@Controller
@RequestMapping("/one")
public class OneController {
	
	@Autowired
	private OneDao oneDao;
	
	@RequestMapping("/oneList")
	public String oneList(OneDto dto, Model model, 
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "1") int page) {
//		page를 이용하여 시작번호와 종료번호를 구한다 - 게시글 분할이 완료
//		start = pagesize * page - (pagesize - 1)
//		end = pagesize * page
		int pagesize = 10;
		int start = pagesize * page - (pagesize - 1);
		int end = pagesize * page;
		
//		page를 이용하여 시작블록과 종료블록을 구한다 - 네비게이터 완료
//		 - 이 값들은 페이지에서 사용하므로 전달해줘야 한다
//		startBlock = (page - 1) / blocksize * blocksize + 1
//		endBlock = startBlock + (blocksize - 1)
		int blocksize = 10;
		int startBlock = (page - 1) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize - 1);
		
//		endBlock을 전체 게시글 수를 이용하여 조정
		int count = oneDao.count(type, keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<OneDto> list = oneDao.list(type, keyword, start, end);
		model.addAttribute("list", list);
		return "one/one_List";
	}
	
	@RequestMapping("/oneEdit")
	public String oneEdit(OneDto oneDto, Model model, 
			@RequestParam(required = false, defaultValue = "NEW") String mode,
			HttpServletRequest req) {
		
		if("EDIT".equals(mode)) {
			oneDto = oneDao.selectOne(req.getParameter("id"));
		}
		
		model.addAttribute("mode",mode);
		model.addAttribute("oneDto",oneDto);
		
		return "one/one_Edit";
	}
	
	@RequestMapping("/saveOne")
	public String saveOne(OneDto oneDto, Model model, HttpSession session, @RequestParam(required = false, defaultValue = "NEW") String mode) {
		oneDto.setMemberid(session.getAttribute("sid").toString());
		
		if("NEW".equals(mode)) {
			oneDao.insertOne(oneDto);
		}else {
			oneDao.updateOne(oneDto);
		}
		
		return oneList(oneDto, model, null, null, 1);
	}
	
	@RequestMapping("/delOne")
	public String delOne(OneDto oneDto, Model model) {
		oneDao.delOne(oneDto);
		return oneList(oneDto, model, null, null, 1);
	}
	
	@RequestMapping("/listOne")
	public String listOne(OneDto oneDto, Model model) {
		return oneList(oneDto, model, null, null, 1);
	}
	
	@RequestMapping("/saveComment")
	public String saveComment(OneDto oneDto, Model model, HttpSession session) {
		oneDto.setOnecommentuser(session.getAttribute("sid").toString());
		oneDao.updateComment(oneDto);
		
		return oneList(oneDto, model, null, null, 1);
	}
	
	
}

















