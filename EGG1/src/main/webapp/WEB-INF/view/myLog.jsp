<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
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
				<td><c:choose><c:when test="${dto.logType=='S'}">로그인</c:when><c:when test="${dto.logType=='F'}">로그인실패</c:when><c:when test="${dto.logType=='R'}">복구시도</c:when><c:otherwise>로그아웃</c:otherwise></c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='./myPage.do'">마이페이지</button>
</body>
</html>