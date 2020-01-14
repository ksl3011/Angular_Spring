package kr.co.ehr.board;

import java.util.List;

public interface BoardDAO {

	public int save(DTO dto);
	public int delete(DTO dto);
	public int update(DTO dto);
	public BoardVO selectOne(DTO dto);
	public List<?> retrieve(DTO dto);
	
}
