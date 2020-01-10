package kr.co.ehr.Composite;

public class File extends Node{

	public File(java.io.File file) {
		this.file = file;
	}
	
	@Override
	public long getSize() {
		return file.length();
	}

	@Override
	public boolean isDir() {
		return false;
	}

	@Override
	public void printList() {
		System.out.println("\t" + file.getPath());
		
		//double kB = Math.round(getSize()/1024.0*100)/100.0;
		//System.out.println("\t" + file.getPath() + "(" + getSize() + "B)");
		//System.out.println("\t" + file.getPath() + "(" + kB + "kB)");
		
	}

	
}
