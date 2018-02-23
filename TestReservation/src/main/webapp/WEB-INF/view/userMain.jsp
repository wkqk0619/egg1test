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
	${ldto.id} 님 환영합니다.
	<br/>
	<button type="button" onclick="location='./NotionBoard.do'">공지사항보기</button>
	<button type="button" onclick="location='./QnaBoard.do'">문의사항</button>
<!-- 	<button type="button" onclick="location='./TimeTragdeBoard.do'">시간 거래소</button> -->
	<button type="button" onclick="location='./Mypage.do'">마이페이지</button>
	<button type="button" onclick="location='./buyerMain.do'">구매자 로그인</button>
	<button type="button" onclick="location='./sellerMain.do'">판매자 로그인</button>
</body>
</html>