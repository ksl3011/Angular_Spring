<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filter_repeat</title>
<style type="text/css">.a{position: absolute;left: 0px;}.b{position: absolute;left: 150px;}</style>
</head>
<body data-ng-app="app">
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">

	<fieldset>
		<legend>filter_repeat</legend>
		<p>ng-repeat="a in c.data | limitTo: 2:1"</p>
		<p>a는 임의지정, c.data는 컨트롤러안 데이터</p>
		<p>limitTo: 출력갯수:시작인덱스</p>
		<hr>
		<p><b>날짜</b>는 타임 스탬프 정수만 변환</p>
		<p>타임스탬프는 1970년1월1일 0시0분0초부터 몇초가 지났는 지를 나타내는 정수</p>
	</fieldset>

	<div data-ng-controller="c as c">
		<div data-ng-repeat="a in c.data">
			<p>name -> {{a.name}}</p>
			<p>num -> {{a.num | currency:"₩"}}</p>
			<p>boolean -> {{a.bool}}</p>
			<p>date -> {{a.date | date:"yyyy-MM-dd hh:mm"}}</p>
			<hr>
		</div>
		<hr><hr><hr>
		<div data-ng-repeat="a in c.data">
			<p>name -> {{a.name | uppercase}}</p>
			<p>num -> {{a.num | number:1}}</p>
			<p>boolean -> {{a.bool | json}}</p>
			<p>date -> {{a.date | date:"yyyy-MM-dd H:m:.sss a z"}}</p>
			<hr>
		</div>
		<hr><hr><hr>
		<div data-ng-repeat="a in c.data | limitTo: 2:1">
			<p>name -> {{a.name | uppercase}}</p>
			<p>num -> {{a.num | number:1}}</p>
			<p>boolean -> {{a.bool | custom:2}}</p>
			<p>date -> {{a.date | date:"yyyy-MM-dd H:m:.sss a z"}}</p>
			<hr>
		</div>
	</div>

</div>
<script src="./resources/js/jquery-1.12.4.js"></script>
<script src="./resources/js/angular.min.js"></script>
<script>

	var app = angular.module("app", []);
	app.controller("c", function(){
		this.data = [
			{name:"a0", num:0, bool:false, date:1450300000000}
			,{name:"a1", num:1, bool:true, date:1450300000000}
			,{name:"a2", num:10.44, bool:false, date:1450300000000}
			,{name:"a3", num:15.55, bool:true, date:"2020.01.02 10:00:05"}
		];	
	});
	
	app.filter("custom", function(){
		return function(val, opt){
			var option = (opt == null)?'옵션미적용':'옵션적용';
			return val+'(커스텀필터,'+option+')';
		};
	});
	
</script>
</body>
</html>