<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function detail(val)
	{		
		$.get("https://cors-anywhere.herokuapp.com/"+val
				, 
				function(data)
				{
				    var meta = $(data).filter('meta[property="og:description"]');
				    if($(meta).attr("content")!="")
			       	{		        
				   		$("#alertpr").val($(meta).attr("content"));
			      	}
				    else
				    {
				        $("#alertpr").val("본문이 삭제된 글");
				    }
				    $("#alertpr").show();
				}
		);
	}
	
	function addMySupport(sseq) 
	{
		$.ajax
		(
			{
				type: "POST",
				url: "./addMySupport.do",
				data:"sseq="+sseq,
				async:true,
				success:function(msg)
				{
					if(msg=="T")
					{
						alert("추가됨");
					}
					else if(msg=="O")
					{
						alert("이미 추가된상태라네");
					}
					else
					{
						alert("오류처리까진 생각안했는데 말이야 떠버렸네");
					}
				}
			}
		);
	}
</script>
<style type="text/css">
	#alertpr
	{
		height: 500px;
		width: 500px;
		top : 50px;
		left: 500px;
		background-color: #d9dde2;
		position: fixed;
	}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>분야</th>
			<th>지역</th>
			<th>분류</th>
<!-- 			<th>URL</th> -->
			<th>등록일</th>
			<th>접수시작일</th>
			<th>접수종료일</th>
			<th>소속</th>
			<th>대상</th>
			<th>대상연령</th>
			<th>대상업력</th>
			<th>마이지원등록</th>
		</tr>
		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.sseq}</td>
				<c:choose>
					<c:when test="${ldto.role ne 'U'.charAt(0)}">
						<td><a href="./supportQus.do?sseq=${dto.sseq}">${dto.title}</a></td>
					</c:when>
					<c:otherwise>
						<td><span onclick="detail('${dto.url}')" >${dto.title}</span></td>
					</c:otherwise>
				</c:choose>
				<td>${dto.type}</td>
				<td>${dto.area}</td>
				<td>${dto.biztitle}</td>
<%--				<td>${dto.url}</td> --%>
				<td>${dto.regdate}</td>
				<td>${dto.startdate}</td>
				<td>${dto.enddate}</td>
				<td>${dto.sgroup}</td>
				<td>${dto.target}</td>
				<td>${dto.targetage}</td>
				<td>${dto.targetcareer}</td>
				<td><button onclick="addMySupport('${dto.sseq}')">추가</button></td>
			</tr>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${ldto.role ne 'U'.charAt(0)}">
			<button onclick="location.href='./LoginMain.do'">메인으로</button>
		</c:when>
	</c:choose>
	<textarea id="alertpr" hidden="hidden" rows="500" cols="400" readonly="readonly"></textarea>
</body>
</html>