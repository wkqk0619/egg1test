<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<td></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="60" rows="10" readonly="readonly"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정"/>
				<input type="button" value="답글"/>
				<input type="button" value="삭제"/>
			</td>
		</tr>
	</table>
	
	<div>
		<hr>
		<h2>답글작성</h2>
		<form>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="60" rows="10"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>