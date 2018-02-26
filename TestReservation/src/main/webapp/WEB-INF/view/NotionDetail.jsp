<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th><td>${dto.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${dto.content}</td>
		</tr>
		<tr>
			<th>작성일</th><td>${dto.regdate}</td>
		</tr>
	</table>
</body>
</html>