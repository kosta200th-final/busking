package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAOImpl implements PayDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<PayDTO> payList(HashMap map) {
		return sqlSession.selectList("PayDAO.payList", map);
	}

	@Override
	public void payInsert(PayDTO dto) {
		sqlSession.insert("PayDAO.payInsert", dto);
	}
	
}
