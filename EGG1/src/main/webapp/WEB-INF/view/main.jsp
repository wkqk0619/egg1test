<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<button onclick="location.href='./selectNotion.do'">공지</button>
	<button onclick="location.href='./selectProject.do'">프로젝트</button><br>
	<button onclick="location.href='./qnaList.do'">문의게시판</button>
	<button onclick="location.href='./supportList.do'">지원사업</button>
	<button onclick="location.href='./mySupportList.do'">마이지원</button>
	
</body>
</html>