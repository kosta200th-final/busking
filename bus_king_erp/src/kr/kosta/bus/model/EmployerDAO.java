package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface EmployerDAO {
	
	public List<EmployerDTO> employerList(HashMap map);
	public void employerInsert(EmployerDTO dto);
	public void employerUpdate(EmployerDTO dto);
	public void employerDelete(String e_no);
	public EmployerDTO employerUpdate2(EmployerDTO dto);
	public int getEmployerCount();
	public List<EmployerDTO> employerSearch(HashMap map);

}
