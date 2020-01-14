<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list_repeat</title>
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

	<fieldset>
		<legend>list_repeat</legend>
		리스트필터
	</fieldset>

	<div data-ng-controller="c as c">
		<p>정렬 order</p>
		<table>
			<thead>
				<tr><td>id</td><td>name</td><td>bool</td><td>order</td></tr>
			</thead>
			<tbody>
				<tr data-ng-repeat="x in c.list | orderBy:'order' | limitTo:4:0">
					<td>{{x.id}}</td>
					<td>{{x.name}}</td>
					<td>{{x.bool}}</td>
					<td>{{x.order}}</td>
				</tr>
			</tbody>
		</table>
		
		<p>정렬 -order</p>
		<table>
			<thead>
				<tr><td>id</td><td>name</td><td>bool</td><td>order</td></tr>
			</thead>
			<tbody>
				<tr data-ng-repeat="x in c.list | orderBy:'-order' | limitTo:4:0">
					<td>{{x.id}}</td>
					<td>{{x.name}}</td>
					<td>{{x.bool}}</td>
					<td>{{x.order}}</td>
				</tr>
			</tbody>
		</table>
		
		<p>true인 값만 출력</p>
		<table>
			<thead>
				<tr><td>id</td><td>name</td><td>bool</td><td>order</td></tr>
			</thead>
			<tbody>
				<tr data-ng-repeat="x in c.list | filter:true ">
					<td>{{x.id}}</td>
					<td>{{x.name}}</td>
					<td>{{x.bool}}</td>
					<td>{{x.order}}</td>
				</tr>
			</tbody>
		</table>
		
		<p>커스텀필터, 짝수</p>
		<table>
			<thead>
				<tr><td>id</td><td>name</td><td>bool</td><td>order</td></tr>
			</thead>
			<tbody>
				<tr data-ng-repeat="x in c.list | even ">
					<td>{{x.id}}</td>
					<td>{{x.name}}</td>
					<td>{{x.bool}}</td>
					<td>{{x.order}}</td>
				</tr>
			</tbody>
		</table>
	</div>


</div>
<script src="./resources/js/jquery-1.12.4.js"></script>
<script src="./resources/js/angular.min.js"></script>
<script>

	var app = angular.module("app", []);
	app.controller("c", function(){
		this.list = [
			{id:0, name:"a0", bool:false, order:9}
			,{id:1, name:"a1", bool:false, order:8}
			,{id:2, name:"a2", bool:true, order:7}
			,{id:3, name:"a3", bool:true, order:6}
			,{id:4, name:"a4", bool:false, order:5}
			,{id:5, name:"a5", bool:false, order:4}
			,{id:6, name:"a6", bool:true, order:3}
			,{id:7, name:"a7", bool:true, order:2}
			,{id:8, name:"a8", bool:false, order:1}
			,{id:9, name:"a9", bool:false, order:0}
		];
	});
	//짝수만 거르는 필터
	app.filter("even", function(){
		return function(items){
			var filtered = [];
			angular.forEach(items, function(item){
				if(item.order%2 == 0 && item.order != 0){
					filtered.push(item);
				}
			})
			return filtered;
		}
	});
</script>
</body>
</html>