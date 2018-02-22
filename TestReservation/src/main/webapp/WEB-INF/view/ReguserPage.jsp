<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입을 위한 페이지</title>
</head>
<body>
<h1>이곳은 회원 가입을 위한 페이지 입니다.</h1>
<form action="" method="post">
	<input name="email" type="text" required="required" placeholder="이메일을 적어주세요"/>
	<input name="password" type="password" required="required" placeholder="패스워드를 적어주세요">
	<input name="name" type="text" required="required" placeholder="이름을 적어주세요"/>
	<input name="gender" type="text" placeholder="성별"/>
	<input name="address" type="text" placeholder="주소를 적어주세요"/>
	<input type="submit" value="회원가입"/>
</form>
</body>
</html>