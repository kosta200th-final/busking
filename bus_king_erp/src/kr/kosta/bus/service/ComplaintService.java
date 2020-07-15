package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.ComplaintDTO;

public interface ComplaintService {
	
	public List<ComplaintDTO> complaintList(HashMap map);

	public void complaintInsert(ComplaintDTO dto);

	public void complaintUpdate(ComplaintDTO dto);

	public void complaintDelete(String c_no);

	public int getcomplaintCount();
	
	public ComplaintDTO complaintDetail(int c_no);
	
}
