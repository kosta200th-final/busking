package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.FuelDAO;
import kr.kosta.bus.model.FuelDTO;

@Service
public class FuelServiceImpl implements FuelService {

	@Inject
	FuelDAO fuelDAO;
	
	@Override
	public List<FuelDTO> fuelList(HashMap map) {
		return fuelDAO.fuelList(map);
	}

	@Override
	public void fuelInsert(FuelDTO dto) {
		fuelDAO.fuelInsert(dto);
	}

	@Override
	public void fuelUpdate(String f_code) {
		fuelDAO.fuelUpdate(f_code);
		
	}

	@Override
	public void fuelDelete(String f_code) {
		fuelDAO.fuelDelete(f_code);
		
	}

	@Override
	public int getfuelCount() {
		fuelDAO.getfuelCount();
		return 0;
	}

}
