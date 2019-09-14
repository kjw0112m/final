package com.kh17.panda.repository;

import com.kh17.panda.entity.KakaoPayDto;

public interface KakaopayDao {
	
	KakaoPayDto get(String team);
	
	void pay(KakaoPayDto kakaoPayDto);
	
	void team(KakaoPayDto kakaoPayDto);
}
