package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface PayDAO {
	
	public List<PayDTO> payList(HashMap map);	// ����Ʈ... 
	public void payInsert(PayDTO dto);	// �μ�Ʈ
	
}
