package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.testService;

@Controller
public class HomeController {
	@Inject
	private testService tservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gateway() {
		return "gateway";
	}
	
	@RequestMapping(value = "/selection")
	public String selection(Model model) {
		String temp = tservice.selection();
		model.addAttribute("temp", temp);
		return "selection";
	}
	
}
