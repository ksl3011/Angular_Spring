<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>contents</title>
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
	
	<table data-ng-controller="c as c">
		<tr><td width="500">{{c.vo.postNum}} | {{c.vo.title}} | {{c.vo.userId}}</td></tr>
		<tr><td>{{c.vo.regDt}}</td></tr>
		<tr><td height="250" align="left" valign="top">{{c.vo.contents}}</td></tr>
		<tfoot>
			<tr><td><button data-ng-click="c.back()">목록</button></td></tr>
			<tr><td><button data-ng-click="c.goDelete(c.vo.postNum)">삭제</button></td></tr>
			<tr><td><button data-ng-click="c.goUpdate(c.vo.postNum)">수정</button></td></tr>
		</tfoot>		
	</table>
	
	<form action="../update" method="POST" id="goFrm">
		<input type="hidden" name="postNum" id="uPostNum" value="">
	</form>
	
</div>
<script src="/ehr/resources/js/jquery-1.12.4.js"></script>
<script src="/ehr/resources/js/angular.min.js"></script>
<script>
	
	var app = angular.module("app", []);
	app.controller("c", function($http){
		this.vo = ${vo};
		
		this.back = function(){
			history.back();
		}
		
		this.goDelete = function(num){
			var pw = prompt("비밀번호 입력");
			if(pw.length == 0) {
				alert("비밀번호");
				return;
			}
			$http({
				method : "POST",
				url : "delete",
				data : $.param({
			    	"postNum" : num,
			    	"pw" : pw
			    }),
			    headers: {
			        'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
			    }
				}).then(function mySuccess(response) {
					if(response.data == 1) {
						alert("삭제완료");
						location.href = "../getList";
					}else{
						alert("삭제실패");
					}
				}, function myError(response) {
					alert("error");
				});
		}
		
		this.goUpdate = function(num){
		
			$("#uPostNum").val(num);
			$("#goFrm").submit();
		}
	});
	
</script>
</body>
</html>