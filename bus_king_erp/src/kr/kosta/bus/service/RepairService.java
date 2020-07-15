package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.RepairDTO;


public interface RepairService {
	public List<RepairDTO> repairList(HashMap map);
	public void repairInsert(RepairDTO dto);
	public void repairUpdate(RepairDTO dto);
	public void repairDelete(String re_code);
	public int getRepairCount();
	
}
