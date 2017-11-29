<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function togShow(){
		$("#insertQuestionForm").toggle();
	}
	
	function serchInfo(){
		var val=$("#serchInfo").val();
		location.href="./searchInfo.do?question="+val;
	}
	function hid(){
		$("#proWind").hide();
	}
	$(function(){
		$("#serchInfo").keypress(function(key) {
			//alert(key.keyCode);
			if(key.keyCode==13){
				serchInfo();
			}
		});
		$(".delQu").click(function() {
			$("input[name=qseq]").val($(this).siblings(".delseq").text());
			$("#proWind").toggle();
// 			alert($("input[name=qseq]").val());
		});
	});
</script>
</head>
<body>

<input id="serchInfo" type="text" name="serchInfo"/><button onclick="serchInfo()">검색</button>
<hr/>
<c:choose>
	<c:when test="${ empty lists }">
	</c:when>
	<c:otherwise>
		<c:forEach items="${lists }" var="dto">
			<div>
				<span class="delseq">${dto.qseq}</span>
				<span class="delQu">${dto.question}</span>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${ empty searInfo }">
	</c:when>
	<c:otherwise>
		<c:forEach items="${searInfo }" var="dto">
			<div>
				<span class="delseq">${dto.qseq}</span>
				<span class="delQu">${dto.question}</span>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>

<div id="insertQuestionForm" hidden="hidden">
	<form action="./insertQuestion.do" method="post">
		<input type="text" name="question"/>
		<input type="submit" value="확인"/>
	</form>
</div>
<div id="proWind" hidden="hidden">
	삭제하시겠습니까??<br/>
	<form action="./deleteQuestion.do" method="post">
		<input name="qseq" type="text"/>
		<input type="submit" value="삭제"/>
	</form>
	<button onclick="hid()">취소</button>
</div>
<button onclick="togShow()">질문추가</button>
<button onclick="location.href='./AdminLoginMain.do'">메인으로</button>
</body>
</html>