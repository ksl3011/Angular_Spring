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
	
	<div data-ng-controller="c as c">
		<table>
			<tr><td><label>제목<input type="text" id="title" placeholder="제목" value="{{c.u[0].title}}"></label></td></tr>
			<tr><td><label>이름<input type="text" id="userId" placeholder="id" value="{{c.u[0].userId}}"></label></td></tr>
			<tr><td><label>PW <input type="password" id="pw" value="{{c.u[0].pw}}"></label></td></tr>
			<tr><td><label>내용<textarea placeholder="내용" id="contents">{{c.u[0].contents}}</textarea></label></td></tr>
		</table>
		<input type="hidden" id="uPostNum" value="{{c.u[0].postNum}}">
		<button data-ng-click="c.post()">등록</button>
		<button data-ng-click="c.back()">목록</button>
	</div>
	
</div>
<script src="/ehr/resources/js/jquery-1.12.4.js"></script>
<script src="/ehr/resources/js/angular.min.js"></script>
<script>
	
	var app = angular.module("app", []);
	app.controller("c", function($http){		
		this.u = [${vo}];
		
		this.back = function(){
			history.back();
		}
		
		this.post = function(){
			var uPostNum = $("#uPostNum").val();
			var userId = $("#userId").val();
			var pw = $("#pw").val();
			var title = $("#title").val();
			var contents = $("#contents").val();
			if(userId.length == 0 || pw.length == 0 || title.length == 0 || contents.length == 0){
				alert("미입력");
				return;
			}
			var url = (uPostNum=="")?"post/save":"post/update";
			var msg = (uPostNum=="")?"등록": "수정";
			$http({
				method : "POST",
				url : url,
				data : $.param({
			    	"userId" : userId,
			    	"pw" : pw,
			    	"title" : title, 
			    	"contents" : contents,
			    	"postNum" : uPostNum
			    }),
			    headers: {
			        'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
			    }
				}).then(function mySuccess(response) {
					if(response.data == 1) {
						alert(msg + "성공");
						location.href = "/ehr/practice_board/getList";
					}else{
						alert(msg + "실패");
					}
				}, function myError(response) {
					alert("error");
				});
		}
	});
	
</script>
</body>
</html>