package kr.kosta.bus.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kosta.bus.model.ComplaintDTO;
import kr.kosta.bus.model.PenaltyDTO;
import kr.kosta.bus.model.RouteDTO;
import kr.kosta.bus.service.ComplaintService;
import kr.kosta.bus.service.PenaltyService;

@Controller
@RequestMapping("/ad/*")
public class AccidentController {

	@Autowired
	ComplaintService complaintService;
	
	@Autowired
	PenaltyService penaltyService;
	
	// 민원관리
	@RequestMapping(value = "comp-list.do")
	public String complaintlist(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 3;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = complaintService.getcomplaintCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
		System.out.println("page count : " + allPage);
		
		int block = 3;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ComplaintDTO> dto = complaintService.complaintList(map);
		
		model.addAttribute("complaintlist", dto);	
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		System.out.println(dto.toString());
		
		return "/ad/comp-list";
	}
	
	@RequestMapping(value = "comp-insertform.do", method = RequestMethod.GET)
	public String complaintinsertform(Model model) {
			
		return "/ad/comp-insertform";
	}
	
	@RequestMapping(value = "comp-insert.do", method = RequestMethod.POST)
	public String complaintinsert(HttpServletRequest request, ComplaintDTO dto) {
		dto.setC_title(request.getParameter("c_title"));
		dto.setC_type(request.getParameter("c_type"));
		dto.setC_content(request.getParameter("c_content"));
		dto.setC_e_no(request.getParameter("c_e_no"));
		dto.setC_e_name(request.getParameter("c_e_name"));
		dto.setC_b_no(request.getParameter("c_b_no"));
		
		complaintService.complaintInsert(dto);
		
		return "redirect:comp-list.do";
	}
	
	@RequestMapping(value = "comp-updateform.do", method = RequestMethod.GET)
	public String complaintupdateform(HttpServletRequest request, int c_no, Model model) {
		
		ComplaintDTO dto = complaintService.complaintDetail(c_no);
		
		model.addAttribute("complaintupdate",dto);
		
		return "/ad/comp-updateform";
	}
	
	@RequestMapping(value = "comp-update.do", method = RequestMethod.POST)
	public String complaintupdate(ComplaintDTO dto, Model model) {
		complaintService.complaintUpdate(dto);
		
		return "redirect:comp-list.do";
	}
	
    @RequestMapping("comp-delete.do")
    public String complaintdelete(String c_no) {
    	complaintService.complaintDelete(c_no);
    	
    	return "redirect:comp-list.do";
    }

    // 범칙금 관리
    @RequestMapping(value = "p-list.do")
	public String penaltylist(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 3;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = penaltyService.getpenaltyCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
		System.out.println("page count : " + allPage);
		
		int block = 3;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<PenaltyDTO> dto = penaltyService.penaltyList(map);
		
		model.addAttribute("penaltylist", dto);	
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		System.out.println(dto.toString());
		
		return "/ad/p-list";
	}
    
    @RequestMapping(value = "p-insertform.do", method = RequestMethod.GET)
	public String penaltyinsertform() {
		return "/ad/p-insertform";
	}
	
	@RequestMapping(value = "p-insert.do", method = RequestMethod.POST)
	public String penaltyinsert(HttpServletRequest request, PenaltyDTO dto) {
		
		dto.setP_code(request.getParameter("p_code"));
		dto.setP_b_no(request.getParameter("p_b_no"));
		dto.setP_e_no(request.getParameter("p_e_no"));
		dto.setP_e_licence(request.getParameter("p_e_licence"));
		dto.setP_cost(Integer.parseInt(request.getParameter("p_cost")));
		dto.setP_payment(request.getParameter("p_payment"));
		dto.setP_date(request.getParameter("p_date"));
		dto.setP_located(request.getParameter("p_located"));
		dto.setP_police(request.getParameter("p_police"));
		dto.setP_history(request.getParameter("p_history"));
		dto.setP_bigo(request.getParameter("p_bigo"));
		
		penaltyService.penaltyInsert(dto);
		
		return "redirect:p-list.do";
	}
	
	@RequestMapping(value = "p-updateform.do", method = RequestMethod.GET)
	public String penaltyupdateform(HttpServletRequest request, String p_code, Model model) {
		
		PenaltyDTO dto = penaltyService.penaltyDetail(p_code);
		
		model.addAttribute("penaltyupdate",dto);
		
		return "/ad/p-updateform";
	}
	
	@RequestMapping(value="p-update.do", method=RequestMethod.GET)
	public String fuelupdate(String p_code, Model model) {
		penaltyService.p_paymentUpdate(p_code);
	    
		return "redirect:p-list.do";
	}
	
	@RequestMapping(value = "p-update.do", method = RequestMethod.POST)
	public String penaltyupdate(PenaltyDTO dto, Model model) {
		
		System.out.println(dto.getP_payment());
		penaltyService.penaltyUpdate(dto);
		
		return "redirect:p-list.do";
	}
	
	 @RequestMapping("p-delete.do")
	    public String penaltydelete(String p_code) {
		 complaintService.complaintDelete(p_code);
	    	
	    return "redirect:p-list.do";
    }
	
	
}
