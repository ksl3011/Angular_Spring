<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">.a{position: absolute;left: 0px;}.b{position: absolute;left: 150px;}</style>
<style type="text/css">

</style>
</head>
<body>
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">

	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>아이디</td>
				<td>등록일</td>
				<td>조회</td> 
			</tr>	
		</thead>
		<tbody>
			<c:when test="${not empty list && list.size()>0}">
				<c:choose>
					<c:forEach items="${list}" var="l">
						<tr>
							<td>${l.postNum}</td>
							<td>${l.title}</td>
							<td>${l.userId}</td>
							<td>${l.regDt}</td>
							<td>${l.cnt}</td> 
						<tr>
					</c:forEach>
					<c:otherwise>
						<tr><td colspan="99">No data</td></tr>
					</c:otherwise>
				</c:choose>
			</c:when>
		</tbody>
		<tfoot>
		
		</tfoot>
	</table>
	


</div>
<script src="./resources/js/jquery-1.12.4.js"></script>
<script src="./resources/js/angular.min.js"></script>
<script>

</script>
</body>
</html>