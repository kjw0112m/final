package com.kh17.panda.controller;

import java.io.IOException;

import javax.mail.MessagingException;
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

import com.kh17.panda.entity.SellerDto;
import com.kh17.panda.repository.SellerDao;
import com.kh17.panda.service.EmailService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	private SellerDao sellerDao;

	@RequestMapping(value = { "/", "" })
	public String main() {
		return "seller/main";
	}

	@GetMapping("/regist")
	public String regist() {
		return "seller/regist";
	}

	@PostMapping("/regist")
	public String regist(@ModelAttribute SellerDto sellerDto) {
		String origin = sellerDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		sellerDto.setPw(encrypt);

		boolean result = sellerDao.regist(sellerDto);
		if (result)
			return "redirect:login";
		else
			return "seller/regist?error=1";
	}

	// 아이디 중복 검사
	@GetMapping("/idCheck")
	public void idCheck(@RequestParam String id, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.get(id);
		if (sdto == null) {
			resp.getWriter().print("Y");
		} else {
			resp.getWriter().print("N");

		}
	}

//	로그인
	@GetMapping("/login")
	public String login() {
		return "seller/login";
	}

//	로그인
	@PostMapping("/login")
	public String login(@ModelAttribute SellerDto sellerDto, @RequestParam(required = false) String remember,
			HttpSession session, HttpServletResponse response) {

// 비밀번호 암호화처리
		SellerDto result = sellerDao.get(sellerDto.getId());
		if (result != null) {
			if (BCrypt.checkpw(sellerDto.getPw(), result.getPw())) {
				session.setAttribute("ssid", result.getId());

				sellerDao.lastlogin(sellerDto.getId());

				// 쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
				Cookie c = new Cookie("saveId", sellerDto.getId());
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
		session.removeAttribute("ssid");
		return "redirect:/seller/login";
	}

//	내정보 보기 기능
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String id = (String) session.getAttribute("ssid");
		SellerDto sellerDto = sellerDao.get(id);
		model.addAttribute("sellerDto", sellerDto);
		return "seller/info";
	}

//	회원탈퇴
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String id = (String) session.getAttribute("ssid");

		sellerDao.delete(id);
		session.removeAttribute("ssid");
		return "seller/goodbye";
	}

//	회원 정보 수정 기능
//	요청 -> 수정입력 -> 수정처리 -> 내정보
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String id = (String) session.getAttribute("ssid");
		SellerDto sellerDto = sellerDao.get(id);
		model.addAttribute("sdto", sellerDto);
		return "seller/change";
	}

	@PostMapping("/change")
	public String change(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		sellerDto.setId((String) session.getAttribute("ssid"));
		sellerDao.change(sellerDto);
		return "redirect:info";
	}

//	비밀번호 찾기 기능

//	목표 : 정보 입력 페이지로 전달
	@GetMapping("/find_pw")
	public String findPassword() {
		return "seller/find_pw";
	}


//	목표 : 넘긴 정보를 조회하여 일치할 경우 이메일을 발송
	@PostMapping("/find_pw")
	public String findPassword(@ModelAttribute SellerDto sellerDto, Model model) throws MessagingException {
		boolean exist = sellerDao.findPassword(sellerDto);
		if (exist) {
			model.addAttribute("id", sellerDto.getId());
			return "redirect:new_pw";
		} else {
			return "redirect:find_pw?error=1";
		}
	}

	@GetMapping("/find_pw_result")
	public String findPasswordResult() {
		return "seller/find_pw_result";
	}

	@GetMapping("/new_pw")
	public String newPassword(@RequestParam String id, Model model) throws IOException {
		model.addAttribute("id", id);
		return "seller/new_pw";
	}

//	목표 : 변경 처리 수행
	@PostMapping("/new_pw")
	public String newPassword(@ModelAttribute SellerDto sellerDto) {
//		비밀번호 암호화 처리(bcrypt)
		String origin = sellerDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		sellerDto.setPw(encrypt);
		sellerDao.changePw(sellerDto);
		return "redirect:login";
	}

//아이디 찾기 기능
	@GetMapping("/find_id")
	public String findId() {
		return "seller/find_id";
	}

	@PostMapping("/find_id")
	public String findId(@ModelAttribute SellerDto sellerDto, Model model) {
		SellerDto sdto = sellerDao.findId(sellerDto);
		if (sdto != null) {
			model.addAttribute("id", sdto.getId());
			return "seller/find_id_result";
		} else {
			return "redirect:find_id?error=1";
		}
	}

	@PostMapping("/change_pw")
	public String change_pw(HttpSession session, @ModelAttribute SellerDto sellerDto, Model model,
			@RequestParam String new_pw) {

		sellerDto.setId((String) session.getAttribute("ssid"));

		// 기존 비밀번호와 새로운 비밀번호가 들어옴
		String newpw = BCrypt.hashpw(new_pw, BCrypt.gensalt());

		// 먼저 세션에 있는 계정 정보를 가져옴
		SellerDto check = sellerDao.get((String) session.getAttribute("ssid"));

		// 기존 비밀번호와 입력 비밀번호를 비교하여 확인
		boolean result = BCrypt.checkpw(sellerDto.getPw(), check.getPw());

		if (result) {
//		[2] 비밀번호가 맞으면 새로운 비밀번호로 변경
			sellerDto.setId((String) session.getAttribute("ssid"));
			sellerDto.setPw(newpw);

			sellerDao.changePw(sellerDto);
			return "seller/change_pw_result";
		}
//		[3] 비밀번호가 다르면 비밀번호 변경 실패 안내
		else {
			return "redirect:change_pw?error=1";
		}
	}

}
