package kr.kosta.bus.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.kosta.bus.service.BusService;
import kr.kosta.bus.service.RouteService;

@RestController
@RequestMapping("/bc/ajax/*")
public class BaechaAjaxController {

	@Autowired
	BusService bservice;
	@Autowired
	RouteService rservice;
	
	@RequestMapping(value="/b-insert.aj", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
    public ResponseEntity<String> businsert(HttpServletRequest request) {
		String status = "";
		if(request.getParameter("b_no").length() > 0 && bservice.bnoCheck(request.getParameter("b_no")) > 0){
			return new ResponseEntity<String>(status, HttpStatus.valueOf(500));
		}
		else {
			//정상처리
			return new ResponseEntity<String>(status, HttpStatus.valueOf(200));
		}
    }
	
	@RequestMapping(value="/r-insert.aj", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
    public ResponseEntity<String> routeinsert(HttpServletRequest request) {
		String status = "";
		if(request.getParameter("r_no").length() > 0 && rservice.rnoCheck(request.getParameter("r_no")) > 0){
			return new ResponseEntity<String>(status, HttpStatus.valueOf(500));
		}
		else {
			//정상처리
			return new ResponseEntity<String>(status, HttpStatus.valueOf(200));
		}
    }

}
