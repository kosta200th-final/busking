package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FuelDAOImpl implements FuelDAO{

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<FuelDTO> fuelList(HashMap map) {
		return sqlSession.selectList("FuelDAO.fuelList",map);
	}

	@Override
	public void fuelInsert(FuelDTO dto) {
		sqlSession.insert("FuelDAO.fuelInsert",dto);
	}

	@Override
	public void fuelUpdate(String f_code) {
		sqlSession.update("FuelDAO.fuelUpdate",f_code);
		
	}

	@Override
	public void fuelDelete(String f_code) {
		sqlSession.delete("FuelDAO.fuelDelete",f_code);
		
	}

	@Override
	public int getfuelCount() {
		return sqlSession.selectOne("FuelDAO.getfuelCount");
	}

}
