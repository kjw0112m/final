package com.kh17.panda.service;

import javax.mail.MessagingException;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.entity.SellerDto;

public interface EmailService {


	void sendCertification(MemberDto memberDto) throws MessagingException;

	boolean verification_no(String email) throws MessagingException;

	void sendCertification(SellerDto sellerDto) throws MessagingException;


}
