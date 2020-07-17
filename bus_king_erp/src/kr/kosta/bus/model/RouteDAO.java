package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface RouteDAO {
	
	public List<RouteDTO> routeList(HashMap map);
	public void routeInsert(RouteDTO dto);
	public void routeUpdate(RouteDTO dto);
	public void routeDelete(String r_no);
	public int getRouteCount();
	
}
