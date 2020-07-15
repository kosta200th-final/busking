package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface ComplaintDAO {
	
	public List<ComplaintDTO> complaintList(HashMap map);

	public void complaintInsert(ComplaintDTO dto);
	
	public void complaintUpdate(ComplaintDTO dto);

	public void complaintDelete(String c_no);

	public int getcomplaintCount();
	
	public ComplaintDTO complaintDetail(int c_no);

}
