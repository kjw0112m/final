package com.kh17.panda.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.MemberDao;

import oracle.jdbc.proxy.annotation.Post;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;

	@GetMapping("/agree")
	public String agree() {
		return "member/agree";
	}
	
	
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}
	
	
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
	
	
}

















