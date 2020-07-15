package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.BusDAO;
import kr.kosta.bus.model.BusDTO;

@Service
public class BusServiceImpl implements BusService {

	@Inject
	BusDAO busDAO;
	
	@Override
	public List<BusDTO> busList(HashMap map) {
		return busDAO.busList(map);
	}

	@Override
	public void busInsert(BusDTO dto) {
		busDAO.busInsert(dto);
	}

	@Override
	public void busUpdate(BusDTO dto) {
		busDAO.busUpdate(dto);
	}

	@Override
	public void busDelete(String b_no) {
		busDAO.busDelete(b_no);
	}

	@Override
	public int getBusCount() {
		return busDAO.getBusCount();
	}

}
