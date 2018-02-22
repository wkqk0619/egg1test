<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인유저메인</title>
</head>
<body>
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<h1>로그인한 유저</h1>
${ldto.email} 님 환영합니다.
</body>
</html>