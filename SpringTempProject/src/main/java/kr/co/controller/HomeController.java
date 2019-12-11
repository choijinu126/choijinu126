package kr.co.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.domain.spageTO;
import kr.co.service.MemberService;
import kr.co.service.loginService;

@Controller
public class HomeController {
	@Inject
	private MemberService mservice;
	@Inject
	private loginService lservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(spageTO sto, Model model, HttpSession session, HttpServletRequest request) {
		sto.setList(mservice.list(sto));
		MemberVO login = (MemberVO) session.getAttribute("login");
		if(login == null) {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie cookie: cookies) {
					if(cookie.getName().equalsIgnoreCase("loginCookie")) {
						MemberVO vo = lservice.checkVoFromCookie(cookie.getValue());
						 int limitTime = 60*5*1*1;
						 Date sessionlimit = new Date(System.currentTimeMillis() + (1000*limitTime));
						 lservice.keepLogin(vo.getId(), cookie.getValue(), sessionlimit);
						 session.setAttribute("login", vo);
					}
				}
			}
		}
		
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
