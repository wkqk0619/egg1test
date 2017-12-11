<%@page import="java.util.List"%>
<%@page import="com.hk.lab5.dtos.AnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$
	(
		function() 
		{
			<%
				List<AnswerDto> aList = (List<AnswerDto>)request.getAttribute("aList");
				String s="";
				
				for(AnswerDto dto:aList)
				{
					s += "$('#Q"+ dto.getQseq() +"').val('"+ dto.getAnswer() +"');";
				}
			%>
			
			<%=s%>
		}	
	);
</script>
</head>
<body>
	<form action="./writeAnswer.do" method="post">
		<input type="hidden" name="pseq" value="${pseq}">
		<c:forEach items="${qList}" var="dto">
			<input type="hidden" name="question" value="${dto.question}">
			<input type="hidden" name="qseq" value="${dto.qseq}">
			<span>${dto.question} : </span><input type="text" name="answer" id="Q${dto.qseq}"><br>
		</c:forEach>
		<input type="submit" value="확인">
	</form>
</body>
</html>