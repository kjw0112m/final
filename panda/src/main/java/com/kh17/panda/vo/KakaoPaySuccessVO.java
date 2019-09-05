package com.kh17.panda.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPaySuccessVO {
	private String aid;//요청 고유 번호
	private String tid;//결제 고유 번호
	private String cid;//가맹점 코드
	private String sid;//정기결제 번호(정기결제 시에만)
	private String partner_order_id;//가맹점 주문번호
	private String partner_user_id;//가맹점 회원 id
	private String payment_method_type;//결제 수단
	private String item_name;//상품명
	private int quantity;//상품 수량
	private KakaoPaySuccessCardInfo card_info;//결제 상세 정보(카드일 경우)
	private KakaoPaySuccessAmount amount;//수량 상세 정보
	private String created_at;//결제 준비 요청 시각
	private String approved_at;//결제 승인 시각
}
