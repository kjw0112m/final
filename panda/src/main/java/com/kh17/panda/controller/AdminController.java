package com.kh17.panda.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh17.panda.entity.AdminDto;
import com.kh17.panda.entity.TotalDto;
import com.kh17.panda.repository.AdminDao;
import com.kh17.panda.repository.TotalDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private TotalDao totalDao;
	
	@GetMapping("/seller")
	public String seller(@RequestParam(required = false) String type, @RequestParam(required = false) String keyword, Model model, HttpSession session) {
		String aid = (String) session.getAttribute("aid");
		if(aid!=null) {
			List<TotalDto> list = totalDao.seller(type, keyword);
			model.addAttribute("totalDto", list);
		}
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		
		return "admin/seller";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "admin/regist";
	}

	@PostMapping("/regist")
	public String regist(@ModelAttribute AdminDto adminDto) {
		String origin = adminDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		adminDto.setPw(encrypt);

		boolean result = adminDao.regist(adminDto);
		if (result)
			return "redirect:login";
		else
			return "redirect:login";
	}

//	로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}

//	로그인
	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto adminDto, @RequestParam(required = false) String remember,
			HttpSession session, HttpServletResponse response) {

// 비밀번호 암호화처리
		AdminDto result = adminDao.get(adminDto.getId());
		if (result != null) {
			if (BCrypt.checkpw(adminDto.getPw(), result.getPw())) {
				session.setAttribute("aid", result.getId());

				// 쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
				Cookie c = new Cookie("saveId", adminDto.getId());
				if (remember == null)// 체크 안했을때
					c.setMaxAge(0);
				else {// 체크 했을때
					c.setMaxAge(1 * 7 * 24 * 60 * 60);// 1주
				}
				response.addCookie(c);
				return "redirect:/seller";
			} else {
				return "redirect:login?error=1";
			}
		} else {
			return "redirect:login?error=1";
		}
	}

//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("aid");
		return "redirect:/admin/login";
	}
}
