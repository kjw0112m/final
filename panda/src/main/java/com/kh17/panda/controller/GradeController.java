package com.kh17.panda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/grade")
public class GradeController {
	
	@RequestMapping("/info")
	public void info(@RequestParam String id, Model model) {
		
	}
}
