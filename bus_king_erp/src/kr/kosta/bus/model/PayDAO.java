package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface PayDAO {
	
	public List<PayDTO> payList(HashMap map);	// 리스트... 
	public void payInsert(PayDTO dto);	// 인서트
	
}
