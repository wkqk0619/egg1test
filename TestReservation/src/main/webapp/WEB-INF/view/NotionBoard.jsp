<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function NotionInputFormShow()
	{
		$('#NotionInputForm').toggle();
	}
</script>
</head>
<body>
<c:choose>
	<c:when test="${empty ldto}"></c:when>
	<c:otherwise>
		<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
	</c:otherwise>
</c:choose>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>이곳은 공지사항 게시판입니다.</h1>
<pre>
일반유저는 공지사항 목록만 보고
관리자는 공지사항 작성가능하게</pre>

<c:if test="${ldto.enabled == 'A'.charAt(0)}">
	<button type="button" onclick="NotionInputFormShow()">공지사항 작성하기</button>
</c:if>

	<div id="NotionInputForm" hidden="hidden">
		<form action="" method="post">
			<table border="1">
				<tr>
					<th>제목</th><td><input type="text" name="title" required="required"/></td>
				</tr>
				<tr>
					<th>내용</th><td><textarea rows="15" cols="50" name="content"></textarea></td>
				</tr>
				<tr>
					<th>작성</th><td><input type="submit" value="작성하기"/></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>