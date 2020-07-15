package kr.kosta.bus.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.PayDTO;
import kr.kosta.bus.service.EmployerService;
import kr.kosta.bus.service.PayService;

@Controller
@RequestMapping("/hc/*")
public class HrController {

	@Autowired
	EmployerService service;
	
	// 인사관리
	@RequestMapping("e-list.do")
	public String home(HttpServletRequest request, Model model) {
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 10;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = service.getEmployerCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
//		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);
		
		int block = 10;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		String search = request.getParameter("search");
		if( search != null) {
			System.out.println(search + "asdf");
			map.put("e_no", search);
			List<EmployerDTO> dto = service.employerSearch(map);
			model.addAttribute("employerlist", dto);
		}
		else {
			List<EmployerDTO> dto = service.employerList(map);
			model.addAttribute("employerlist", dto);
		}
			
		
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "/hc/e-list";
	}
	
	@RequestMapping(value = "e-insertform.do", method = RequestMethod.GET)
	public String insertform() {
		return "/hc/e-insertform";
	}
	@RequestMapping(value = "e-insert.do", method = RequestMethod.POST)
	public  String insert(HttpServletRequest request, EmployerDTO dto) {
		  dto.setE_no(request.getParameter("e_no"));
		  dto.setE_name(request.getParameter("e_name"));
		  dto.setE_jumin(request.getParameter("e_jumin"));
		  dto.setE_dname(request.getParameter("e_dname"));
		  dto.setE_position(request.getParameter("e_position"));
		  dto.setE_b_no(request.getParameter("e_b_no"));
		  dto.setE_license(request.getParameter("e_license"));
		  dto.setE_contract(request.getParameter("e_contract"));
		  dto.setE_marriage(request.getParameter("e_marriage"));
		  dto.setE_disabled(request.getParameter("e_disabled"));
		  dto.setE_hobby(request.getParameter("e_hobby"));
		  dto.setE_speciality(request.getParameter("e_speciality"));
		  dto.setE_phone(request.getParameter("e_phone"));
		  dto.setE_pwd(request.getParameter("e_pwd"));
		  dto.setE_mail(request.getParameter("e_mail"));
		  dto.setE_add(request.getParameter("e_add"));
		  
		  dto.setE_career(Integer.parseInt(request.getParameter("e_career")));	  
		  dto.setE_break(Integer.parseInt(request.getParameter("e_break")));	
		  
		  dto.setE_start(Date.valueOf(request.getParameter("e_start")));
		  dto.setE_end(Date.valueOf(request.getParameter("e_end")));
	      
		service.employerInsert(dto);
		return "redirect:e-list.do";
	}
	
	@RequestMapping(value="e-updateform.do", method=RequestMethod.GET)
	public String Employerupdateform(EmployerDTO dto,Model model) {
		dto = service.employerUpdate2(dto);
		model.addAttribute("dto",dto);
		return "/hc/e-updateform";
	}

	@RequestMapping(value="e-update.do", method=RequestMethod.POST)
	public String Employerupdate(EmployerDTO dto,Model model) {
		service.employerUpdate(dto);
		return "redirect:e-list.do";
	}
	
    @RequestMapping("e-delete.do")
    public String delete(String e_no) {
      service.employerDelete(e_no);
      return "redirect:e-list.do";
    }
    
    
	@Autowired
	PayService payservice;
	
	//페이관리
	@RequestMapping("pay-list-n.do")
	public String pay_list_n() {
		return "/hc/pay-list";
	}
	
	@RequestMapping("pay-list.do")	
	public String pay_list(HttpServletRequest request, Model model) { // home -> rlist

		
		HashMap map = new HashMap();
		map.put("pay_year", Integer.parseInt(request.getParameter("pay_year")));
		map.put("pay_month", Integer.parseInt(request.getParameter("pay_month"))); //
		map.put("pay_e_no", request.getParameter("pay_e_no")); //
		
		List<PayDTO> dto = payservice.payList(map);
		model.addAttribute("paylist", dto);
		
		return "/hc/pay-list";
	}
	
	@RequestMapping("pay-insertform.do")
	public String pay_insertform() {
		return "/hc/pay-insertform";
	}
	
	@RequestMapping(value="pay-insert.do", method=RequestMethod.POST)
	public  String pay_insert(HttpServletRequest request, PayDTO dto) {
		
		dto.setPay_code(request.getParameter("pay_code"));
		dto.setPay_e_no(request.getParameter("pay_e_no"));
		dto.setPay_e_name(request.getParameter("pay_e_name"));
		dto.setPay_e_dname(request.getParameter("pay_e_dname"));
		dto.setPay_e_position(request.getParameter("pay_e_position"));
		dto.setPay_nametag(request.getParameter("pay_nametag"));
		dto.setPay_bigo(request.getParameter("pay_bigo"));
		
		dto.setPay_year(Integer.parseInt(request.getParameter("pay_year")));
		dto.setPay_month(Integer.parseInt(request.getParameter("pay_month")));
		
		dto.setPay_day(request.getParameter("pay_day"));
		
		
		dto.setPay_chul(Integer.parseInt(request.getParameter("pay_chul")));  
		dto.setPay_work(Integer.parseInt(request.getParameter("pay_work")));
		dto.setPay_work_t(Integer.parseInt(request.getParameter("pay_work_t")));
		dto.setPay_p(Integer.parseInt(request.getParameter("pay_p")));
		dto.setPay_p_t(Integer.parseInt(request.getParameter("pay_p_t")));
		dto.setPay_bob(Integer.parseInt(request.getParameter("pay_bob")));
		dto.setPay_car(Integer.parseInt(request.getParameter("pay_car")));
		dto.setPay_m(Integer.parseInt(request.getParameter("pay_m")));
		dto.setPay_tax(Integer.parseInt(request.getParameter("pay_tax")));
		dto.setPay_total(Integer.parseInt(request.getParameter("pay_total")));
		  
		payservice.payInsert(dto);
		
		return "redirect:pay-list-n.do";
	}
    
}
