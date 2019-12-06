package kr.co.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.domain.spageTO;
import kr.co.service.MemberService;

@Controller
public class HomeController {
	@Inject
	private MemberService mservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(spageTO sto, Model model, HttpSession session) {
		sto.setList(mservice.list(sto));
		MemberVO login = (MemberVO) session.getAttribute("login");
		
		model.addAttribute("vo", sto);
		model.addAttribute("login", login);
	}
	
	@RequestMapping(value = "/insertUI", method = RequestMethod.GET)
	public void insertUI() {
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo) {
		mservice.insert(vo);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(String id, Model model) {
		MemberVO vo = mservice.read(id);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/updateUI", method = RequestMethod.GET)
	public void updateUI(String id, Model model) {
		MemberVO vo = mservice.read(id);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mservice.update(vo);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(String id) {
		mservice.delete(id);
		return "redirect:/main";
	}
}
