package com.kh17.panda.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayCancelAmount {
	private int total;
	private int tax_free;
	private int vat;
	private int discount;
}
