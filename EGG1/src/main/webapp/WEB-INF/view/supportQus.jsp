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
	<c:forEach items="${qList}" var="dto">
		<div><input id="${dto.qseq}" type="checkbox" name="chk" value="${dto.qseq}">${dto.question}</div>
		<br>
	</c:forEach>
</body>
</html>