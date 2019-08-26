package com.kh17.panda.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카카오 페이 요청 시 반환 자료형
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPayReturnVO {
	private String tid, next_redirect_pc_url, created_at;
//	모바일이라면 별도의 변수를 추가
}
