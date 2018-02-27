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
<c:choose>
	<c:when test="${empty ldto}"></c:when>
	<c:otherwise>
		<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
	</c:otherwise>
</c:choose>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>문의 게시판입니다.</h1>
<pre>
	문의게시글 목록, 게시글 등록 수정 삭제
	답변 
</pre>

	<table border="1">
		<tr>
			<th>제목</th>
			<c:choose>
				<c:when test="${ldto.enabled eq 'A'.charAt(0)}">
					<th>작성자</th>
				</c:when>
			</c:choose>
			<th>작성일</th>
		</tr>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					
					<c:choose>
						<c:when test="${ldto.enabled eq 'A'.charAt(0)}">
							<td colspan="3">
								작성된 문의가 없다네
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								작성된 문의가 없다네
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
						<tr>
							<td>
								<c:forEach var="i" begin="0" end="${dto.depth}" step="1">
									<c:if test="${i>0}">
										&nbsp;&nbsp;
									</c:if>
								</c:forEach>
								${dto.title}
							</td>
							<c:choose>
								<c:when test="${ldto.enabled eq 'A'.charAt(0)}">
									<td>${dto.id}</td>
								</c:when>
							</c:choose>
							<td>${dto.regdate}</td>
						</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>

<button type="button" onclick="QnaInputFromShow()">문의게시글 입력 폼</button>

<div id="QnaInputFrom" hidden="hidden">
	<table border="1">
		<tr>
			<th>제목</th>
			<th>내용</th>
		</tr>
	</table>
	<input type="hidden" name="id" readonly="readonly" value="${ldto.id}"/>
	<form action="" method="post">
		<table border="1">
			<tr>
				<th>제목</th><td><input type="text" name="title"/></td>
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























