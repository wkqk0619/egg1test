<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<link rel="stylesheet" href="css/theme.default.css">
<script type="text/javascript">
	$(function(){
		$("#statisList").tablesorter();
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty lists}">작성된 답변이 없습니다.</c:when>
		<c:otherwise>
			<table class="table table-striped table-bordered table-responsive tablesorter" id="statisList">
				<thead>
					<tr>
						<th>ID</th><th>답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lists}" var="dto">
						<tr>
							<td><a href="./userAllAnswer.do?id=${dto.id}&qseq=${qseq}">${dto.id}</a></td><td>${dto.answer}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='./selectQuestion.do'">질문관리</button>
	<button onclick="location.href='./LoginMain.do'">메인으로</button>
</body>
</html>