package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.MemberDao;

@Controller
@RequestMapping("/seller/member")
public class AdminController {

	@Autowired
	private MemberDao mDao;
	
	//회원 검색 기능
	@GetMapping("/search")
	public String search(
				@RequestParam(required = false) String type,
				@RequestParam(required = false) String keyword,
				Model model
			) {
		if(type != null && keyword != null) {
			List<MemberDto> list =mDao.search(type, keyword);
			model.addAttribute("list", list);
		}
		return "seller/member/search";
	}
	
//	상세 정보 보기
	@GetMapping("/info")
	public String info(@RequestParam String id, Model model) {
		model.addAttribute("mdto", mDao.get(id));
		return "seller/member/info";
	}
	
//	회원 탈퇴
	@GetMapping("/delete")
	public String delete(
			@RequestParam String id,
			//검색 상태를 유지하기 위한 파라미터
			@RequestParam String type,
			@RequestParam String keyword,
			Model model
			) {
		mDao.delete(id);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		return "redirect:search";
	}
	
	//회원 정보 변경
	@GetMapping("/edit")
	public String edit(@RequestParam String id, Model model) {
		model.addAttribute("mdto", mDao.get(id));
		return "seller/member/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute MemberDto memberDto, Model model) {
		mDao.change(memberDto);
		model.addAttribute("id", memberDto.getId());
		return "redirect:info";
	}
	}

