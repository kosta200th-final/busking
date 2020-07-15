package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.PenaltyDTO;

public interface PenaltyService {

	public List<PenaltyDTO> penaltyList(HashMap map);

	public void penaltyInsert(PenaltyDTO dto);
	
	public void penaltyUpdate(PenaltyDTO dto);

	public void penaltyDelete(String p_code);

	public int getpenaltyCount();
	
	public PenaltyDTO penaltyDetail(String p_code);
	
	public void p_paymentUpdate(String p_code);
}
