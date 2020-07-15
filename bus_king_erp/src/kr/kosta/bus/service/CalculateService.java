package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.CalculateDTO;

public interface CalculateService {
	public List<CalculateDTO> calList(HashMap map);
	public void calInsert(CalculateDTO dto);
	public void calUpdate(CalculateDTO dto);
	public CalculateDTO getCalculate(String cal_code);
	public int getCalCount();
}
