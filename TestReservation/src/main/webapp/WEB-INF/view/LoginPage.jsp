<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
</head>
<body>
<h1>로그인페이지 입니다.</h1>
<form action="./userLogin.do" method="post">
	<input type="text" name="email" id="emailInput" placeholder="이메일을 입력해주세요"/>
	<input type="password" name="password" id="passwordInput" placeholder="비밀번호를 입력해주세요."/>
	<input type="submit" value="로그인"/>
</form>
<button type="button" onclick="location='./ReguserPage.do'">회원가입</button>
</body>
</html>