<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	관리자로그인<br>
	세션값 테스트<br>
	id = ${ldto.id}<br>
	password = ${ldto.password}<br>
	regdate = ${ldto.regdate}<br>
	role = ${ldto.role}<br>
	enabled = ${ldto.enabled}<br>
	nickname = ${ldto.nickname}<br>
	icon = ${ldto.icon}<br>
	
	<button>회원 관리</button>
	<button>질문 관리</button>
	<button>공고 관리</button>
	<button>문의내용 관리</button>
</body>
</html>