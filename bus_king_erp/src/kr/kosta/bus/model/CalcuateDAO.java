package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface CalcuateDAO {
	
	public List<CalculateDTO> calList(HashMap map);
	public void calInsert(CalculateDTO dto);
	public void calUpdate(CalculateDTO dto);
	public int getCalCount();
	public CalculateDTO getCalculate(String cal_code);
	
}
