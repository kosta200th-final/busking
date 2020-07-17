package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

public interface AccountDAO {

	//public List<AccountDTO> selboxlist(HashMap map);
	
	public List<AccountDTO> accountList(HashMap map);
	public void accountUpdate(AccountDTO dto);
	public AccountDTO getAccount(String ac_code);
	public int getAccountCount(String state);
	
}
