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
		<tr>
			<th>제목</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td>리스트가 읎어요</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="list" var="dto">
					<tr>
						<td>
							${dto.title}
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>