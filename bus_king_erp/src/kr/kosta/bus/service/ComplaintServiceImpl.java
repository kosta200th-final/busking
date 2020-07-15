package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.ComplaintDAO;
import kr.kosta.bus.model.ComplaintDTO;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	@Inject
	ComplaintDAO complaintDAO;

	@Override
	public List<ComplaintDTO> complaintList(HashMap map) {
		return complaintDAO.complaintList(map);
	}

	@Override
	public void complaintInsert(ComplaintDTO dto) {
		complaintDAO.complaintInsert(dto);
	}

	@Override
	public void complaintUpdate(ComplaintDTO dto) {
		complaintDAO.complaintUpdate(dto);
	}

	@Override
	public void complaintDelete(String c_no) {
		complaintDAO.complaintDelete(c_no);
	}

	@Override
	public int getcomplaintCount() {
		return complaintDAO.getcomplaintCount();
	}

	@Override
	public ComplaintDTO complaintDetail(int c_no) {
		return complaintDAO.complaintDetail(c_no);
	}
}
