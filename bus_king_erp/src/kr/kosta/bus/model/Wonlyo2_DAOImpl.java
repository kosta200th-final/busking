package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Wonlyo2_DAOImpl implements Wonlyo2_DAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Wonlyo2_DTO> wonlyo2List(HashMap map) {
		 return sqlSession.selectList("Wonlyo2_DAO.wonlyo2List", map);
	}

	@Override
	public void wonlyo2Insert(Wonlyo2_DTO dto) {
		sqlSession.insert("Wonlyo2_DAO.wonlyo2Insert", dto);
		
	}

	@Override
	public int getwonlyo2Count() {
		return sqlSession.selectOne("Wonlyo2_DAO.getwonlyo2Count");
	}


}
