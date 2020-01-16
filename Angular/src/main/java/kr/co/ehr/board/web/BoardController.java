package kr.co.ehr.board.web;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.co.ehr.board.BoardService;
import kr.co.ehr.board.BoardVO;
import kr.co.ehr.board.SearchVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService ser;
	private String mainURI = "/practice_board";
	private String contentsURI = "/contents";
	
	@RequestMapping(value = "/practice_board/getList", method = RequestMethod.GET)
	public String getList(HttpServletRequest req, SearchVO vo) {
		if(vo.getPageNum()==null) vo.setPageNum("1");
		if(vo.getPageSize()==null) vo.setPageSize("10");
		
		List<BoardVO> list = (List<BoardVO>) ser.retrieve(vo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageNum", vo.getPageNum());
		req.setAttribute("pageSize", vo.getPageSize());
		req.setAttribute("totalPost", (list.size()>0)?list.get(0).getTotal():0);
		
		Gson g = new Gson();
		req.setAttribute("jList", g.toJson(list));
		return mainURI;
	}
	
	@RequestMapping(value = "/practice_board/contents/{postNum}", method = RequestMethod.GET)
	public String getcontents(HttpServletRequest req, @PathVariable int postNum) {
		BoardVO vo = new BoardVO();
		vo.setPostNum(postNum);
		BoardVO out = ser.selectOne(vo);
		
		Gson g = new Gson();
		req.setAttribute("vo", g.toJson(out));
		return contentsURI;
	}
	
	@ResponseBody
	@RequestMapping(value = "/practice_board/contents/delete", method = RequestMethod.POST)
	public int delete(HttpServletRequest req, BoardVO vo) {
		int flag = ser.delete(vo);		
		Gson g = new Gson();
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/post/save", method = RequestMethod.POST)
	public int post(HttpServletRequest req, BoardVO vo) {
		int flag = ser.save(vo);		
		Gson g = new Gson();
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/practice_board/contents/update", method = RequestMethod.POST)
	public int update(HttpServletRequest req, BoardVO vo) {
		int flag = ser.update(vo);		
		Gson g = new Gson();
		return flag;
	}
}
