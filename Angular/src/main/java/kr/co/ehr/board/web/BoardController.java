package kr.co.ehr.board.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private String postURI = "/post";
	
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
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/practice_board/post/save", method = RequestMethod.POST)
	public int post(HttpServletRequest req, BoardVO vo) {
		int flag = ser.save(vo);
		return flag;
	}
	
	@RequestMapping(value = "/practice_board/update", method = RequestMethod.POST)
	public String goUpdate(HttpServletRequest req, HttpServletResponse res, BoardVO vo) throws IOException {
		int flag = ser.checkPw(vo);
		if(flag == 0) {
			req.setCharacterEncoding("UTF-8");
			PrintWriter w = new PrintWriter(res.getWriter());
			w.print("<script>alert('틀린비밀번호');location.href='/ehr/practice_board/getList';</script>");
			w.flush();
			return mainURI;
		}
		
		BoardVO out = ser.selectOne(vo);
		
		Gson g = new Gson();
		req.setAttribute("vo", g.toJson(out));
		return postURI;
	}
	
	@ResponseBody
	@RequestMapping(value = "/practice_board/post/update", method = RequestMethod.POST)
	public int update(HttpServletRequest req, BoardVO vo) {
		int flag = ser.update(vo);
		return flag;
	}
}
