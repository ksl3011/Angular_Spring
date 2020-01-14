package kr.co.ehr.board;

public class CmnUtil {

	/*
	 * 페이징
	 * 현재페이지, 총글수, 페이지당글수, view당페이지
	 */
	public static String pagination(int nowPage, int totalPost, int postPerPage, int pagePerView) {
		int totalPage = (totalPost/postPerPage);	//총 페이지 0 ~ ...
		int totalPageBlock = (totalPage/pagePerView);	//총 페이지블록 0 ~ ...
		int nowBlock = (nowPage/pagePerView);	//현재 페이지블록 0 ~ ...
		int lastBlockPage = (totalPage%pagePerView);	//마지막블록의 페이지갯수
				
		StringBuilder sb = new StringBuilder();
		sb.append("<div style='border:1px solid black;'>");

		//맨처음으로버튼 1페이지가 아니면 무조건
		if(nowPage>1) {
			sb.append("<a href=''> ◀ </a>");
		}
		
		//이전페이지블록으로버튼 첫번째페이지블록이아니면 무조건
		if(nowPage>pagePerView) {
			sb.append("<a href=''> ◁ </a>");
		}
		
		for(int i=0 ; i<lastBlockPage; i++) {
			sb.append("<a href=''>"+ (i+(10*nowBlock)) +"</a>");
		}
		
		//다음페이지블록으로버튼 마지막페이지블록아니면 무조건
		if(nowBlock<totalPageBlock) {
			sb.append("<a href=''> ▷ </a>");
		}
		
		if(nowBlock==totalPageBlock) {
			sb.append("<a href=''> ▶ </a>");
		}
		return sb.toString();
	}
}
