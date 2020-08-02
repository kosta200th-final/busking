package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface PayDAO {
	
	public List<PayDTO> payList(HashMap map);	// ����Ʈ... 
	public void payInsert(PayDTO dto);	// �μ�Ʈ
	
	//년도
	public List<PayDTO> ylist(HashMap map);
	//월
	public List<PayDTO> mlist(HashMap map);
	//사번
	public List<PayDTO> elist(HashMap map);
	
}
