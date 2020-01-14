<%@page import="java.util.List"%>
<%@page import="kr.co.ehr.board.BoardVO"%>
<%@page import="kr.co.ehr.board.CmnUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int nowPage = (request.getAttribute("pageNum")!=null)?((Integer)request.getAttribute("pageNum")):1;
	int totalPost = (request.getAttribute("list")!=null)?((List<BoardVO>)request.getAttribute("list")).get(0).getTotal():0;
	int postPerPage = (request.getAttribute("pageSize")!=null)?((Integer)request.getAttribute("pageSize")):10;
	int pagePerView = 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">.a{position: absolute;left: 0px;}.b{position: absolute;left: 150px;}</style>
<style type="text/css">
	table, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">

	<table>
		<thead>
			<tr>
				<td width="50" align="center">번호</td>
				<td width="200" align="center">제목</td>
				<td width="100" align="center">아이디</td>
				<td width="90" align="center">등록일</td>
			</tr>	
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty list && list.size()>0}">
					<c:forEach items="${list}" var="l">
						<tr>
							<td align="center">${l.postNum}</td>
							<td><a href="">${l.title}</a></td>
							<td align="center">${l.userId}</td>
							<td>${l.regDt}</td>
						<tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<tr><td colspan="99">No data</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<%=CmnUtil.pagination(nowPage, totalPost, postPerPage, pagePerView) %>
		</tfoot>
	</table>
	


</div>
<script src="../resources/js/jquery-1.12.4.js"></script>
<script src="../resources/js/angular.min.js"></script>
<script>

</script>
</body>
</html>