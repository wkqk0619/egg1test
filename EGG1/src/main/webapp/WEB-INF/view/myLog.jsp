<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th><th>IP</th><th>시간</th><th>분류</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.ip}</td>
				<td>${dto.logTime}</td>
				<td>${dto.logType}</td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='./myPage.do'">마이페이지</button>
</body>
</html>