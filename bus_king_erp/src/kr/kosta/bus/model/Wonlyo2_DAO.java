package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface Wonlyo2_DAO {

	public List<Wonlyo2_DTO> wonlyo2List(HashMap map);
	public void wonlyo2Insert(Wonlyo2_DTO dto);
	public int getwonlyo2Count();
}
