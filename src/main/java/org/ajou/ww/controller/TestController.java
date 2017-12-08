package org.ajou.ww.controller;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

import org.ajou.ww.model.MemberService;
import org.ajou.ww.model.MemberVO;
import org.ajou.ww.model.TestService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	@Resource
	private TestService testService;
	
}
