<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인페이지</title>
</head>
<body>
	유저로그인<br>
	세션값 테스트<br>
	id = ${ldto.id}<br>
	password = ${ldto.password}<br>
	regdate = ${ldto.regdate}<br>
	role = ${ldto.role}<br>
	enabled = ${ldto.enabled}<br>
	nickname = ${ldto.nickname}<br>
	icon = ${ldto.icon}<br>
	<button onclick="#">아이디어</button><br>
	<button onclick="#">지원사업</button>
	
</body>
</html>