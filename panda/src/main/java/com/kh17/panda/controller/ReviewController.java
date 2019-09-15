package com.kh17.panda.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/reviewListAjax")
	@ResponseBody
	public JSONArray reviewListAjax(@RequestParam(required = false) String orderid) {
		

		JSONArray objArr = new JSONArray();
		ReviewDto dto = new ReviewDto();
		dto.setOrdersid(orderid);
		List<ReviewDto> list = reviewDao.listReviewComment(dto);
		ReviewDto totalcnt = reviewDao.getstartotalcnt(dto);
		for (int i = 0; i < list.size(); i++) {
			dto = list.get(i);
			dto.setStartotalcnt(totalcnt.getStartotalcnt());
			objArr.add(dto);
		}
		
		return objArr;
	}
	
	@RequestMapping("/reviewCreateAjax")
	@ResponseBody
	public JSONObject reviewCreateAjax(ReviewDto reviewDto, HttpSession session, @RequestParam(required = false) String orderid) {
		JSONObject obj = new JSONObject();
		reviewDto.setCreateuser(session.getAttribute("sid").toString());
		reviewDao.insertReviewComment(reviewDto);
		obj.put("result", "sucess");
		return obj;
	}
	
	@RequestMapping("/delCommentAjax")
	@ResponseBody
	public JSONObject delCommentAjax(ReviewDto reviewDto, HttpSession session, @RequestParam(required = false) int id) {
		JSONObject obj = new JSONObject();
		reviewDto.setId(id);
		reviewDao.delComment(reviewDto);
		obj.put("result", "sucess");
		return obj;
	}
	
	@RequestMapping("/updateCommentAjax")
	@ResponseBody
	public JSONObject updateCommentAjax(ReviewDto reviewDto, HttpSession session, @RequestParam(required = false) int id, @RequestParam(required = false) String content, @RequestParam(required = false) int star) {
		JSONObject obj = new JSONObject();
		reviewDto.setId(id);
		reviewDto.setCommentcontent(content);
		reviewDto.setStarcnt(star);
		reviewDto.setCreateuser(session.getAttribute("sid").toString());
		reviewDao.updateComment(reviewDto);
		obj.put("result", "sucess");
		return obj;
	}
	
}

















