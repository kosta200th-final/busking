package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.AllocationDAO;
import kr.kosta.bus.model.AllocationDTO;
import kr.kosta.bus.model.BusDTO;
import kr.kosta.bus.model.EmployerDTO;
import kr.kosta.bus.model.RouteDTO;

@Service
public class AllocationServiceImpl implements AllocationService {

	@Inject
	AllocationDAO allocationDAO;
	
	@Override
	public List<BusDTO> blist(HashMap map) {
		return allocationDAO.blist(map);
	}

	@Override
	public List<RouteDTO> rlist(HashMap map) {
		return allocationDAO.rlist(map);
	}

	@Override
	public List<EmployerDTO> elist(HashMap map) {
		return allocationDAO.elist(map);
	}

	@Override
	public List<AllocationDTO> allocationList(HashMap map) {
		return allocationDAO.allocationList(map);
	}

	@Override
	public void allocationInsert(AllocationDTO dto) {
		allocationDAO.allocationInsert(dto);
	}

	@Override
	public void allocationUpdate(AllocationDTO dto) {
		allocationDAO.allocationUpdate(dto);
	}

	@Override
	public void allocationDelete(AllocationDTO dto) {
		allocationDAO.allocationDelete(dto);
	}

	@Override
	public int getAllocationCount(String zo) {
		return allocationDAO.getAllocationCount(zo);
	}

}
