package com.kh17.panda.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh17.panda.entity.CertDto;
import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.repository.CertDao;
import com.kh17.panda.repository.IdentityVerificationDao;

@Service
public class GmailService implements EmailService{

	//설정파일에 등록해둔 JavaMailSender 객체를 연결
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private RandomStringService randomStringService;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private IdentityVerificationDao identityVerificationDao;
	
	@Override
	public void sendCertification(MemberDto memberDto) throws MessagingException {
//		인증번호 생성(128자리)
		String no = randomStringService.generate(128);
		String email=memberDto.getEmail();
//		DB저장
		certDao.insert(CertDto.builder().who(email).no(no).build());
		
//		이메일 전송
		MimeMessage mail = sender.createMimeMessage();
		MimeMessageHelper helper = 
							new MimeMessageHelper(mail, false, "UTF-8");
		
		helper.setFrom("panda");
		helper.setTo(email);
		helper.setSubject("[PANDA 몰] 비밀번호 변경 메일입니다");
		String address = ServletUriComponentsBuilder
															.fromCurrentContextPath()
															.port(8080)
															.path("/member/new_pw")
															.queryParam("email",email)
															.queryParam("id",memberDto.getId())
															.queryParam("no", no)
															.toUriString();
		helper.setText("<h3><a href='"+address+"'>이곳을 눌러 변경을 완료하세요</a></h3>", true);
		sender.send(mail);
	}
	

	@Override
	public boolean verification_no(String email) throws MessagingException  {

			String no = randomStringService.Verification(6, 1);
			identityVerificationDao.insert(no);
			
			System.out.println(email);
			MimeMessage mail = sender.createMimeMessage();
			MimeMessageHelper helper = 
					new MimeMessageHelper(mail, false, "UTF-8");
			
			helper.setFrom("PanDa");
			helper.setTo(email);
			helper.setSubject("인증번호 메일 입니다.");
			helper.setText("귀하의 인증번호는 "+no+" 입니다");
			
			sender.send(mail);
			return true;
	
		}
		
	}







