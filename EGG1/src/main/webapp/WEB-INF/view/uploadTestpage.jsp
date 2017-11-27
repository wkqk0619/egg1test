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
<form action="fileUpload" enctype="multipart/form-data">
	<input type="text" name="name"/>
	<input type="text" name="fileurl"/>
	<input type="text" name="filesize"/>
	<input type="text" name="id"/>
	<input type="text" name="pseq">
</form>
</body>
</html>