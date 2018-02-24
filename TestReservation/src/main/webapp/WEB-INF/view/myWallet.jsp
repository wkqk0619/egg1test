<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" onclick="location='./Mypage.do'">마이페이지</button>
	<table border="1">
		<tr>
			<th>시간</th><th>구분</th><th>보유금액</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="3">기록이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.logtime}</td><td>${dto.logtype}</td><td>${dto.amount}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>