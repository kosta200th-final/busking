package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface FuelDAO {
	public List<FuelDTO> fuelList(HashMap map);
	public void fuelInsert(FuelDTO dto);
	public void fuelUpdate(String f_code);
	public void fuelDelete(String f_code);
	public int getfuelCount();
	
}
