package kr.kosta.bus.service;

import java.util.HashMap;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.AccountDAO;
import kr.kosta.bus.model.AccountDTO;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	AccountDAO accountDAO;
	
//	@Override
//	public List<AccountDTO> selboxlist(HashMap map) {
//		return accountDAO.selboxlist(map);
//	}
	
	@Override
	public List<AccountDTO> accountList(HashMap map) {
		return accountDAO.accountList(map);
	}
	
	@Override
	public void accountUpdate(AccountDTO dto) {
		accountDAO.accountUpdate(dto);
	}
	@Override
	public AccountDTO getAccount(String ac_code) {
		return accountDAO.getAccount(ac_code);
	}

	@Override
	public int getAccountCount(String state) {
		return accountDAO.getAccountCount(state);
	}




}
