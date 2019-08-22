package com.kh17.panda.controller;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh17.panda.entity.NoticeDto;
import com.kh17.panda.repository.NoticeDao;




@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;

	@RequestMapping("/noticeList")
	public String noticeList(NoticeDto dto, Model model, 
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
		int count = noticeDao.count(type, keyword);
		int pageCount = (count - 1) / pagesize + 1;
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		
		List<NoticeDto> list = noticeDao.list(type, keyword, start, end);
		model.addAttribute("list", list);
		return "notice/notice_list";
	}
	
	@RequestMapping("/noticeEdit")
	public String noticeEdit(NoticeDto noticeDto, Model model, 
			@RequestParam(required = false, defaultValue = "NEW") String mode) {

		List<NoticeDto> commentlist = new ArrayList<NoticeDto>();
		if("EDIT".equals(mode)) {
			noticeDto = noticeDao.selectNotice(noticeDto);
			noticeDao.updateReadCnt(noticeDto);
			commentlist = noticeDao.commentlist(noticeDto);
		}
		model.addAttribute("commentlist",commentlist);
		model.addAttribute("mode",mode);
		model.addAttribute("noticeDto",noticeDto);
		
		return "notice/notice_Edit";
	}
	
	@RequestMapping("/noticeUpdate")
	public String noticeUpdate(NoticeDto noticeDto, Model model) {
		
		if("NEW".equals(noticeDto.getMode())) {
			noticeDao.insertNotice(noticeDto);
		}else {
			noticeDao.updateNotice(noticeDto);
		}
		
		return noticeList(noticeDto, model, null, null, 1);
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(NoticeDto noticeDto, Model model) {
		
		noticeDao.deleteNotice(noticeDto);
		
		return noticeList(noticeDto, model, null, null, 1);
	}
	
	@RequestMapping("/saveComment")
	public String saveComment(NoticeDto noticeDto, Model model) {
		
		noticeDao.insertComment(noticeDto);
		
		return noticeEdit(noticeDto, model, "EDIT");
	}
	
	@RequestMapping("/deleteComment")
	public String deleteComment(NoticeDto noticeDto, Model model,HttpServletRequest req) {
		
		String commentId = req.getParameter("commentId");
		noticeDao.deleteComment(commentId);
		
		return noticeEdit(noticeDto, model, "EDIT");
	}


	
	
	
	
	
}

















