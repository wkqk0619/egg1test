<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
	<form action="./searchLog.do" method="post">
		<select name="type">
			<option value="id">ID</option>
			<option value="ip">IP</option>
		</select>
		<input type="text" name="search">
		<input type="text" name="date" id="txtDate" readonly="readonly" onclick="fnPopUpCalendar(txtDate,txtDate,'yyyy-mm-dd')" class='text_box1'>
		<select name="logtype">
			<option value="A">전체</optgroup>
			<option value="S">로그인</option>
			<option value="F">로그인실패</option>
			<option value="R">복구시도</option>
			<option value="O">로그아웃</option>
		</select>
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
				<td><c:choose><c:when test="${dto.logType=='S'}">로그인</c:when><c:when test="${dto.logType=='F'}">로그인실패</c:when><c:when test="${dto.logType=='R'}">복구시도</c:when><c:otherwise>로그아웃</c:otherwise></c:choose></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>