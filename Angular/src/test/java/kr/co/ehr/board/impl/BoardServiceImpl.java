package kr.co.ehr.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ehr.board.BoardDAO;
import kr.co.ehr.board.BoardService;
import kr.co.ehr.board.BoardVO;
import kr.co.ehr.board.DTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Override
	public int save(DTO dto) {
		return dao.save(dto);
	}

	@Override
	public int delete(DTO dto) {
		return dao.delete(dto);
	}

	@Override
	public int update(DTO dto) {
		return dao.update(dto);
	}

	@Override
	public BoardVO selectOne(DTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public List<?> retrieve(DTO dto) {
		return dao.retrieve(dto);
	}

}
