package kr.co.ehr.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ehr.board.BoardDAO;
import kr.co.ehr.board.BoardVO;
import kr.co.ehr.board.DTO;
import kr.co.ehr.board.SearchVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private Logger LOG = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private SqlSessionTemplate sst;
	private final String NAMESPACE = "ehr.board";
	
	@Override
	public int save(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: save");
		LOG.debug("===============================================");
		
		BoardVO vo = (BoardVO) dto;
		String statement = NAMESPACE + ".save";
		
		int flag = sst.insert(statement, vo);
		
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: save");
		LOG.debug("2/2) flag : " + flag);
		LOG.debug("===============================================");
		
		return flag;
	}

	@Override
	public int delete(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: delete");
		LOG.debug("===============================================");
		
		BoardVO vo = (BoardVO) dto;
		String statement = NAMESPACE + ".delete";
		
		int flag = sst.delete(statement, vo);
		
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: delete");
		LOG.debug("2/2) flag : " + flag);
		LOG.debug("===============================================");
		
		return flag;
	}

	@Override
	public int update(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: update");
		LOG.debug("===============================================");
		
		BoardVO vo = (BoardVO) dto;
		String statement = NAMESPACE + ".update";
		
		int flag = sst.update(statement, vo);
		
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: update");
		LOG.debug("2/2) flag : " + flag);
		LOG.debug("===============================================");
		
		return flag;
	}

	@Override
	public BoardVO selectOne(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: selectOne");
		LOG.debug("===============================================");
		
		BoardVO vo = (BoardVO) dto;
		String statement = NAMESPACE + ".selectOne";
		
		BoardVO out = sst.selectOne(statement, vo);
		
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: selectOne");
		LOG.debug("2/2) out : " + out);
		LOG.debug("===============================================");
		
		return out;
	}

	@Override
	public List<?> retrieve(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: retrieve");
		LOG.debug("===============================================");
		
		SearchVO vo = (SearchVO) dto;
		String statement = NAMESPACE + ".retrieve";

		List<BoardVO> list = sst.selectList(statement, vo);
		
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: retrieve");
		LOG.debug("2/2) list : " + list.size());
		LOG.debug("===============================================");
		
		return list;
	}

	@Override
	public int checkPw(DTO dto) {
		LOG.debug("===============================================");
		LOG.debug("1/2) DAO: checkPw");
		LOG.debug("===============================================");
		
		BoardVO vo = (BoardVO) dto;
		String statement = NAMESPACE + ".checkPw";
		
		BoardVO out = sst.selectOne(statement, vo);
		int flag = (out==null)?0:1;
		LOG.debug("===============================================");
		LOG.debug("2/2) DAO: checkPw");
		LOG.debug("2/2) flag : " + flag);
		LOG.debug("===============================================");
		
		return flag;
	}

}
