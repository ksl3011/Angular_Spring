package kr.co.ehr.board;

public class BoardVO extends DTO {
	
	private int postNum;
	private String userId;
	private String title;
	private String pw;
	private String regDt;
	private String fileCode;
	private String contents;
	private String cnt;
	
	public BoardVO(){}
	
	public BoardVO(int postNum, String userId, String title, String pw, String regDt, String fileCode, String contents,
			String cnt) {
		super();
		this.postNum = postNum;
		this.userId = userId;
		this.title = title;
		this.pw = pw;
		this.regDt = regDt;
		this.fileCode = fileCode;
		this.contents = contents;
		this.cnt = cnt;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getFileCode() {
		return fileCode;
	}

	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "BoardVO [postNum=" + postNum + ", userId=" + userId + ", title=" + title + ", pw=" + pw + ", regDt="
				+ regDt + ", fileCode=" + fileCode + ", contents=" + contents + "]";
	}
	
}
