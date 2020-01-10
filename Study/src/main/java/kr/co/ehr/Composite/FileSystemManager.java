package kr.co.ehr.Composite;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FileSystemManager {

	private List<Node> rootDirList = new ArrayList<Node>();
	private File[] roots;
	
	public FileSystemManager() {//C: E:..
		this.roots = java.io.File.listRoots();
	}
	
	public int rootSize() {
		return roots.length;
	}
	
	public List getRootDirList() {
		return rootDirList;
	}
	
	public void setNodeTree() {
		setNodeTree(0, roots.length);
	}
	
	public void setNodeTree(int index) throws FileProcessException {
		if(index > roots.length-1) {
			throw new FileProcessException("인덱스가 너무 큼");
		}
		
		setNodeTree(index, index+1);
	}
	
	public void setNodeTree(int startIndex, int lastIndex) {
		for(int i = startIndex; i<lastIndex ; i++) {
			Node dirNode = new Directory(roots[i]);	//C:/
			rootDirList.add(dirNode);				//C: E: ..
		}
	}
	
	public void printTotalList(List list) {//C:/..의 전체리스트 
		if(list == null) {
			list = rootDirList;
		}
		
		Iterator<Node> it = list.iterator();
		
		while(it.hasNext()) {
			Node node = (Node) it.next();
			node.printList();
		}
	}
	
	public void searchFile(String searchWord, String ext, boolean matchCase) throws FileProcessException {
		if(searchWord == null && ext == null) {
			throw new FileProcessException("둘다null");
		}
		
		//대소문자 구분 여부
		if(!matchCase) {
			if(searchWord != null) {
				searchWord = searchWord.toLowerCase();
			}
			
			if(ext != null) {
				ext = ext.toLowerCase();
			}
		}
		
		Iterator it = rootDirList.iterator();

		while(it.hasNext()) {
			Node node = (Node) it.next();
			
			if(node.isDir()) {
				((Directory)node).search(searchWord, ext, null, matchCase);
			}
		}
		
	}
	
}
