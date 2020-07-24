package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<AccountDTO> accountList(HashMap map) {
		return sqlsession.selectList("AccountDAO.accountList", map);
	}

//	@Override
//	public List<AccountDTO> selboxlist(HashMap map) {
//		// TODO Auto-generated method stub
//		return sqlsession.selectList("AccountDAO.selboxlist", map);
//	}
	
	@Override
	public void accountUpdate(AccountDTO dto) {
		sqlsession.update("AccountDAO.accountUpdate", dto);
	}
	@Override
	public AccountDTO getAccount(String ac_code) {
		return sqlsession.selectOne("AccountDAO.getAccount", ac_code);
	}

	@Override
	public int getAccountCount(HashMap map) {
		return sqlsession.selectOne("AccountDAO.getAccountCount", map);
	}



}
