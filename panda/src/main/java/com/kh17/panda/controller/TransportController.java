package com.kh17.panda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh17.panda.entity.TransportDto;

@Controller
@RequestMapping("/transport")
public class TransportController {
	
	@GetMapping("/tracking")
	public String tracking(@ModelAttribute TransportDto transportDto, Model model) {
		model.addAttribute("transportDto", transportDto);
		return "transport/tracking";
	}
}
