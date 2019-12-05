package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.domain.MemberVO;
import kr.co.service.loginService;

@Controller
public class LoginController {
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
}
