package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface BusDAO {

	public List<BusDTO> busList(HashMap map);
	public void busInsert(BusDTO dto);
	public void busUpdate(BusDTO dto);
	public void busDelete(String b_no);
	public int getBusCount();
}
