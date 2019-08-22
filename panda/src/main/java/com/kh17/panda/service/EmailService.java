package com.kh17.panda.service;

import javax.mail.MessagingException;

import com.kh17.panda.entity.MemberDto;

public interface EmailService {


	void sendCertification(MemberDto memberDto) throws MessagingException;
}
