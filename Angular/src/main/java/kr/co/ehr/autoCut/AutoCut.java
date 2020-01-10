package kr.co.ehr.autoCut;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class AutoCut {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());
	
	public AutoCut() {}

	/**
	 * 텍스트를 cut바이트만큼 유지
	 */
	public String textCut(int cut, String text) {
		if(text == null) new NullPointerException();

		//전체 바이트
		int mainByte = text.getBytes().length;
		if(mainByte > cut) {
			System.out.println(cut + "byte 초과");
		int total = 0;
		StringBuffer sb = new StringBuffer();
			for(int i=0 ; i<text.length() ; i++) {
				String tmp = text.substring(i, i+1);
				if(Pattern.matches("[a-z]", tmp) ||  Pattern.matches("[A-Z]", tmp) || Pattern.matches("[0-9]", tmp)) {
					total += 1;		//영어 or 숫자면 1바이트
					sb.append(tmp);
				}else {
					total += 2;		//그외 2바이트
					if(total > cut) return sb.toString();
					else sb.append(tmp);
				}
				if(total == cut) return sb.toString();
			}
			return sb.toString();
		}else
			return text;
	}
}
