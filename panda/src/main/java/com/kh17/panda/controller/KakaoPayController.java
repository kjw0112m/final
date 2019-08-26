package com.kh17.panda.controller;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.kh17.panda.vo.KakaoPayReturnVO;
import com.kh17.panda.vo.KakaoPaySuccessVO;

@Controller
@RequestMapping("/pay/kakao")
public class KakaoPayController {
	
//	사용자에게 결제할 내용을 확인받는 페이지
	@GetMapping("/confirm")
	public String confirm() {
		return "confirm";
	}
	
//	사용자가 결제 확인을 누른 경우 처리
	@PostMapping("/confirm")
	public String confirm(
			@RequestParam String item_name,
			@RequestParam int quantity,
			@RequestParam int total_amount,
			HttpSession session
			) throws URISyntaxException {
//		목표 : 사용자가 보낸 정보에 추가 정보를 작성하여 api 호출
//		추가할 정보 : 가맹점코드, 주문번호, 회원id, 비과세액, 성공/실패/취소주소
		
//		서버에서 다른 서버를 호출하려면 RestTemplate이 필요
		RestTemplate template = new RestTemplate();
		
//		template에 headers와 params을 추가하여 전송 ---> 응답 발생
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 35fa20f25ea37935f657e69b289db050");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		MultiValueMap<String, String> params = 
									new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1000");//결제고유번호..DB저장(취소,조회 등)
		params.add("partner_user_id", "kh");//사용자 PK
		params.add("item_name", item_name);
		params.add("quantity", String.valueOf(quantity));
		params.add("total_amount", String.valueOf(total_amount));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8080/sts27/pay/kakao/success");
		params.add("cancel_url", "http://localhost:8080/sts27/pay/kakao/cancel");
		params.add("fail_url", "http://localhost:8080/sts27/pay/kakao/fail");
		
//		headers와 params를 합쳐서 전송할 객체를 생성
		HttpEntity<MultiValueMap<String, String>> send
		= new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
//		실제 전송 : 반환값을 저장할 수 있는 객체가 필요
		KakaoPayReturnVO vo = template.postForObject(
											uri, send, KakaoPayReturnVO.class);
		
//		vo 안에 있는 tid를 결제 최종 승인 요청에서 사용할 수 있도록 저장
		session.setAttribute("payInfo", vo);
		
//		결제 페이지로 연동(리다이렉트)
		return "redirect:" + vo.getNext_redirect_pc_url();
	}
	
//	결제 결과에 따른 콜백 처리를 수행할 Mapping 구현
//	 - pg_token과 가맹점 정보, 거래id를 이용하여 최종 승인 요청을 처리
	@GetMapping("/success")	//성공시 예약한 주소
	public String success(
				@RequestParam String pg_token,
				HttpSession session, Model model
			) throws URISyntaxException {
		
		KakaoPayReturnVO vo = 
				(KakaoPayReturnVO) session.getAttribute("payInfo");
		session.removeAttribute("payInfo");
		
		RestTemplate template = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 35fa20f25ea37935f657e69b289db050");
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE);
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		MultiValueMap<String, String> params = 
								new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", vo.getTid());
		params.add("partner_order_id", "1000");
		params.add("partner_user_id", "kh");
		params.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> send
			= new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
//		최종 승인 요청
		KakaoPaySuccessVO success = template.postForObject(
											uri, send, KakaoPaySuccessVO.class);
//		success에 들어있는 정보..... DB 처리가 우선
//		그리고... 사용자에게 알려줄 정보를 전달
		model.addAttribute("success", success);
		
		return "success";
	}
	
	@GetMapping("/cancel")		//취소시 예약한 주소
	public String cancel() {
//		목표 : PG사에 결제 취소 요청을 보낸다
		
		return "cancel";
	}
	
	@GetMapping("/fail")			//실패시 예약한 주소
	public String fail() {
		return "fail";
	}
}










