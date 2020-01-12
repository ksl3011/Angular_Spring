<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app>
<head>
<meta charset="UTF-8">
<title>model</title>
<style type="text/css">.a{position: absolute;left: 0px;}.b{position: absolute;left: 150px;}</style>
</head>
<body>
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">
	
	<fieldset>
		<legend>model</legend>
	</fieldset>
	
		
		
	<div ng-init="txt='입력'">
		<input ng-model="txt" placeholder="{{txt}}">
		<p>{{txt}}</p>
	</div>

	<div ng-init="myCol='lightblue'">
		<input style="background-color:{{myCol}}" ng-model="myCol">
	</div>
	
</div>
<script src="./resources/js/jquery-1.12.4.js"></script>
<script src="./resources/js/angular.min.js"></script>
<script>

</script>
</body>
</html>