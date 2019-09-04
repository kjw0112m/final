package com.kh17.panda.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.ReviewDto;
import com.kh17.panda.repository.ReviewDao;




@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;

	@RequestMapping("/reviewComment")
	public String reviewComment(ReviewDto reviewDto, Model model) {
		
		model.addAttribute("reviewList", reviewDao.listReviewComment(reviewDto));
		model.addAttribute("startotalcnt",reviewDao.getstartotalcnt(reviewDto));

		return "review/review_comment";
	}
	
	@RequestMapping("/reviewCreate")
	public String reviewCreate(ReviewDto reviewDto, Model model, HttpSession session) {
		
		reviewDto.setCreateuser(session.getAttribute("sid").toString());
		reviewDao.insertReviewComment(reviewDto);
		
		return reviewComment(reviewDto, model);
	}
	
	@RequestMapping("/updateComment")
	public String updateComment(ReviewDto reviewDto, Model model, HttpSession session, @RequestParam(required = false) int id) {
		
		reviewDto.setCreateuser(session.getAttribute("sid").toString());
		reviewDto.setId(id);
		reviewDto.setContent(reviewDto.getCommentcontent());
		reviewDto.setStarcnt(reviewDto.getCommentstar());
		reviewDao.updateComment(reviewDto);
		
		return reviewComment(reviewDto, model);
	}
	
	@RequestMapping("/delComment")
	public String delComment(ReviewDto reviewDto, Model model, HttpSession session, @RequestParam(required = false) int id) {
		
		reviewDto.setId(id);
		reviewDao.delComment(reviewDto);
		
		return reviewComment(reviewDto, model);
	}
}

















