package com.kh17.panda.service;

import java.time.LocalTime;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Override
	@Scheduled(cron= "0 0 0 * * *")
	public void productSeqInit() {
		System.out.println(LocalTime.now());
	}

	@Override
	@Scheduled(cron = "1 * * * * *")
	public void test() {
		System.out.println(LocalTime.now());
	}
	@Override
	@Scheduled(cron= "* * * * * *")
	public void work1() {
		System.out.println(LocalTime.now());
	}
	
	
}
