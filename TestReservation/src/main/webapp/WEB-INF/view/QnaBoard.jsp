<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의게시판</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function QnaInputFromShow()
	{
		$('#QnaInputFrom').toggle();
	}
</script>
</head>
<body>
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>문의 게시판입니다.</h1>
<pre>
	문의게시글 목록, 게시글 등록 수정 삭제
	답변 
</pre>

<button type="button" onclick="QnaInputFromShow()">문의게시글 입력 폼</button>

<div id="QnaInputFrom" hidden="hidden">
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>제목</th><td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<th>작성자</th><td><input type="text" name="id" readonly="readonly" value="${ldto.email}"/></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea rows="15" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<th>문의하기</th><td><input type="submit" value="문의하기"/></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>























