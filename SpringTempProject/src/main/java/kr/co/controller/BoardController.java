package kr.co.controller;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.domain.boardVO;
import kr.co.domain.spageTO;
import kr.co.service.MemberService;
import kr.co.service.boardService;
import kr.co.service.loginService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Inject
	private boardService bservice;
	@Inject
	private loginService lservice;
	
	@RequestMapping(value = "/list")
	public void list(Model model, spageTO sto, HttpSession session, HttpServletRequest request) {
		sto.setList(bservice.boardList(sto));
		
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
	
	@RequestMapping(value = "/insertUI")
	public void insertUI() {
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(boardVO vo) {
		bservice.insert(vo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/read")
	public String read(boardVO vo, Model model) {
		vo = bservice.read(vo.getBnum());
		model.addAttribute("vo", vo);
		return "/board/read";
	}
	
	@RequestMapping(value = "/updateUI")
	public String updateUI(boardVO vo, Model model) {
		vo = bservice.updateUI(vo.getBnum());
		model.addAttribute("vo", vo);
		return "/board/updateUI";
	}
	
	@RequestMapping(value = "/update")
	public String  update(boardVO vo) {
		bservice.updateUI(vo);
		System.out.println(vo.getTitle());
		return "redirect:/board/read?bnum=" + vo.getBnum(); 
	}
	
	@RequestMapping(value = "/delete")
	public String delete(String bnum) {
		bservice.delete(bnum);
		return "redirect:/board/list";
	}
}
