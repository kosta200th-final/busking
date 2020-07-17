package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.Commute2DTO;
import kr.kosta.bus.model.Commute3DTO;
import kr.kosta.bus.model.CommuteDTO;

public interface CommuteService {
	
	public List<Commute2DTO> commuteList_day(HashMap map);
	public List<Commute3DTO> commuteList_month(HashMap map);
	public void commuteInsert(CommuteDTO dto);

}
