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
			<th>번호</th>
			<th>제목</th>
			<th>분야</th>
			<th>지역</th>
			<th>분류</th>
<!-- 			<th>URL</th> -->
			<th>등록일</th>
			<th>접수시작일</th>
			<th>접수종료일</th>
			<th>소속</th>
			<th>대상</th>
			<th>대상연령</th>
			<th>대상업력</th>		
		</tr>
		
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.sseq}</td>
					<c:choose>
						<c:when test="${ldto.role ne 'U'.charAt(0)}">
							<td><a href="./supportQus.do?sseq=${dto.sseq}">${dto.title}</a></td>
						</c:when>
						<c:otherwise>
							<td>${dto.title}</td>
						</c:otherwise>
					</c:choose>
					<td>${dto.type}</td>
					<td>${dto.area}</td>
					<td>${dto.biztitle}</td>
<%-- 					<td>${dto.url}</td> --%>
					<td>${dto.regdate}</td>
					<td>${dto.startdate}</td>
					<td>${dto.enddate}</td>
					<td>${dto.sgroup}</td>
					<td>${dto.target}</td>
					<td>${dto.targetage}</td>
					<td>${dto.targetcareer}</td>	
				</tr>
			</c:forEach>
	</table>
</body>
</html>