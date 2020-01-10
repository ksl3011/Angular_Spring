package kr.co.ehr.Composite;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
/*
 * https://cyberx.tistory.com/97?category=195631
 * 파일탐색기
 * */
public class Main {
	
	public static void main(String args[]) throws Exception {
//		java.io.File f = new File("C:\\Users\\ABC\\Downloads\\테스트.docx");
//		System.out.println(f.listFiles());//선택 디렉토리 안 파일리스트, 파일은 null
//		System.out.println(f.listroots());//C: E: ...
		
		
		//전체출력할 대상 생성
		java.io.File f = new File("C:\\Users\\ABC\\Downloads");
		Directory d = new Directory(f);
		List<Node> l = new ArrayList<Node>();
		l.add(d);
		
		FileSystemManager manager = new FileSystemManager();
		manager.setNodeTree(1);		//printTotalList(null)할 경우 적용
		//manager.printTotalList(null);	//프린트할 리스트
		manager.printTotalList(l);
		System.out.println("=========================");
		//manager.searchFile(null,".txt", false);//setNodeTree에서 설정한 드라이브에서 검색
	}
}
