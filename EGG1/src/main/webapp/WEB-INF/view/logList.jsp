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
	<form action="./searchLog.do" method="post">
		<select name="type">
			<option value="id">ID</option>
			<option value="ip">IP</option>
			<option value="logTime">시간</option>
			<option value="logType">분류</option>
		</select>
		<input type="text" name="search">
		<!-- <select name="logtype">
			<option value="S">로그인</option>
			<option value="F">로그인실패</option>
			<option value="R">복구시도</option>
			<option value="O">로그아웃</option>
		</select> -->
		<input type="submit" value="검색">
	</form>
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
</body>
</html>