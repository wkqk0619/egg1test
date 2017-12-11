<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<c:forEach begin="0" end="${fn:length(question)-1}" step="1" varStatus="status">
		<span>${question[status.index]} : </span><input type="text" value="${answer[status.index]}"><br>
	</c:forEach>
	<button onclick="location.href='./LoginMain.do'">메인으로</button>
</body>
</html>