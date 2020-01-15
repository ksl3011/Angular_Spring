package kr.co.ehr.board.web;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/practice_board/getList", method = RequestMethod.GET)
	public String getList(HttpServletRequest req) {
		String pageNum = req.getParameter("pageNum")==null?"1":req.getParameter("pageNum");
		String pageSize = req.getParameter("pageSize")==null?"10":req.getParameter("pageSize");
		
		SearchVO vo = new SearchVO();
		vo.setPageNum(pageNum);
		vo.setPageSize(pageSize);
		List<BoardVO> list = (List<BoardVO>) ser.retrieve(vo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageNum", vo.getPageNum());
		req.setAttribute("pageSize", vo.getPageSize());
		
		Gson g = new Gson();
		req.setAttribute("jList", g.toJson(list));
		return mainURI;
	}
	
}
