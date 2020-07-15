package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface RepairDAO {
	public List<RepairDTO> repairList(HashMap map);
	public void repairInsert(RepairDTO dto);
	public void repairUpdate(RepairDTO dto);
	public void repairDelete(String re_code);
	public int getRepairCount();
	
}
