package kr.kosta.bus.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kosta.bus.model.FuelDTO;
import kr.kosta.bus.model.RepairDTO;
import kr.kosta.bus.model.Wonlyo2_DTO;
import kr.kosta.bus.model.WonlyoDTO;
import kr.kosta.bus.service.FuelService;
import kr.kosta.bus.service.RepairService;
import kr.kosta.bus.service.Wonlyo2Service;
import kr.kosta.bus.service.WonlyoService;

@Controller
@RequestMapping("/rc/*")
public class RepairController {
	
	@Autowired
	Wonlyo2Service Wo2service;
	
	@Autowired
	WonlyoService Woservice;
	@Autowired
	RepairService Reservice;
	
	@Autowired
	FuelService fservice;
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "re-list.do", method =RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 5;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = Reservice.getRepairCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
//		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);
		
		int block = 5;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<RepairDTO> dto = Reservice.repairList(map);

		model.addAttribute("repairlist", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "/rc/re-list";
		
	}
	
	@RequestMapping(value = "re-insertform.do", method = RequestMethod.GET)
	public String insertform() {
		return "/rc/re-insertform";
	}
	@RequestMapping(value = "re-insert.do", method = RequestMethod.POST)
	public  String insert(HttpServletRequest request, RepairDTO dto){
	
		System.out.println(dto.toString());
		dto.setRe_code(request.getParameter("re_code"));
		dto.setRe_b_no(request.getParameter("re_b_no"));
		dto.setRe_date(request.getParameter("re_date"));
		dto.setRe_cost(Integer.parseInt(request.getParameter("re_cost")));
		dto.setRe_state(request.getParameter("re_state"));
		dto.setRe_breakdown(request.getParameter("re_breakdown"));
		dto.setRe_bigo(request.getParameter("re_bigo"));
//		dto.setRe_date2(request.getParameter("re_date2"));
		Reservice.repairInsert(dto);
		return "redirect:re-list.do";
		
	}
	
	@RequestMapping(value="re-updateform.do", method=RequestMethod.GET)
	public String updateform(RepairDTO dto, Model model) {
		dto = Reservice.select(dto);
		model.addAttribute("dto",dto);
		return "/rc/re-updateform";
	}
	@RequestMapping(value="re-update.do", method=RequestMethod.POST)
	public String routeupdate(RepairDTO dto,Model model) {
		model.addAttribute("repair",dto);
		Reservice.repairUpdate(dto);
		return "redirect:re-list.do";
	}
	
    @RequestMapping("re-delete.do")
    public String delete(String re_code) {
    	Reservice.repairDelete(re_code);
      return "redirect:re-list.do";
    }
    
//-------------------------------------------------------------------------------------FUEL
    
    
    
    @RequestMapping(value = "f-list.do", method =RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		int pg = 1;
		String strPg = request.getParameter("pg");
		
		if(strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 5;
		int start = (pg*rowSize) - (rowSize-1);
		int end = pg*rowSize;
		
		int total = fservice.getfuelCount();
		System.out.println("start : " + start + " end : " + end);
		System.out.println("wtire count : " + total);
		
		int allPage = (int)Math.ceil(total/(double)rowSize);
//		int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
		System.out.println("page count : " + allPage);
		
		int block = 5;
		int fromPage = ((pg-1) / block*block) + 1;
		int toPage = ((pg-1) / block*block) + block;
		
		if(toPage > allPage) {
			toPage = allPage;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<FuelDTO> dto = fservice.fuelList(map);

		model.addAttribute("fuel", dto);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "/rc/f-list";
		
	}
	
	@RequestMapping(value = "f-insertform.do", method = RequestMethod.GET)
	public String finsertform() {
		return "/rc/f-insertform";
	}
	@RequestMapping(value = "f-insert.do", method = RequestMethod.POST)
	public  String finsert(HttpServletRequest request, FuelDTO dto){
	
		System.out.println(dto.toString());
		dto.setF_code(request.getParameter("f_code"));
		dto.setF_b_no(request.getParameter("f_b_no"));
		dto.setF_b_energy(request.getParameter("f_energy"));
		dto.setF_date(request.getParameter("f_date"));
		dto.setF_charge(Integer.parseInt(request.getParameter("f_charge")));
		dto.setF_cost(Integer.parseInt(request.getParameter("f_cost")));
		dto.setF_payment(request.getParameter("f_payment"));
		dto.setF_nametag(request.getParameter("f_nametage"));
		dto.setF_bigo(request.getParameter("f_bigo"));
		fservice.fuelInsert(dto);
		return "redirect:f-list.do";
		
	}
	   @RequestMapping(value="f-update.do", method=RequestMethod.GET)
	   public String fuelupdate(String f_code,Model model) {
	      fservice.fuelUpdate(f_code);
	      return "redirect:f-list.do";
	   }
//	 @RequestMapping(value="f-update.do", method=RequestMethod.GET)
//	   public String fuelupdate(String f_code,Model model) {
//	      fservice.fuelUpdate(f_code);
//	      return "redirect:f-list.do";
//	   }
//
//	@RequestMapping(value="f-update.do", method=RequestMethod.GET)
//	public String fuelupdate(FuelDTO dto,Model model) {
//		model.addAttribute("fuel",dto);
//		fservice.fuelUpdate(dto);
//		return "redirect:f-list.do";
//	}
	
    @RequestMapping("f-delete.do")
    public String fdelete(String f_code) {
     fservice.fuelDelete(f_code);
      return "redirect:f-list.do";
    }
    
    
//	-------------------------------------------------------------Wonlyo  
    
	@RequestMapping(value = "wo-list.do", method = RequestMethod.GET)
	public String list(Model model) {
		HashMap map = new HashMap();
		List<WonlyoDTO> dto = Woservice.wonlyoList(map);
		model.addAttribute("Wonlyolist", dto);
		
		return "/rc/wo-list";
		}
	
	@RequestMapping(value="wo-updateform.do",method=RequestMethod.GET)
	public String woupdateform(WonlyoDTO dto, Model model) {
		dto = Woservice.selectBy(dto);
		model.addAttribute("dto",dto);
		return "/rc/wo-updateform";
		
	}

	@RequestMapping(value="wo-update.do",method = RequestMethod.POST)
	public String woupdate(WonlyoDTO dto, Model model, HttpServletRequest request) {
		dto.setWo_code(request.getParameter("wo_code"));
		dto.setWo_total(Integer.parseInt(request.getParameter("wo_total")));
		Woservice.wonlyoUpdate(dto);
		return "redirect:wo-list.do";
		
	}
	

	/*
	 * @RequestMapping("wo-delete.do") public String fdelete(String f_code) {
	 * fservice.fuelDelete(f_code); return "redirect:f-list.do"; }
	 */
    //-----------------------------

	   @RequestMapping(value = "woio-list.do", method =RequestMethod.GET)
		public String wolist(HttpServletRequest request, Model model) {
			int pg = 1;
			String strPg = request.getParameter("pg");
			
			if(strPg != null) {
				pg = Integer.parseInt(strPg);
			}
			
			int rowSize = 5;
			int start = (pg*rowSize) - (rowSize-1);
			int end = pg*rowSize;
			
			int total = Wo2service.getwonlyo2Count();
			System.out.println("start : " + start + " end : " + end);
			System.out.println("wtire count : " + total);
			
			int allPage = (int)Math.ceil(total/(double)rowSize);
//			int totalPage = total / rowSize + (total % rowSiez == 0 ? 0 : 1);
			System.out.println("page count : " + allPage);
			
			int block = 5;
			int fromPage = ((pg-1) / block*block) + 1;
			int toPage = ((pg-1) / block*block) + block;
			
			if(toPage > allPage) {
				toPage = allPage;
			}
			
			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			
			List<Wonlyo2_DTO> dto = Wo2service.wonlyo2List(map);

			model.addAttribute("wo2",dto);
			model.addAttribute("pg", pg);
			model.addAttribute("allPage", allPage);
			model.addAttribute("block", block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			
			return "/rc/woio-list";
			
		}
	   @RequestMapping(value = "woio-insertform.do", method = RequestMethod.GET)
		public String woioinsertform() {
			return "/rc/woio-insertform";
		}
		@RequestMapping(value = "woio-insert.do", method = RequestMethod.POST)
		public  String woipinsert(HttpServletRequest request, Wonlyo2_DTO dto){
			
			System.out.println(dto.toString());
			dto.setWo2_no(request.getParameter("wo2_no"));
			dto.setWo2_iptype(request.getParameter("wo2_iptype"));
			dto.setWo2_type(request.getParameter("wo2_type"));
			dto.setWo2_number(Integer.parseInt(request.getParameter("wo2_number")));
			dto.setWo2_date(request.getParameter("wo2_date"));
			Wo2service.wonlyo2Insert(dto);
			return "redirect:woio-list.do";
			
		}
}
    


