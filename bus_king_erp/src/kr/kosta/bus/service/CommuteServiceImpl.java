package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.Commute2DTO;
import kr.kosta.bus.model.Commute3DTO;
import kr.kosta.bus.model.CommuteDAO;
import kr.kosta.bus.model.CommuteDTO;

@Service
public class CommuteServiceImpl implements CommuteService {

	@Inject
	CommuteDAO commuteDAO;
	
	@Override
	public List<Commute2DTO> commuteList_day(HashMap map) {
		return commuteDAO.commuteList_day(map);
	}

	@Override
	public List<Commute3DTO> commuteList_month(HashMap map) {
		return commuteDAO.commuteList_month(map);
	}

	@Override
	public void commuteInsert(CommuteDTO dto) {
		commuteDAO.commuteInsert(dto);

	}

}
