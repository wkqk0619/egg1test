<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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