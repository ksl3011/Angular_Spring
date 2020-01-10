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
		#alert{
			position: absolute;
			top: 0;
			width: 100%;
			height: 20px;
			background-color: white;
			border: 1px solid black;
			z-index: 10;
			display: none;
		}
	</style>
</head>
<body>
	<h4>Study</h4>
	<hr/>
	
	<div id="alert"></div>
	<div>
		<label>textArea</label><br/>
		<textarea rows="5" cols="100"></textarea>
		<br/>
		<label id="byteLength">0 byte</label>
		<button id="byteCutBtn">test</button>
	</div>
	
	<script src="${context}/resources/js/jquery-1.12.4.js"></script>
	<script src="${context}/resources/js/jquery-ui.js"></script>
	<script type="text/javascript">
		
		$("#byteCutBtn").on("click", function(){
			var text = $("textarea").val();
			$.ajax({
				type : "POST",
				url : "${context}/study/autoCut.do",
				dataType : "json",
				data : {
					"cut" : 20,
					"text" : text
				}, 
			success: function(data){
					divAlert("autoCut Test");
					$("textarea").val(data);
					var length = stringByteLength(text);
					$("#byteLength").text(result + " byte");
				}
			})
		});
	
		$("textarea").on("keyup", function(){
			var text = $(this).val();
			var result = stringByteLength(text);
			$("#byteLength").text(result + " byte");
			
			if(result > 20){
				divAlert("20!");
				//설정바이트 초과는 자동자름
				text = byteCut(20, text);
				$("textarea").val(text);
				//바이트길이 다시계산
				result = stringByteLength(text);
				$("#byteLength").text(result + " byte");
			}

		})
		
		//바이트길이
		function stringByteLength(text){
			 for(byteVal=i=0 ; uniCode=text.charCodeAt(i++) ; byteVal += uniCode >> 11 ? 3 : uniCode >> 7 ? 2 : 1);
			 return byteVal;
			//text에 현재 위치의 유니코드값을 charCodeAt() 함수를 사용해서 가져온다.
			//text에 현재 위치의 유니코드값을 가져왔다면, 이어서 바이트 계산을 비트연산으로 진행한다.
			//2048(2^11)로 나누었을때 몫이 있으면 2048보다 큰 유니코드이므로 3바이트
			//그보다 작은데 128(2^7)로 나누었을 때 몫이 있으면 128보다 큰 유니코드이므로 2바이트
			//나머지 경우엔 1바이트를 할당하는 방식으로 비트 연산을 활용하고 있다.
		}
		
		//cutNum을 넘으면 문자열 자동자름
		function byteCut(cutNum, text){
			var byteVal = 0;	//총 바이트수
			var i = 0;
			while(byteVal < cutNum){
				var uniCode = text.charCodeAt(i++);
				byteVal += uniCode >> 11 ? 3 : uniCode >> 7 ? 2 : 1;
			}
			//cutNum보다 더 커져서 나왔을 경우 보정 
			if(byteVal > cutNum) i--;
			
			text = text.substring(0, i);
			return text
		}
		
		function divAlert(text){
			$("#alert").text(text);
			$("#alert").css("display", "block");
			if($("#alert").css("display") == "block"){
				setTimeout(function() {
					$("#alert").text("");
					$("#alert").css("display", "none");
				}, 3000);
			}
		}
	</script>
</body>
</html>