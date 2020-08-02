package kr.kosta.bus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kosta.bus.model.UserDAO;
import kr.kosta.bus.security.service.ShaEncoder;


@Controller //컨트롤러 빈

public class UserController {

	@Inject
	ShaEncoder shaEncoder; //암호화 빈
	
	@Inject
	UserDAO userDao;
	
	@RequestMapping("/") //시작 페이지
	public String home(Model model) {
		return "home"; //
	}

	
	//로그인 페이지로 이동
	@RequestMapping("/uc/login.do")
	public String login() {
		return "/user/login";
	}
	//회원가입 페이지로 이동
	@RequestMapping("/uc/join.do")
	public String join() {
		return "/user/join";
	}
	
	//회원가입 처리 	
	@RequestMapping("/uc/insertUser.do")
	public String insertUser(@RequestParam String e_no, 
			@RequestParam String e_pwd,
			@RequestParam String e_name, 
			@RequestParam String authority) {
		//비밀번호 암호화
		String dbpw=shaEncoder.saltEncoding(e_pwd, e_no);
		Map<String,String> map=new HashMap<>();
		map.put("e_no", e_no);
		map.put("e_pwd", dbpw);
		map.put("e_name", e_name);
		map.put("authority", authority);
		// affected rows, 영향을 받은 행의 수가 리턴됨
		int result=userDao.insertUser(map);
		return "/user/login"; // login.jsp로 이동
	}

	
//관리자 영역 페이지	
	@RequestMapping("/admin/*")
	public String admin() {
		return "/admin/main";
	}
}
