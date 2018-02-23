<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>퀘스트 현황</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<!-- <script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet"  href="css/bootstrap.min.css"> -->
<link rel="stylesheet" href="css/theme.default.css">
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<script type="text/javascript">
	$(function(){
		$('#myTable').tablesorter();
		$('#myTable').show();
	});
</script>
</head>
<body>
<h1>구매자 본인의 퀘스트 현황을 확인하는 페이지 입니다.</h1>
<pre>
	구매자 본인의 퀘스트만을 보여준다.
	모집현황이라던지 이러한걸 확인한다.
</pre>
<table id="myTable" class="tablesorter" hidden="hidden">
	<thead>
		<tr>
			<th>퀘스트명</th><th>일시</th><th>모집현황</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>퀘스트1</td><td>@@@@,@@,@@ @@:@@:@@</td><td>1/15</td>
		</tr>
		<tr>
			<td>퀘스트2</td><td>@@@@,@@,@@ @@:@@:@@</td><td>1/20</td>
		</tr>
	</tbody>
</table>
</body>
</html>