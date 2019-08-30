package com.kh17.panda.controller.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPaySuccessCardInfo {
	private String purchase_corp;//매입카드사 한글명
	private String purchase_corp_code;//매입카드사 코드
	private String issuer_corp;//카드발급사 한글명
	private String issuer_corp_code;//카드발급사 코드
	private String bin;//카드 BIN
	private String card_type;//카드 타입
	private String install_month;//할부 개월 수
	private String approved_id;//카드사 승인번호
	private String card_mid;//카드사 가맹점번호
	private String interest_free_install;//무이자할부(Y/N)
	private String card_item_code;//카드 상품 코드
}
