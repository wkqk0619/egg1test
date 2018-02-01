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
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
				
				int i = aList.size();
			%>
			
			<%=s%>
			
			var qLength=<%=i%>;
			var emp=0; // 빈칸 갯수 
			
			$(".answer").each
			(
				function() 
				{
					if($(this).val() == "")
					{
						emp++;
					}
				}	
			);
			
			var per = (qLength-emp)/qLength*100;
			var comp = per.toFixed(1);
			
			$("#comp").text(comp+"%");
		}	
	);
</script>
</head>
<body>
	<p><span>몇퍼센트나 작성했을까나? : </span><span id="comp"></span></p>
	<form action="./writeAnswer.do" method="post">
		<input type="hidden" name="pseq" value="${pseq}">
		<c:forEach items="${qList}" var="dto">
			<input type="hidden" name="question" value="${dto.question}">
			<input type="hidden" name="qseq" value="${dto.qseq}">
			<span>${dto.question} : </span><input class="answer" type="text" name="answer" id="Q${dto.qseq}"><br>
		</c:forEach>
		<input type="submit" value="확인">
	</form>
</body>
</html>