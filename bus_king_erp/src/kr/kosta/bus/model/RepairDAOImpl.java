package kr.kosta.bus.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RepairDAOImpl implements RepairDAO{


		@Autowired
		SqlSession sqlSession;

		@Override
		public List<RepairDTO> repairList(HashMap map) {
			return sqlSession.selectList("RepairDAO.repairList",map);
		}

		@Override
		public void repairInsert(RepairDTO dto) {
			sqlSession.insert("RepairDAO.repairInsert",dto);
			
		}


		@Override
		public void repairUpdate(RepairDTO dto) {
			sqlSession.update("RepairDAO.repairUpdate",dto);
			
		}

		@Override
		public void repairDelete(String re_code) {
			sqlSession.delete("RepairDAO.repairDelete",re_code);
			
		}

		@Override
		public int getRepairCount() {
			return sqlSession.selectOne("RepairDAO.getRepairCount");
		}

		@Override
		public RepairDTO select(RepairDTO dto) {
			return sqlSession.selectOne("RepairDAO.select",dto);
		}

		@Override
		public void busUpdatestate(RepairDTO dto) {
			sqlSession.update("RepairDAO.busUpdatestate",dto);
			
		}

		@Override
		public List<BusDTO> buslist(HashMap map) {
			 return sqlSession.selectList("RepairDAO.buslist", map);
		}

		@Override
		public void accUpdatestate(RepairDTO dto) {
			sqlSession.update("RepairDAO.accUpdatestate",dto);
			
		}



	
}
