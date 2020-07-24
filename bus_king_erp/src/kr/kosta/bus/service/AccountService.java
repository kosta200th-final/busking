package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import kr.kosta.bus.model.AccountDTO;

public interface AccountService {

		//public List<AccountDTO> selboxlist(HashMap map);
		public List<AccountDTO> accountList(HashMap map);
		public void accountUpdate(AccountDTO dto);	
		public AccountDTO getAccount(String ac_code);
		public int getAccountCount(HashMap map);
		
	}

