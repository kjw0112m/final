package com.kh17.panda.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.MemberDao;




@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;

//	약정 동의
	@GetMapping("/agree")
	public String agree() {
		return "member/agree";
	}
	
//	회원가입
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}
	
// 회원가입	
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		String origin = memberDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setPw(encrypt);
			
		boolean result =memberDao.regist(memberDto);
		if(result)
			return "member/regist_result";
		else
			return "member/regist_fail";
	}
	
//	로그인
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
//	로그인
	@PostMapping("/login")
	public String login(
			@ModelAttribute MemberDto memberDto,
			@RequestParam(required=false) String remember,
			HttpSession session,
			HttpServletResponse response) {
		
// 비밀번호 암호화처리
		MemberDto result = memberDao.get(memberDto.getId());
		if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
			session.setAttribute("ok", result.getId());
			Cookie c = new Cookie("saveId", memberDto.getId());
			if(remember == null) 
				c.setMaxAge(0);
			else 
				c.setMaxAge(1* 7 * 24 * 60 * 60);
			response.addCookie(c);
			
			return "redirect:/";
		}
		else {
			return "member/login_fail";
		}
	}
	
//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("ok");
		return "redirect:/member/login";
	}
	
//	회원탈퇴
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String id = (String)session.getAttribute("ok");
		memberDao.delete(id);
		session.removeAttribute("ok");
		return "member/goodbye";
	}
	
}

















