package com.kh17.panda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh17.panda.entity.MyInfoDto;
import com.kh17.panda.repository.MemberDao;

@Service
public class MyInfoServiceImpl implements MyInfoService{

	@Autowired
	private MemberDao memberDao;
	
	@Override
	@Transactional
	public MyInfoDto myInfo(String id) {
		return memberDao.myInfo(id);
	}
	
}
