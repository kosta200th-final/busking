package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface CommuteDAO {
	
	public List<Commute2DTO> commuteList_day(HashMap map);
	public List<Commute3DTO> commuteList_month(HashMap map);
	public void commuteInsert(CommuteDTO dto);

}
