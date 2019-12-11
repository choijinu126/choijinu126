package kr.co.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.co.domain.MemberVO;
import kr.co.service.loginService;

@Controller
public class UserController {
	@Inject
	private loginService lservice;
	
	@ResponseBody
	@RequestMapping(value = "/checkId")
	public int idCheck(MemberVO vo, ModelAndView mav) {
        int result=0;
        MemberVO user=lservice.idCheck(vo.getId());
        if(user!=null) result=1;
        return result;
    }
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpSession session, HttpServletRequest request) {
		return "redirect:/loginUI";
	}
	
	@RequestMapping("/loginUI")
	public String loginUI() {
		return "/loginUI";
	}
	
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(MemberVO vo, boolean usecookie, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String returnURL = "";
		if(session.getAttribute("login") != null) session.removeAttribute("login");
		
		vo = lservice.login(vo);
		if(vo != null) {
			vo.setUsecookie(usecookie);
			session.setAttribute("login", vo);
			returnURL = "redirect:/main";
			
			if(vo.isUsecookie()) {
				int limitTime = 60*5*1*1;
				Cookie cookie = new Cookie("loginCookie",  session.getId());
				
				cookie.setPath("/");
				cookie.setMaxAge(limitTime);
				response.addCookie(cookie);
				
				Date sessionlimit = new Date(System.currentTimeMillis() + (1000*limitTime));
				lservice.keepLogin(vo.getId(), session.getId(), sessionlimit);
			}
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('아아디 또는 비밀번호를 확인해주세요.');</script>");
			writer.flush();
			returnURL = "loginUI";
		}
		return returnURL;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Object loginSession = session.getAttribute("login");
		if(loginSession != null) {
			MemberVO vo = (MemberVO) loginSession;
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie =WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				Date date = new Date(System.currentTimeMillis());
				lservice.keepLogin(vo.getId(), session.getId(), date);
			}
		}
		return "redirect:/main";
	}
}
