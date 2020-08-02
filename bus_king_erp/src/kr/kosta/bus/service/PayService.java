package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.CommuteDTO;
import kr.kosta.bus.model.PayDTO;

public interface PayService {
	
	public List<PayDTO> payList(HashMap map);	// ����Ʈ... 
	public void payInsert(PayDTO dto);	// �μ�Ʈ
	
	//년도
	public List<PayDTO> ylist(HashMap map);
	//월
	public List<PayDTO> mlist(HashMap map);
	//사번
	public List<PayDTO> elist(HashMap map);

}
