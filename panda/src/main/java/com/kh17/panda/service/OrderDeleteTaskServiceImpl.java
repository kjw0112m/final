package com.kh17.panda.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh17.panda.repository.OrdersDao;

@Service
public class OrderDeleteTaskServiceImpl implements OrderDeleteTaskService{

	@Autowired
	private OrdersDao ordersDao;
	
	@Override
	@Scheduled(cron = "0 0 0 * * *")
	public void delete() {
		ordersDao.delete();
	}
	
}
