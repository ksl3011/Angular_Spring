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
	 * �ؽ�Ʈ�� cut����Ʈ��ŭ ����
	 */
	public String textCut(int cut, String text) {
		if(text == null) new NullPointerException();

		//��ü ����Ʈ
		int mainByte = text.getBytes().length;
		if(mainByte > cut) {
			System.out.println(cut + "byte �ʰ�");
		int total = 0;
		StringBuffer sb = new StringBuffer();
			for(int i=0 ; i<text.length() ; i++) {
				String tmp = text.substring(i, i+1);
				if(Pattern.matches("[a-z]", tmp) ||  Pattern.matches("[A-Z]", tmp) || Pattern.matches("[0-9]", tmp)) {
					total += 1;		//���� or ���ڸ� 1����Ʈ
					sb.append(tmp);
				}else {
					total += 2;		//�׿� 2����Ʈ
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
