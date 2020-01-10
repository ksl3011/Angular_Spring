<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>study</title>
	<link rel="stylesheet" type="text/css" href="${context}/resources/css/jquery-ui.css">
	<style type="text/css">
	</style>
</head>
<body ng-app="one">
	<h4>앵귤러js</h4>
	<hr/>
	
	<br><h3>기본</h3>
	<div ng-init="startVal='초기값';addVal='또초기값'">
		<fieldset>

			<p>ng-init : 초기값설정</p>
			<p>ng-model : 설정 모델변수</p>
			<p>ng-bind : 변수불러오기</p>
		</fieldset>
		
		<p>입력 -> <input type="text" ng-model="name"></p>
		<p>값 : '{{name}}'</p>
		<p>바인드 : '<span ng-bind="name">출력안되는내용물</span>'</p>
		<p>바인드여러개가능 : '<span ng-bind="name+ '~' + name">출력안되는내용물</span>'</p>
		<p>페이지시작시 초기값 : <span ng-bind="startVal"></span></p>
		<p>페이지시작시 초기값2) : <span>{{addVal}}</span></p>
		<p>마크업 ex)계산 : <span>{{10*10</span><span>}}->></span> {{10 * 10}}</p>
	</div>
	
	<hr/>
	<br><h3>앱, 컨트롤러</h3>
	<div ng-controller="ctrlFirst">
		<fieldset>	
			<p>ng-app : 앵귤러 어플</p>
			<p>ng-controller : 어플을 컨트롤</p>
			<p>app을 두개이상 사용할시 수동초기화 해주거나 app을 하나사용하고 컨트롤러를 여러개 사용</p>
		</fieldset>
		
		스크립트에서 지정한 A초기값 : {{A}}
		<p>A초기값확인(그냥 마크업): <input type="text" disabled="disabled" value="{{A}}"/></p>
		<p>A초기값확인(모델) : <input type="text" disabled="disabled" ng-model="A"/></p>
		<p style="background-color:{{B}};">색깔초기화확인 노랑->분홍</p>
	</div>

	<hr/>

	<br><h3>오브젝트</h3>
	<div ng-init="obj={a:'1', b:'2'} ; list=[1,2,3,4,5,6,7,8,9,10]">
		<fieldset>
			<p>오브젝트</p>
		</fieldset>
		
		<p>오브젝트내용1 -> {{obj.a}}</p>
		<p>오브젝트내용2 -> {{obj.b}}</p>
		<p>배열 -> {{list}}</p>
	</div>
	
	<hr/>
	
	<br><h3>디렉티브1</h3>
	<div directive-a>
		<fieldset>
			<p>Directive</p>
		</fieldset>
	</div>
		<h3>디렉티브2</h3>
	<fieldset>
		scope : 이것은 범위의 객체<br/>
		element : 이 지시문의 DOM 요소<br/>
		attrs : 속성 정보를 취급하는 객체<br/>
	</fieldset>	
	<ok>새 태그 생성</ok>
	<click>클릭태그</click>
		<h3>디렉티브3</h3>
	<fieldset>
		restrict: '?'<br/>
		'E' : 요소로 사용할 수 있다. < ok>와 같은 형태이다.<br/>
		'A' : 속성으로 사용할 수 있다. < p ok>와 같은 형태이다.<br/>
		'AE' : 위 모두에서 사용할 수 있다.<br/>
	</fieldset>	
		<div ook="large">This is Large sample!</div>
		<div ook="midium">This is Midium sample!</div>
		<div ook="small">This is Small sample!</div>
	
	<script src="${context}/resources/js/jquery-1.12.4.js"></script>
	<script src="${context}/resources/js/jquery-ui.js"></script>
	<script src="${context}/resources/js/angular.min.js"></script>
	<script>
		var app = angular.module('one', []);
		app.controller('ctrlFirst', function($scope){
			$scope.A = "A의 초기값";
			$scope.B = "#ffaad4";
			
		});
		
		app.directive('directiveA', function(){
			return {
				template : "<pre>디렉티브에서의 출력내용\n원래내용은사라진다</pre>"};
		});
	
		app.directive('ok', function(){
			return function(scope,element,attrs){
				var size = attrs['size'];
				size = size == null ? '24pt' : size;
				var color = attrs['color'];
				color = color == null ? 'red' : color;
				var txt = element[0].textContent;
				var tag = '<span style="font-size:' + size + ';color:' + color + ';">' + txt + '</span>';
				element[0].innerHTML = tag; };
			});

		app.directive('click', function(){
			return function(scope,element,attrs){
				element[0].addEventListener("click", function(){
					alert("클릭");
					});
				};
			});
		
		app.directive('ook', function(){
			return {
				restrict: 'A',
				template: function(scope, element){
					var size = 24;
					switch(element['ook']){
						case 'large': size = 48;
						break;
						case 'midium': size = 36;
						break;
						case 'small': size = 24;
						break;
					}
					var obj = scope[0];
					var tag ='<span style="font-size:' + size + 'pt">' + scope[0].textContent + '</span>';
					return tag;
				}
			};
		});

	</script>
</body>
</html>