<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	관리자로그인<br>
	세션값 테스트<br>
	id = ${ldto.id}<br>
	password = ${ldto.password}<br>
	regdate = ${ldto.regdate}<br>
	role = ${ldto.role}<br>
	enabled = ${ldto.enabled}<br>
	nickname = ${ldto.nickname}<br>
	icon = ${ldto.icon}<br>
	 --%>
	
	<button onclick="location='./userList.do'">회원 관리</button>
	<button onclick="location='./logList.do'">접속기록</button>
	<button onclick="location='./selectQuestion.do'">질문 관리</button>
	<button onclick="location.href='./selectNotion.do'">공지 관리</button>
	<button onclick="location.href='./supportList.do'">공고 관리</button>
	<button onclick="location.href='./qnaList.do'">문의내용 관리</button>
	<button onclick="location.href='./restoreProj.do'">프로젝트 복구 관리</button>
	<button onclick="location.href='./EggLogout.do'">로그아웃</button>
</body>
</html>