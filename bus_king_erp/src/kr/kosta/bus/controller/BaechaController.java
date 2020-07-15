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

import kr.kosta.bus.model.AllocationDTO;
import kr.kosta.bus.model.BusDTO;
import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.RouteDTO;
import kr.kosta.bus.service.AllocationService;
import kr.kosta.bus.service.BusService;
import kr.kosta.bus.service.RouteService;

@Controller
@RequestMapping("/bc/*")
public class BaechaController {

	@Autowired
	BusService bservice;
	@Autowired
	RouteService rservice;
	@Autowired
	AllocationService aservice;

	// ###############################
	// 버스
	@RequestMapping("b-list.do")
	public String b_list(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = bservice.getBusCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
//		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);

		int block = 10;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<BusDTO> dto = bservice.busList(map);
		model.addAttribute("buslist", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		return "/bc/b-list";
	}

	// b-insert
	@RequestMapping(value = "b-insertform.do", method = RequestMethod.GET)
	public String b_insertform() {
		return "/bc/b-insertform";
	}

	@RequestMapping(value = "b-insert.do", method = RequestMethod.POST)
	public String b_insert(HttpServletRequest request, BusDTO dto) {
		dto.setB_no(request.getParameter("b_no"));
		dto.setB_year(Integer.parseInt(request.getParameter("b_year")));
		dto.setB_energy(request.getParameter("b_energy"));
		dto.setB_start(Date.valueOf(request.getParameter("b_start")));
		dto.setB_type(request.getParameter("b_type"));
		dto.setB_acc(Integer.parseInt(request.getParameter("b_acc")));

		dto.setB_state(request.getParameter("b_state"));
		dto.setB_mile(Integer.parseInt(request.getParameter("b_mile")));
		dto.setB_recent(Date.valueOf(request.getParameter("b_recent")));
		bservice.busInsert(dto);
		return "redirect:b-list.do";
	}

	// b-update
	@RequestMapping(value = "b-update.do", method = RequestMethod.GET)
	public String busupdateform(BusDTO dto, Model model) {
		model.addAttribute("dto", dto);
		return "/bc/b-updateform";
	}

	@RequestMapping(value = "b-update.do", method = RequestMethod.POST)
	public String busupdate(BusDTO dto, Model model) {
		bservice.busUpdate(dto);
		return "redirect:b-list.do";
	}

	// b-delete
	@RequestMapping("b-delete.do")
	public String busdelete(String b_no) {
		bservice.busDelete(b_no);
		return "redirect:b-list.do";
	}
	
	

	// ###############################
	// 노선
	@RequestMapping("r-list.do")
	public String home(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = rservice.getRouteCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
//		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);

		int block = 10;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<RouteDTO> dto = rservice.routeList(map);
		model.addAttribute("routelist", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		return "/bc/r-list";
	}

	// r-insert
	@RequestMapping(value = "r-insertform.do", method = RequestMethod.GET)
	public String insertform() {
		return "/bc/r-insertform";
	}

	@RequestMapping(value = "r-insert.do", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, RouteDTO dto) {
		dto.setR_no(request.getParameter("r_no"));
		dto.setR_start(request.getParameter("r_start"));
		dto.setR_end(request.getParameter("r_end"));
		dto.setR_s_time(request.getParameter("r_s_time"));
		dto.setR_e_time(request.getParameter("r_e_time"));
		dto.setR_interval(Integer.parseInt(request.getParameter("r_interval")));

		dto.setR_map(request.getParameter("r_map"));
		dto.setR_pay_adult(Integer.parseInt(request.getParameter("r_pay_adult")));
		dto.setR_pay_adult2(Integer.parseInt(request.getParameter("r_pay_adult2")));
		dto.setR_pay_teen(Integer.parseInt(request.getParameter("r_pay_teen")));
		dto.setR_pay_teen2(Integer.parseInt(request.getParameter("r_pay_teen2")));
		dto.setR_pay_kid(Integer.parseInt(request.getParameter("r_pay_kid")));
		dto.setR_pay_kid2(Integer.parseInt(request.getParameter("r_pay_kid2")));
		rservice.routeInsert(dto);
		return "redirect:r-list.do";
	}

	// r-update
	@RequestMapping(value = "r-update.do", method = RequestMethod.GET)
	public String routeupdateform(RouteDTO dto, Model model) {
		model.addAttribute("dto", dto);
		return "/bc/r-updateform";
	}

	@RequestMapping(value = "r-update.do", method = RequestMethod.POST)
	public String routeupdate(RouteDTO dto, Model model) {
		rservice.routeUpdate(dto);
		return "redirect:r-list.do";
	}

	// r-delete
	@RequestMapping("r-delete.do")
	public String routedelete(String r_no) {
		rservice.routeDelete(r_no);
		return "redirect:r-list.do";
	}

	
	public static String time = "A조";
	// ###############################
	// 배차
	@RequestMapping("a-list.do")
	public String a_list(HttpServletRequest request, Model model) {
		
		String a_time = request.getParameter("time");
		if(a_time != null) time = a_time;
		System.out.println(time + "asdf");
		
		int pg = 1;
		String strPg = request.getParameter("pg");

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = aservice.getAllocationCount(time);
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);
//  		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);

		int block = 10;
		int fromPage = ((pg - 1) / block * block) + 1;
		int toPage = ((pg - 1) / block * block) + block;

		if (toPage > allPage) {
			toPage = allPage;
		}
	
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("zo", time);
		

		List<AllocationDTO> dto = aservice.allocationList(map);
		List<BusDTO> blist = aservice.blist(map);
		List<RouteDTO> rlist = aservice.rlist(map);
		List<EmployerDTO> elist = aservice.elist(map);
		model.addAttribute("allocationlist", dto);
		model.addAttribute("blist", blist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("elist", elist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		return "/bc/a-list";
	}

	// a-insert
	@RequestMapping(value = "a-insert.do", method = RequestMethod.POST)
	public String a_insert(HttpServletRequest request, AllocationDTO dto) {
		String[] sp = dto.getA_e_no().split(":", 2);
		dto.setA_e_no(sp[0]);
		System.out.println(dto);
		aservice.allocationInsert(dto);
		return "redirect:a-list.do";
	}

	// a-update
	@RequestMapping(value = "a-update.do", method = RequestMethod.GET)
	public String allocationupdateform(AllocationDTO dto, Model model) {
		model.addAttribute("dto", dto);
		return "/bc/a-updateform";
	}

	@RequestMapping(value = "a-update.do", method = RequestMethod.POST)
	public String allocationupdate(AllocationDTO dto, Model model) {
		aservice.allocationUpdate(dto);
		return "redirect:a-list.do";
	}

	// a-delete
	@RequestMapping("a-delete.do")
	public String allocationdelete(AllocationDTO dto) {
		aservice.allocationDelete(dto);
		return "redirect:a-list.do";
	}

}
