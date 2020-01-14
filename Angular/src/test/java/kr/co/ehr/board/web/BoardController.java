package kr.co.ehr.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ehr.board.BoardService;
import kr.co.ehr.board.BoardVO;
import kr.co.ehr.board.SearchVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService ser;
	private String mainURI = "/practice_board";
	
	@RequestMapping(value = "/practice_board/getList")
	public String getList(HttpServletRequest req) {
		SearchVO vo = new SearchVO();
		vo.setPageNum("1");
		vo.setPageSize("10");
		List<BoardVO> list = (List<BoardVO>) ser.retrieve(vo);
		req.setAttribute("list", list);
		return mainURI;
	}
}
