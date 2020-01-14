package kr.co.ehr.board;

public class SearchVO extends DTO {
	
	private String searchDiv;
	private String searchWord;
	private String searchWord_aux;
	private String pageNum;
	private String pageSize;
	
	public SearchVO() {}

	public SearchVO(String searchDiv, String searchWord, String searchWord_aux, String pageNum, String pageSize) {
		super();
		this.searchDiv = searchDiv;
		this.searchWord = searchWord;
		this.searchWord_aux = searchWord_aux;
		this.pageNum = pageNum;
		this.pageSize = pageSize;
	}

	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchWord_aux() {
		return searchWord_aux;
	}

	public void setSearchWord_aux(String searchWord_aux) {
		this.searchWord_aux = searchWord_aux;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "SearchVO [searchDiv=" + searchDiv + ", searchWord=" + searchWord + ", searchWord_aux=" + searchWord_aux
				+ ", pageNum=" + pageNum + ", pageSize=" + pageSize + "]";
	}

}
