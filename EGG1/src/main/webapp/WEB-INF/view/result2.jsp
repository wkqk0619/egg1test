<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>화면을 pdf 로 배포하기</title>
<link rel="stylesheet" type="text/css" href="css/pdftest.css">
<!-- <script type="text/javascript" src="js/jquery-3.2.1.js"></script> -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#pdte").submit(function() {
		$("#pdarea").val($("#testPDF").html());
	});
});
</script>
</head>
<body>
	<div id="testPDF">
		<div style="font-family: MalgunGothic;">
			<form action="./pdfTest.do" method="post" id="pdte">
			<input type="text" name="fName"/>
			<br/>
<%-- 			<c:forEach begin="0" end="${fn:length(question)-1}" step="1" varStatus="status"> --%>
<%-- 				<span>${question[status.index]} : </span><input type="text" value="${answer[status.index]}"/><br> --%>
<%-- 			</c:forEach> --%>
				<span>asdfsdfsd</span>
			<input type="submit" value="pdf다운로드"/>
			<textarea rows="100" cols="100" id="pdarea" name="pdfarea" hidden="hidden"></textarea>
		</form>
		</div>
	</div>
</body>
</html>