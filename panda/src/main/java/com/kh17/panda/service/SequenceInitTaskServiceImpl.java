package com.kh17.panda.service;

import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh17.panda.repository.OrdersDao;

@Service
public class SequenceInitTaskServiceImpl implements SequenceInitTaskService{
	
	@Autowired
	private OrdersDao ordersDao;
	
	@Override
	@Scheduled(cron= "0 0 0 * * *")
	public void orderSeqInit() {
		ordersDao.initSequnce();
		System.out.println("정각!!");
	}	
}
