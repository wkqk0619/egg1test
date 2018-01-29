<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./recovery.do" method="post">	
		<input type="text" name="email" readonly="readonly" value="${email}">
		<input type="button" id="emailChk" name="emailChk" value="이메일 인증">
		<input type="text" name="chk">
		<input type="submit" name="recoveryBtn" disabled="disabled" value="복구">
	</form>
</body>
</html>