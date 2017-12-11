<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>화면을 pdf 로 배포하기</title>
<!-- <script type="text/javascript" src="js/jspdf.js"></script> -->
<link rel="stylesheet" type="text/css" href="css/pdftest.css">
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#pdte").submit(function() {
		$("#pdarea").val($("#testPDF").html());
	});
});
</script>
</head>
<body>
<form action="./pdfTest.do" method="post" id="pdte">
<input type="text" name="fName">
	<div id="testPDF">
		<div style="font-family: MalgunGothic;">
			<h1>PDF 다운로드 테스트</h1>
			<span>빨간거</span>
			<pre>
				우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
						여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
								우하하하
				여기는 파란거로 할꺼지 ㅋㅋㅋ
				
			</pre>
		</div>
</div>
<input type="submit" value="pdf다운로드"/>
<textarea rows="100" cols="100" id="pdarea" name="pdfarea" hidden="hidden"></textarea>
</form>

</body>
</html>