package kr.co.ehr.Composite;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kr.co.ehr.Composite.File;

//디렉토리
public class Directory extends Node{

	//디렉토리에 속한 하위 노드 리스트
	private List<Node> nodeList = new ArrayList<Node>();
	
	public Directory(java.io.File file) {
		this.file = file;
		iterate();
	}
	
	private void iterate() {
		//디렉토리일 경우 디렉토리 안 리스트
		java.io.File[] children = file.listFiles();
		
		//디렉토리가 아니면 null출력되고 이때 return
		if(children == null) return;
		
		//디렉토리일때
		for(java.io.File child : children) {
			
			//숨김파일일떼 다음으로
			if(child.isHidden()) continue;
			
			if(child.isDirectory()) {//디렉토리일때
				nodeList.add(new Directory(child));
			}else {//파일일때
				nodeList.add(new File(child));
			}
		}
	}
	
	@Override
	public long getSize() {
		long size = 0;
		Iterator<Node> it = nodeList.iterator();
		
		while(it.hasNext()) {
			Node node = (Node) it.next();
			size += node.getSize();
		}
		return size;
	}

	@Override
	public boolean isDir() {
		return true;
	}

	@Override
	public void printList() {
		double kB = Math.round((getSize()/1024.0)*100)/100.0;
		double MB = Math.round((kB/1024.0)*100)/100.0;
		//System.out.println(getPath() + "(size: " + getSize() + "byte)");
		//System.out.println(getPath() + "(size: " + kB + "kB)");
		System.out.println(getPath() + "(size: " + MB + "MB)");
		
		Iterator<Node> it = nodeList.iterator();
		
		while(it.hasNext()) {
			Node node = (Node) it.next();
			node.printList();
		}
	}

	public List getNodeList() {
		return nodeList;
	}
	
	public void search(String searchWord, String ext, List childList, boolean matchCase) {
		if(childList == null) {
			childList = getNodeList();
		}
		
		for(Object obj : childList) {
			Node child = (Node) obj;
			
			if(child.isDir()) {//디렉토리일 경우 재검색
				search(searchWord, ext, ((Directory)child).getNodeList(), matchCase);
			}else {
				String path = child.getPath();
				String comparePath = path;
				
				//대소문자 구분
				if(!matchCase) {
					comparePath = path.toLowerCase();
				}
				

				if(searchWord == null && comparePath.endsWith(ext)) {//검색어가 null, 확장자가 일치
					System.out.println(path);
				}else if(ext == null && comparePath.contains(searchWord)) {//확장자 null, 검색어 존재
					System.out.println(path);
				}else if(searchWord == null || ext == null) {//위 조건에 맞지않고 null일때
					continue;
				}else if(comparePath.contains(searchWord) && comparePath.contains(ext)) {
					System.out.println(path);
				}
			}
		}
		
	}
}
