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
	<c:when test="${empty searInfo}"></c:when>
	<c:otherwise>
		<c:forEach items="${searInfo}" var="inf">
			<span>${inf.qseq}</span>
			<span>${inf.qname }</span>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>