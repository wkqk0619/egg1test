<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>uploadTestpage</title>
</head>
<body>
<h1>파일업로드 테스트 페이지</h1>
<form action="./fileUpload.do" method="post" enctype="multipart/form-data">
	<input name="id" value="${ldto.id}"/>
	<input type="file" name="file"/>
	<input type="submit" value="저장"/>
</form>
</body>
</html>