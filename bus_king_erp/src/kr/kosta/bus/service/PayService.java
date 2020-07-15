package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.PayDTO;

public interface PayService {
	
	public List<PayDTO> payList(HashMap map);	// 리스트... 
	public void payInsert(PayDTO dto);	// 인서트

}
