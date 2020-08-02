package kr.kosta.bus.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kosta.bus.model.Commute2DTO;
import kr.kosta.bus.model.Commute3DTO;
import kr.kosta.bus.model.CommuteDTO;
import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.PayDTO;
import kr.kosta.bus.security.service.ShaEncoder;
import kr.kosta.bus.service.CommuteService;
import kr.kosta.bus.service.EmployerService;
import kr.kosta.bus.service.PayService;

@Controller
@RequestMapping("/hc/*")
public class HrController {
	
	@Inject
	ShaEncoder shaEncoder; //암호화 빈
	
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
	public  String insert(@RequestParam String e_pwd,
			@RequestParam String e_name, 
			@RequestParam String authority, HttpServletRequest request) {
		EmployerDTO dto = new EmployerDTO();
		
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
		  dto.setAuthority(request.getParameter("authority"));
		  
		  dto.setE_career(Integer.parseInt(request.getParameter("e_career")));	  
		  dto.setE_break(Integer.parseInt(request.getParameter("e_break")));	
		  
		  dto.setE_start(Date.valueOf(request.getParameter("e_start")));
	      
		  System.out.println(dto.toString());
		service.employerInsert(dto);

		String aaa = dto.getE_jumin();
		String e_no = service.employerSelect(aaa);

		String dbpw=shaEncoder.saltEncoding(e_pwd, e_no);
		  HashMap map=new HashMap();
			map.put("e_no", e_no);
			map.put("e_pwd", dbpw);
			map.put("e_name", e_name);
			map.put("authority", authority);
			
			
			service.employerUpdate3(map);
			
			
		return "redirect:e-list.do";
	}
	
	@RequestMapping(value="e-updateform.do", method=RequestMethod.GET)
	public String Employerupdateform(EmployerDTO dto,Model model) {
		dto = service.employerUpdate2(dto);
		model.addAttribute("dto",dto);
		return "/hc/e-updateform";
	}

	@RequestMapping(value="e-update.do", method=RequestMethod.POST)
	public String Employerupdate(EmployerDTO dto, Model model) {
		if(dto.getE_pwd().length() > 0) {
			String dbpw=shaEncoder.saltEncoding(dto.getE_pwd(), dto.getE_no());
			dto.setE_pwd(dbpw);
			service.employerUpdate(dto);
			
		}
		else {
			service.employerUpdateNopwd(dto);
		}
		return "redirect:e-list.do";
	}
	
    @RequestMapping("e-delete.do")
    public String delete(String e_no) {
      service.employerDelete(e_no);
      return "redirect:e-list.do";
    }
    
    
    // **********************************************************************************************************
	@Autowired
	PayService pay_service;
	
	//페이관리	

	@RequestMapping("pay-list.do")	
	public String pay_list(HttpServletRequest request, Model model) { // home -> rlist
		
		String py = "";
		String pm = "";
		String peno = "";

		if(request.getParameter("pay_year") != null && !request.getParameter("pay_year").equals("==연도==")) py = request.getParameter("pay_year");
		if(request.getParameter("pay_month") != null && !request.getParameter("pay_month").equals("==월==")) pm = request.getParameter("pay_month");
		if(request.getParameter("pay_e_no") != null && !request.getParameter("pay_e_no").equals("==사번==")) peno = request.getParameter("pay_e_no");

		
		HashMap map = new HashMap();
		map.put("pay_year", py);
		map.put("pay_month", pm);
		map.put("pay_e_no", peno);
		
		List<PayDTO> ylist = pay_service.ylist(map);
		List<PayDTO> mlist = pay_service.mlist(map);
		List<PayDTO> elist = pay_service.elist(map);

		model.addAttribute("ylist", ylist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("elist", elist);
		
		List<PayDTO> dto = pay_service.payList(map);
		model.addAttribute("paylist", dto);
		
		return "/hc/pay-list2";
	}
	
	@RequestMapping("pay-insertform.do")
	public String pay_insertform() {
		return "/hc/pay-insertform";
	}
	
	@RequestMapping(value="pay-insert.do", method=RequestMethod.POST)
	public  String pay_insert(HttpServletRequest request, PayDTO dto) {
		
		dto.setPay_e_no(request.getParameter("pay_e_no"));
		dto.setPay_e_name(request.getParameter("pay_e_name"));
		dto.setPay_e_dname(request.getParameter("pay_e_dname"));
		dto.setPay_e_position(request.getParameter("pay_e_position"));
		
		dto.setPay_year(Integer.parseInt(request.getParameter("pay_year")));
		dto.setPay_month(Integer.parseInt(request.getParameter("pay_month")));		
		dto.setPay_day(request.getParameter("pay_day"));
		
		dto.setPay_chul(Integer.parseInt(request.getParameter("pay_chul")));  
		dto.setPay_work(Integer.parseInt(request.getParameter("pay_work")));
		dto.setPay_work_t(Integer.parseInt(request.getParameter("pay_work_t")));
		
		dto.setPay_p_t(Integer.parseInt(request.getParameter("pay_p_t")));
		dto.setPay_p(Integer.parseInt(request.getParameter("pay_p")));
		
		dto.setPay_m(Integer.parseInt(request.getParameter("pay_m")));
		dto.setPay_tax(Integer.parseInt(request.getParameter("pay_tax")));
		
		dto.setPay_nametag(request.getParameter("pay_nametag"));
		dto.setPay_bigo(request.getParameter("pay_bigo"));
		
		int bob = 200000;
		int car = 300000;
		
		dto.setPay_bob(bob);
		dto.setPay_car(car);
		
		// 급여총합 = 기본급 + 특근수당 + 만근수당 + 식대 + 차량지원비 - 세금공제
		int p = (Integer.parseInt(request.getParameter("pay_p")));
		int pt = (Integer.parseInt(request.getParameter("pay_p_t")));
		int pm = (Integer.parseInt(request.getParameter("pay_m")));
		int tax = (Integer.parseInt(request.getParameter("pay_tax")));
		
		dto.setPay_total(p+pt+pm+bob+car-tax);
		  
		pay_service.payInsert(dto);
		
		return "redirect:pay-list.do";
	}
	
	
	@Autowired
	CommuteService comm_service;
	
	// 근태관리

	@RequestMapping("comm-list.do")
	public String comm_list(HttpServletRequest request, Model model) { 

		String cyd = "";
		String cmd = "";
		String cdd = "";
		String cym = "";
		String cmm = "";
		String cem = "";

		if(request.getParameter("comm_year_d") != null && !request.getParameter("comm_year_d").equals("==연도==")) cyd = request.getParameter("comm_year_d");
		if(request.getParameter("comm_month_d") != null && !request.getParameter("comm_month_d").equals("==월==")) cmd = request.getParameter("comm_month_d");
		if(request.getParameter("comm_day_d") != null && !request.getParameter("comm_day_d").equals("==일자==")) cdd = request.getParameter("comm_day_d");
		if(request.getParameter("comm_year_m") != null && !request.getParameter("comm_year_m").equals("==연도==")) cym = request.getParameter("comm_year_m");
		if(request.getParameter("comm_month_m") != null && !request.getParameter("comm_month_m").equals("==월==")) cmm = request.getParameter("comm_month_m");
		if(request.getParameter("comm_e_no_m") != null && !request.getParameter("comm_e_no_m").equals("==사번==")) cem = request.getParameter("comm_e_no_m");

		
		HashMap map = new HashMap();
		map.put("comm_year_d", cyd);
		map.put("comm_month_d", cmd);
		map.put("comm_day_d", cdd);
		
		map.put("comm_year_m", cym);
		map.put("comm_month_m", cmm);
		map.put("comm_e_no_m", cem);
		
		model.addAttribute("comm_year_d", cyd);
		model.addAttribute("comm_month_d", cmd);
		model.addAttribute("comm_day_d", cdd);
		model.addAttribute("comm_year_m", cym);
		model.addAttribute("comm_month_m", cmm);
		model.addAttribute("comm_e_no_m", cem);

		List<CommuteDTO> ylist = comm_service.ylist(map);
		List<CommuteDTO> mlist = comm_service.mlist(map);
		List<CommuteDTO> dlist = comm_service.dlist(map);
		List<CommuteDTO> elist = comm_service.elist(map);
		
		model.addAttribute("ylist", ylist);
		model.addAttribute("mlist", mlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("elist", elist);

		List<Commute2DTO> dto2 = comm_service.commuteList_day(map);
		List<Commute3DTO> dto3 = comm_service.commuteList_month(map);
		model.addAttribute("comm_list_d", dto2);
		model.addAttribute("comm_list_m", dto3);
		
		// System.out.println("dto2의 투스트링");
		// System.out.println(dto2.toString());
		
		return "/hc/comm-list";
	}
	
	@RequestMapping("comm-insertform.do")
	public String comm_insertform() {
		return "/hc/comm-insertform2";
	}
	
	@RequestMapping(value="comm-insert.do", method=RequestMethod.POST)
	public  String comm_insert(HttpServletRequest request, CommuteDTO dto) {
		
		//2020-07-01
		String comm_date = request.getParameter("comm_date");
		
		StringTokenizer st = new StringTokenizer(comm_date, "-");
		
		String y = st.nextToken();
		String m = st.nextToken();
		String d = st.nextToken();
		
		// System.out.println("쪼갠결과");
		// System.out.println(y+"와"+m+"과"+d);
		
		dto.setComm_year(y);
		dto.setComm_month(m);
		dto.setComm_day(d);
		
		// System.out.println("dto 겟");
		// System.out.println(dto.getComm_year());
		// System.out.println(dto.getComm_month());
		// System.out.println(dto.getComm_day());
		
		dto.setComm_type_d(request.getParameter("comm_type_d"));
		dto.setComm_e_no(request.getParameter("comm_e_no"));
		dto.setComm_e_name(request.getParameter("comm_e_name"));
		dto.setComm_e_dname(request.getParameter("comm_e_dname"));
		dto.setComm_e_position(request.getParameter("comm_e_position"));
		
		String cw = request.getParameter("comm_work");
		dto.setComm_work(cw);
		
		if(cw=="출근") {
			dto.setComm_time(18);
		}
		
		if(cw=="결근" || cw=="병가" || cw=="휴가") {
			dto.setComm_time(0);
		}
		
		comm_service.commuteInsert(dto);
		
		return "redirect:comm-list.do";
		
	}
	
	// **********************************************************************************************************

}
