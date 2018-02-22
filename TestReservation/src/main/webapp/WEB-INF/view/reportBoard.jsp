<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function reportInputFormDivShow()
	{
		$('#reportInputFormDiv').toggle();
	}
</script>
<title>신고게시판</title>
</head>
<body>
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>이곳은 신고게시판영역 입니다.</h1>
<pre>
	신고게시판은 다양한 유저들이 작성한 불량 회원 신고게시판으로
	신고 게시글의 작성 수정 삭제 기능만 구현한다. 댓글X 답글 X
</pre>
<button type="button" onclick="reportInputFormDivShow()">게시글 작성</button>
<div id="reportInputFormDiv" hidden="hidden">
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>제목</th><td><input type="text" name="title" required="required"/></td>
			</tr>
			<tr>
				<th>작성자</th><td><input type="text" name="id" value="${ldto.email}" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>신고할 유저</th><td><input type="text" name="tagetid" required="required"/></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea rows="10" cols="30" required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성하기"/></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>