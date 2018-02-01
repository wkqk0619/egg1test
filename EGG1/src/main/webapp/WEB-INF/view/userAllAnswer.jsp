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
	<c:choose>
		<c:when test="${empty lists}">작성된 답변이 없습니다.</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th>프로젝트</th><th>질문</th><th>답변</th>
				</tr>
				<c:forEach items="${lists}" var="dto">
					<tr>
						<td>${dto.name}</td><td>${dto.question}</td><td>${dto.answer}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='./statisticsQus.do?qseq=${qseq}'">뒤로</button>
	<button onclick="location.href='./LoginMain.do'">메인으로</button>
</body>
</html>