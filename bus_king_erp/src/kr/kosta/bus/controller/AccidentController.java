package kr.kosta.bus.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kosta.bus.model.AccidentDTO;
import kr.kosta.bus.model.AccountDTO;
import kr.kosta.bus.model.BusDTO;
import kr.kosta.bus.model.ComplaintDTO;
import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.PenaltyDTO;
import kr.kosta.bus.model.RepairDTO;
import kr.kosta.bus.service.AccidentService;
import kr.kosta.bus.service.AccountService;
import kr.kosta.bus.service.ComplaintService;
import kr.kosta.bus.service.PenaltyService;
import kr.kosta.bus.service.RepairService;

@Controller
@RequestMapping("/ad/*")
public class AccidentController {

	@Autowired
	ComplaintService complaintService;

	@Autowired
	PenaltyService penaltyService;
	
	@Autowired
	AccidentService accidentService;
	
	@Autowired
	RepairService repairService;
	
	@Autowired
	AccountService accountService;
	
	// 민원관리
	@RequestMapping(value = "comp-list.do")
	public String complaintlist(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 3;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = complaintService.getcomplaintCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
		System.out.println("page count : " + allPage);

		int block = 3;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
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
		HashMap map = new HashMap();

		List<BusDTO> blist = complaintService.blist(map);
		List<EmployerDTO> elist = complaintService.elist(map);

		model.addAttribute("blist", blist);
		model.addAttribute("elist", elist);

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
	public String complaintupdateform(HttpServletRequest request, String c_no, Model model) {

		ComplaintDTO dto = complaintService.complaintDetail(c_no);

		model.addAttribute("complaintupdate", dto);

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

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 3;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = penaltyService.getpenaltyCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
		System.out.println("page count : " + allPage);

		int block = 3;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
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
	public String penaltyinsertform(Model model) {
		HashMap map = new HashMap();

		List<BusDTO> blist = complaintService.blist(map);
		List<EmployerDTO> elist = complaintService.elist(map);

		model.addAttribute("blist", blist);
		model.addAttribute("elist", elist);
		return "/ad/p-insertform";
	}

	@RequestMapping(value = "p-insert.do", method = RequestMethod.POST)
	public String penaltyinsert(HttpServletRequest request, PenaltyDTO dto) {

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
		
		//accountService.accountInsesrt(dto);

		return "redirect:p-list.do";
	}

	@RequestMapping(value = "p-updateform.do", method = RequestMethod.GET)
	public String penaltyupdateform(HttpServletRequest request, String p_code, Model model) {

		PenaltyDTO dto = penaltyService.penaltyDetail(p_code);

		model.addAttribute("penaltyupdate", dto);

		return "/ad/p-updateform";
	}

	@RequestMapping(value = "p-ac.do", method = RequestMethod.GET)
	public String penaltyupdate(AccountDTO dto, String p_code, Model model) {
		penaltyService.p_paymentUpdate(p_code);
		
		penaltyService.accountInsert(dto);

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
		penaltyService.penaltyDelete(p_code);
		
		System.out.println(p_code);

		return "redirect:p-list.do";
	}

	// 사고관리
	@RequestMapping(value = "acc-list.do")
	public String accidentlist(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 3;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = accidentService.getaccidentCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
		System.out.println("page count : " + allPage);

		int block = 3;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<AccidentDTO> dto = accidentService.accidentList(map);

		model.addAttribute("accidentlist", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		System.out.println(dto.toString());

		return "/ad/acc-list";

	}

	// 차트 
	@RequestMapping(value = "acc-insertform.do", method = RequestMethod.GET)
	public String accidentinsertform(Model model) {
		HashMap map = new HashMap();

		List<BusDTO> blist = accidentService.blist(map);
		List<EmployerDTO> elist = accidentService.elist(map);

		model.addAttribute("blist", blist);
		model.addAttribute("elist", elist);
		return "/ad/acc-insertform";
	}

	@RequestMapping(value = "acc-insert.do", method = RequestMethod.POST)
	public String accidentinsert(HttpServletRequest request, AccidentDTO dto) {

		dto.setAcc_no(Integer.parseInt(request.getParameter("acc_no")));
		dto.setAcc_b_no(request.getParameter("acc_b_no"));
		dto.setAcc_e_no(request.getParameter("acc_e_no"));
		dto.setAcc_e_licence(request.getParameter("acc_e_licence"));
		System.out.println("라이센스");
		System.out.println(dto.getAcc_e_licence());
		dto.setAcc_state(request.getParameter("acc_state"));
		System.out.println("상태");
		System.out.println(dto.getAcc_state());
		dto.setAcc_date(request.getParameter("acc_date"));
		dto.setAcc_located(request.getParameter("acc_located"));
		dto.setAcc_breakdown(request.getParameter("acc_breakdown"));
		
		accidentService.accidentInsert(dto);

		return "redirect:acc-list.do";
	}

	@RequestMapping(value = "acc-updateform.do", method = RequestMethod.GET)
	public String accidentupdateform(HttpServletRequest request, String acc_no, Model model) {

		AccidentDTO dto = accidentService.accidentDetail(acc_no);

		model.addAttribute("accidentupdate", dto);

		return "/ad/acc-updateform";
	}

	@RequestMapping(value = "acc-repair.do", method = RequestMethod.GET)
	public String accidentupdate(RepairDTO dto, String acc_no, Model model) {
		accidentService.acc_stateUpdate(acc_no);
		
		accidentService.repairInsert(dto);

		return "redirect:acc-list.do";
	}

	@RequestMapping(value = "acc-update.do", method = RequestMethod.POST)
	public String accidentupdate(AccidentDTO dto, Model model) {

		System.out.println(dto.getAcc_state());
		accidentService.accidentUpdate(dto);

		return "redirect:acc-list.do";
	}

	@RequestMapping("acc-delete.do")
	public String accidentdelete(String acc_no) {
		accidentService.accidentDelete(acc_no);

		return "redirect:acc-list.do";
	}
}
