<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>controller</title>
<style type="text/css">.a{position: absolute;left: 0px;}.b{position: absolute;left: 150px;}</style>
</head>
<body data-ng-app="myapp">
<div class="a"><jsp:include page="index.jsp"/></div><div class="b">

	<fieldset>
		<legend>controller</legend>
			ng-controller="controller as ctl
			<br>		
			html에서 스크립트 함수사용위해 as 별칭 사용 필요
	</fieldset>

	<div data-ng-controller="controller as ctl">
		<input type="text" ng-model="txt">
		<p>{{ctl.test(txt)}}</p>
		<br>
		<button data-ng-click="ctl.alert()">click</button>
	</div>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>

	//모듈생성
	angular.module('myapp',[])//두번째인수는 참조할 다른 모듈
	.controller('controller', function(){
	    this.test = function(val){
	    	if(val == undefined) val="입력";
    		return '>>'+val+'<<'; 
        };
        
        this.alert = function(){
        	alert("test");
        }
    });
	
</script>
</body>
</html>