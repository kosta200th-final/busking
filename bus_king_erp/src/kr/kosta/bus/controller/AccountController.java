package kr.kosta.bus.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kosta.bus.model.AccountDTO;
import kr.kosta.bus.model.CalculateDTO;
import kr.kosta.bus.service.AccountService;
import kr.kosta.bus.service.CalculateService;


@Controller
@RequestMapping("/ac/*")
public class AccountController {

	@Autowired
	AccountService accountService;
	@Autowired
	CalculateService calculateService;
	
	
	//-- Account ---------------------------------
	static public String cnt_state = "전체";
	static public String cnt_code = "전체";
	
	@RequestMapping("ac-list.do")
	public String ac_list(HttpServletRequest request, Model model) {
		 
		//-------------------------------------------------------------
		String ac_state = request.getParameter("cnt_state");
		if(ac_state != null && ac_state.length() > 0) cnt_state = ac_state;
		// ac_state.length() > 0 : request.getParameter("cnt_state"); 하면  null은 아니지만 빈 값이 들어오기 때문에
		if(cnt_state.equals("전체")) cnt_state = "매%";
		
		String ac_code = request.getParameter("cnt_code");
		if(ac_code != null) cnt_code = ac_code;
		if(cnt_code.equals("전체")) cnt_code = "%";
		else if(cnt_code.equals("급여")) cnt_code = "PAY%";
		else if(cnt_code.equals("정비")) cnt_code = "RE%";
		else if(cnt_code.equals("연료")) cnt_code = "F%";
		else if(cnt_code.equals("범칙금")) cnt_code = "PEN%";
		else if(cnt_code.equals("정산")) cnt_code = "CAL%";
		
		//-------------------------------------------------------------
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 10;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = accountService.getAccountCount(cnt_state);
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
		System.out.println("page count : " + allPage);
		
		int block = 10;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		
		//-------------------------------------------------------------
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("state", cnt_state);
		map.put("ac_code", cnt_code);
		System.out.println(cnt_state);
		System.out.println(cnt_code);
		
		List<AccountDTO> dto = accountService.accountList(map);
		//List<AccountDTO> selboxlist = accountService.selboxlist(map);
		
		model.addAttribute("accountList", dto);
		//model.addAttribute("selboxlist", selboxlist);
		
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		//-------------------------------------------------------------
		
		return "/ac/ac-list";
	}
	
	@RequestMapping(value="ac-update.do", method= RequestMethod.GET)
	public String accountUpdateform(AccountDTO dto, Model model) {
		
		dto = accountService.getAccount(dto.getAc_code());
		model.addAttribute("dto",dto);
		return "/ac/ac-updateform";
		
	}

	@RequestMapping(value="ac-update.do", method= RequestMethod.POST)
	public String accountUpdate(AccountDTO dto, Model model) {
		
		accountService.accountUpdate(dto);
		return "redirect:ac-list.do";
		
	}
	

	
	//-- Calculate ---------------------------------
	@RequestMapping("cal-list.do")
	public String home(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 10;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = calculateService.getCalCount();
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
		
		List<CalculateDTO> dto = calculateService.calList(map);
		model.addAttribute("callist", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "/ac/cal-list";
	}
	
	@RequestMapping(value="cal-insertform.do", method = RequestMethod.GET)
	public String insertform() {
		return "/ac/cal-insertform";
	}
	
	@RequestMapping(value="cal-insert.do", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, CalculateDTO dto) {
		dto.setCal_code(request.getParameter("cal_code"));
		dto.setCal_b_no(request.getParameter("cal_b_no"));
		dto.setCal_nametag(request.getParameter("cal_nametag"));
		dto.setCal_bigo(request.getParameter("cal_bigo"));
		
		dto.setCal_hap_c(Integer.parseInt(request.getParameter("cal_hap_c")));
		dto.setCal_hap_m(Integer.parseInt(request.getParameter("cal_hap_m")));
		dto.setCal_total(Integer.parseInt(request.getParameter("cal_total")));
		
		calculateService.calInsert(dto);
		
		return "redirect:cal-list.do";
	}
	
	@RequestMapping(value="cal-update.do", method= RequestMethod.GET)
	public String calculateUpdateform(CalculateDTO dto, Model model) {
		
		dto = calculateService.getCalculate(dto.getCal_code());
		model.addAttribute("dto",dto);
		return "/ac/cal-updateform";
		
	}

	@RequestMapping(value="cal-update.do", method= RequestMethod.POST)
	public String calculateUpdate(CalculateDTO dto, Model model) {
		
		calculateService.calUpdate(dto);
		return "redirect:cal-list.do";
		
	}
	
}







