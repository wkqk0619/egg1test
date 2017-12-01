<%@page import="com.hk.lab5.dtos.QuestionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%
		List<QuestionDto> list = (List<QuestionDto>)request.getAttribute("list");	
	%>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$
	(
		function() 
		{
			<%
				for(QuestionDto dto:list)
				{
					%>
						$("#Q<%=dto.getQseq()%>").attr("checked", true);
					<%
				}
			%>			
		}	
	);
</script>
</head>
<body>
	<form action="./ChangeSupportQ.do" method="post">
		<input type="hidden" name="sseq" value="${sseq}">
		<c:forEach items="${qList}" var="dto">
			<div><input id="Q${dto.qseq}" type="checkbox" name="chk" value="${dto.qseq}">${dto.question}</div>
			<br>
		</c:forEach>
		<input type="submit" value="변경">
	</form>
</body>
</html>