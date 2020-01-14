package kr.co.ehr.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ehr.board.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService ser;
	private String mainURI = "/";
	
	@RequestMapping(value = "/")
	public String getList() {
		return mainURI;
	}
}
