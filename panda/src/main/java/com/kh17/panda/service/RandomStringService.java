package com.kh17.panda.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class RandomStringService {
	
	public String generate(int length) {
		List<String> list = new ArrayList<>();
		for(char i='a'; i<='z'; i++) list.add(String.valueOf(i));
		for(char i='A'; i<='Z'; i++) list.add(String.valueOf(i));
		for(char i='0'; i<='9'; i++) list.add(String.valueOf(i));
		
		StringBuffer buffer = new StringBuffer();
		Random r = new Random();
		for(int i=0; i < length; i++) {
			int index = r.nextInt(list.size());
			buffer.append(list.get(index));
		}
		return buffer.toString();
	}
	
	/**
     * 전달된 파라미터에 맞게 난수를 생성한다
     * @param len : 생성할 난수의 길이
     * @param check : 중복 허용 여부 (1: 중복허용, 2:중복제거)
     */
	  public String Verification(int len, int check ) {
	        
	        Random no = new Random();
	        String verificationNo = ""; //난수가 저장될 변수
	        
	        for(int i=0;i<len;i++) {
	            
	            //0~9 까지 난수 생성
	            String ran = Integer.toString(no.nextInt(10));
	            
	            if(check==1) {
	                //중복 허용시 numStr에 append
	            	verificationNo += ran;
	            }else if(check==2) {
	                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
	                if(!verificationNo.contains(ran)) {
	                    //중복된 값이 없으면 numStr에 append
	                	verificationNo += ran;
	                }else {
	                    //생성된 난수가 중복되면 루틴을 다시 실행한다
	                    i-=1;
	                }
	            }
	        }
	        return verificationNo;
	    }
}





