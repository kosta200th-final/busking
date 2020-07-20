package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.FuelDTO;

public interface FuelService {
	public List<FuelDTO> fuelList(HashMap map);
	public void fuelInsert(FuelDTO dto);
	public void fuelUpdate(String f_code);
	public void fuelDelete(String f_code);
	public int getfuelCount();
	
}
