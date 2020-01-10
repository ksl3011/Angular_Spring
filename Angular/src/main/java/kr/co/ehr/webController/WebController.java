package kr.co.ehr.webController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.ehr.autoCut.AutoCut;

@Controller
public class WebController {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AutoCut autoCut;
	
	@ResponseBody
	@RequestMapping(value = "study/autoCut.do", method = RequestMethod.POST)
	public String autoCut(int cut, String text) {
		LOG.debug("================================");
		LOG.debug("autoCut");
		LOG.debug("================================");
		
		String result = autoCut.textCut(cut, text);
		
		Gson gson = new Gson();
		String json = gson.toJson(result);
		
		return json;
	}
}
