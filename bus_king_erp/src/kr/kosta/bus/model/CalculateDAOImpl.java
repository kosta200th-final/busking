package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalculateDAOImpl implements CalcuateDAO {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<CalculateDTO> calList(HashMap map) {
		return sqlsession.selectList("CalculateDAO.calList", map);
	}

	@Override
	public void calInsert(CalculateDTO dto) {
		sqlsession.insert("CalculateDAO.calInsert", dto);
	}

	@Override
	public CalculateDTO getCalculate(String cal_code) {
		
		return sqlsession.selectOne("CalculateDAO.getCalculate", cal_code);
		
	}

	@Override
	public void calUpdate(CalculateDTO dto) {
		sqlsession.update("CalculateDAO.calUpdate", dto);
	}

	@Override
	public int getCalCount() {
		return sqlsession.selectOne("CalculateDAO.getCalCount");
	}


}
