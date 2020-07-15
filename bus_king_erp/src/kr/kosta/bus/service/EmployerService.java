package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.RouteDTO;

public interface EmployerService {
	public List<EmployerDTO> employerList(HashMap map);
	public void employerInsert(EmployerDTO dto);
	public void employerUpdate(EmployerDTO dto);
	public void employerDelete(String e_no);
	public EmployerDTO employerUpdate2(EmployerDTO dto);
	public int getEmployerCount();
	public List<EmployerDTO> employerSearch(HashMap map);

}
