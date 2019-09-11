package com.kh17.panda.controller;


import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import com.kh17.panda.entity.CertDto;
import com.kh17.panda.entity.IdentityVerificationDto;
import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.CertDao;
import com.kh17.panda.repository.IdentityVerificationDao;
import com.kh17.panda.repository.MemberDao;
import com.kh17.panda.service.EmailService;




@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;

//	약관 동의
	@GetMapping("/agree")
	public String agree() {
		return "member/agree";
	}
	
//	회원가입
	
	@GetMapping("/regist")
	public String regist(@RequestParam(required = false, defaultValue = "no") String agree) {
		if(agree.equals("no")) {
			return "redirect:/member/agree";
		}
		else {
			return "member/regist";
		}
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
	
	// 아이디 중복 검사
	@GetMapping("/idCheck")
	public void idCheck(@RequestParam String id, HttpServletResponse resp) throws IOException  {
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.get(id);
		if(mdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
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
		if(result!=null) {
			if(BCrypt.checkpw(memberDto.getPw(), result.getPw())) {
				session.setAttribute("sid", result.getId());
				memberDao.lastlogin(memberDto.getId());
				//쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
				Cookie c = new Cookie("saveId", memberDto.getId());
				if(remember == null)//체크 안했을때 
					c.setMaxAge(0);
				else //체크 했을때
					c.setMaxAge(1 * 7 * 24 * 60 * 60);//1주
				response.addCookie(c);
				
				return "redirect:/";
			}else {
				return "member/login_fail";
			}
		}
		else {
			return "member/login_fail";
		}
	}

//	로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sid");
		return "redirect:/member/login";
	}
	
//	내정보 보기 기능
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String id = (String) session.getAttribute("sid");
		MemberDto memberDto = memberDao.get(id);
		model.addAttribute("mdto", memberDto);
		return "member/info";
	}
	
	
//	회원탈퇴
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String id = (String)session.getAttribute("sid");
		
		memberDao.delete(id);
		session.removeAttribute("sid");
		return "member/goodbye";
	}

	
//	회원 정보 수정 기능
//	요청 -> 수정입력 -> 수정처리 -> 내정보
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String id = (String) session.getAttribute("sid");
		MemberDto memberDto = memberDao.get(id);
		model.addAttribute("mdto", memberDto);
		return "member/change";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto memberDto, HttpSession session) {
		memberDto.setId((String) session.getAttribute("sid"));
		memberDao.change(memberDto);
		return "redirect:info";
	}
	
//	비밀번호 찾기 기능
	
//	목표 : 정보 입력 페이지로 전달
	@GetMapping("/find_pw")
	public String findPassword() {
		return "member/find_pw";
	}
	
	
	@Autowired 
	private EmailService emailService;
//	목표 : 넘긴 정보를 조회하여 일치할 경우 이메일을 발송
	@PostMapping("/find_pw")
	public String findPassword(@ModelAttribute MemberDto memberDto) throws MessagingException {
		boolean exist = memberDao.findPassword(memberDto);
		if(exist) {
			emailService.sendCertification(memberDto);
//			
			return "redirect:find_pw_result";//새로운 기능으로 전송
		}
		else {
			return "redirect:find_pw?error=1";
		}
	}
	
	@GetMapping("/find_pw_result")
	public String findPasswordResult() {
		return "member/find_pw_result";
	}
	
	@Autowired
	private CertDao certDao;
	
//	비밀번호 변경 처리
//	목표 : 입력페이지로 전달
	@GetMapping("/new_pw")
	public String newPassword(
			@RequestParam String email,
			@RequestParam String id,
			@RequestParam String no,
			HttpServletResponse response,
			Model model) throws IOException {
//		검증
		CertDto certDto = CertDto.builder().who(email).no(no).build();
		boolean result = certDao.validate(certDto);
		certDao.delete(certDto);
		
		if(result) {
			model.addAttribute("id", id);
			return "member/new_pw";
		}
		else {
			response.sendError(401);
			return null;
		}
	}
	
//	목표 : 변경 처리 수행
	@PostMapping("/new_pw")
	public String newPassword(@ModelAttribute MemberDto memberDto,
			HttpServletRequest request,
			HttpServletResponse response) {
//		이 페이지를 뒤로가기에서 배제하기 위한 response 헤더 설정
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		if(request.getProtocol().contentEquals("HTTP/1.1"))
			response.setHeader("Cache-Control", "no-cache");
		
//		비밀번호 암호화 처리(bcrypt)
		String origin = memberDto.getPw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setPw(encrypt);
		
		memberDao.changePw(memberDto);
		return "member/new_pw_result";
	}
	
//아이디 찾기 기능
	@GetMapping("/find_id")
	public String findId() {
		return "member/find_id";
	}
	

	@PostMapping("/find_id")
	public String findId(@ModelAttribute MemberDto memberDto, Model model) {
		MemberDto mdto = memberDao.findId(memberDto);
		if(mdto != null) {
			model.addAttribute("id", mdto.getId());
			return "member/find_id_result";
		}
		else {
			return "redirect:find_id?error=1";
		}
	}
	
	
	@GetMapping("/find_id_result")
	public String findIdResult() {
		return "member/find_id_result";
	}
	
	// 회원 비밀번호 바꾸기
	@GetMapping("/change_pw")
	public String change_pw() {
		return "member/change_pw";
	}
	
	
	@PostMapping("/change_pw")
	public void change_pw(HttpSession session, @ModelAttribute MemberDto memberDto, 
			Model model, @RequestParam String new_pw, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		
		memberDto.setId((String) session.getAttribute("sid"));				

		//		기존 비밀번호와 새로운 비밀번호가 들어옴
		String newpw = BCrypt.hashpw(new_pw, BCrypt.gensalt());
		
		//먼저 세션에 있는 계정 정보를 가져옴
		MemberDto check = memberDao.get((String) session.getAttribute("sid"));
		
			//기존 비밀번호와 입력 비밀번호를 비교하여 확인
		boolean result = BCrypt.checkpw(memberDto.getPw(),check.getPw());
		System.out.println(result);
		if(result) {
//		[2] 비밀번호가 맞으면 새로운 비밀번호로 변경
			memberDto.setId((String) session.getAttribute("sid"));
			resp.getWriter().print("Y");
			memberDto.setPw(newpw);
			memberDao.changePw(memberDto);
			memberDao.lastchangepw(memberDto.getId());
		}
//		[3] 비밀번호가 다르면 비밀번호 변경 실패 안내
		else {
			resp.getWriter().print("N");
		}
	}
	
	
	// email 중복 검사
	@GetMapping("/emailCheck")
	public void emailCheck(@RequestParam String email, HttpServletResponse resp) throws IOException  {
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.emailCheck(email);
		if(mdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	//이메일 본인 인증

	
	@Autowired
private IdentityVerificationDao identityVerificationDao;
	

@GetMapping("/email_cert")
	public void verification(@RequestParam String email,  HttpServletResponse resp) throws IOException, MessagingException {
			boolean result = emailService.verification_no(email);
			if(result) {
				resp.getWriter().print("Y");
			}
			else {
				resp.getWriter().print("N");
			}
		}
	
	@GetMapping("/email_cert_check")
	public void email_verification_check
	(@RequestParam String identity, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		IdentityVerificationDto identityVerificationDto = identityVerificationDao.get(identity);
		if(identityVerificationDto==null) {
			resp.getWriter().print("N");
		}
		else {
			resp.getWriter().print("Y");
			identityVerificationDao.delete(identity);
		}
	}
	
	
}
