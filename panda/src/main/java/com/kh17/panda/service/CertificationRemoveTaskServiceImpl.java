//package com.kh17.panda.service;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//
//import com.kh.home.repository.CertDao;
//
//public class CertificationRemoveTaskServiceImpl implements CertificationRemoveTaskService{
//	@Autowired
//	private CertDao certDao;
//	
//	Logger logger = LoggerFactory.getLogger(getClass());
//	
//	@Override
//	@Scheduled(cron = "0 0 * * * *")
//	public void run() {
//		certDao.clear();
//		logger.info("인증번호 초기화 작업을 수행하였습니다.");
//	}
//	
//}
