package kr.co.ehr.Composite;
/*
 * Composite 패턴
 * https://cyberx.tistory.com/97?category=195631
 * 파일탐색기
 * 
 * Node : 디렉토리, 파일 VO가 상속할 클래스
 * Directory
 * File
 * FileSystemManager
 * FileProcessException
 */

import java.io.File;

public abstract class Node {
	
	protected File file;
	
	//크기
	public abstract long getSize();
	
	//디렉토리 여부
	public abstract boolean isDir();
	
	//리스트출력
	public abstract void printList();
	
	public File getFile() {
		return file;
	}
	
	public String getPath() {
		return file.getPath();
	}

	@Override
	public String toString() {
		return getPath() + "(" + getSize() + ")";
	}
	
	protected Node add(Node node) throws FileProcessException{
		throw new FileProcessException();
	}
	
}
