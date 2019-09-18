package com.kh17.panda.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.repository.StaticDao;

@Controller
public class MainController {
	@Autowired
	private StaticDao staticDao;
	
	@RequestMapping("/")
	public String main(Model model) {
		List<OrderViewDto> list = staticDao.main_top();
		model.addAttribute("top", list);
		System.out.println(list);
		return "main";
	}
	@RequestMapping("/policy")
	public String policy() {
		return "policy";
	}
}
