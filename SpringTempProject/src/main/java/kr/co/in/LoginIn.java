package kr.co.in;

import java.io.PrintWriter;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.domain.MemberVO;
import kr.co.service.loginService;

public class LoginIn extends HandlerInterceptorAdapter{
	@Inject
	private loginService lservice;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object loginSession = session.getAttribute("login");
		
		if(loginSession == null) {
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				String sessionId = loginCookie.getValue();
				MemberVO vo = lservice.checksessionkey(sessionId);
				if(vo != null) {
					session.setAttribute("login", vo);
					return true;
				}
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('로그인 페이지로 이동합니다.');location.href='/loginUI'</script>");
				writer.flush();
				return false;
			}
		}
		return true;
	}
}
