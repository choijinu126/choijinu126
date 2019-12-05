package com.springboot.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.model.testDTO;
import com.springboot.service.testService;

@Controller
public class MainController {
	@Inject
	testService tservice;
	
	@RequestMapping("/")
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("home");
		List<testDTO> list = tservice.list();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/insertUI", method = RequestMethod.GET)
	public void insertUI() {
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(testDTO vo) {
		tservice.insert(vo);
		return "redirect:/";
	}
}
