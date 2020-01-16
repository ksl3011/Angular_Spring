<%@page import="java.util.List"%>
<%@page import="kr.co.ehr.board.BoardVO"%>
<%@page import="kr.co.ehr.board.CmnUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int nowPage = (request.getAttribute("pageNum")!=null)?(Integer.parseInt((String)request.getAttribute("pageNum"))):1;
	int totalPost = (request.getAttribute("totalPost")!=null)?(Integer)request.getAttribute("totalPost"):1;
	int postPerPage = (request.getAttribute("pageSize")!=null)?(Integer.parseInt((String)request.getAttribute("pageSize"))):10;
	int pagePerView = 10;
	String scriptNm = "goPage";
	String jList = (request.getAttribute("jList")!=null)?(String)request.getAttribute("jList"):"";
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
<body data-ng-app="app">
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">

	<a href="/ehr/post.jsp">글쓰기</a>
	
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
							<td><a href="contents/${l.postNum}">${l.title}</a></td>
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
			<tr><td colspan="99" align="center">
				<%=CmnUtil.pagination(nowPage, totalPost, postPerPage, pagePerView, scriptNm) %>
			</td></tr>
		</tfoot>
	</table>
	
	<br>
	↑jstl기반
	<hr>
	↓앵귤러사용
	<br>
	
	<table>
		<thead>
			<tr>
				<td width="50" align="center">번호</td>
				<td width="200" align="center">제목</td>
				<td width="100" align="center">아이디</td>
				<td width="90" align="center">등록일</td>
			</tr>	
		</thead>
		<tbody data-ng-controller="c as c">
			<tr data-ng-repeat="l in c.list">
				<td align="center">{{l.postNum}}</td>
				<td><a href="" data-ng-click="c.goContents(l.postNum)">{{l.title}}</a></td>
				<td align="center">{{l.userId}}</td>
				<td>{{l.regDt}}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr><td colspan="99" align="center">
				<%=CmnUtil.pagination(nowPage, totalPost, postPerPage, pagePerView, scriptNm) %>
			</td></tr>
		</tfoot>
	</table>
	
	<form action="getList" method="GET" id="goFrm">
		<input type="hidden" name="pageNum" value="">
		<input type="hidden" name="pageSize" value="<%=postPerPage%>">
	</form>

</div>
<script src="../resources/js/jquery-1.12.4.js"></script>
<script src="../resources/js/angular.min.js"></script>
<script>

	function goPage(page){
		var $f = $("#goFrm");
		$f[0].pageNum.value = page;
		$f.submit();
	}

	var app = angular.module("app", []);
	app.controller("c", function(){
		this.list = ${jList};
		this.goContents = function(num){
			location.href = "contents/"+num;
		};
	});
</script>
</body>
</html>