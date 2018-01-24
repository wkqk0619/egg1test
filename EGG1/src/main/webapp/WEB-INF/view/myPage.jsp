<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">
	function upNickName() 
	{
		$("#upNickName").show();
	}

	function hideNick() 
	{
		$("#upNickName").hide();
	}
	
	function upPassword() 
	{
		$("#upPassword").show();
	}
	
	function hidePass() 
	{
		$("#upPassword").hide();
	}
</script>
</head>
<body>
	<h1>가입정보</h1>
<%-- 	아이디 : ${ldto.id}<br> --%>
<!-- 	<button onclick="upPassword()">비밀번호 변경</button><br> 현재 비밀번호를 묻는 절차가 있어야 하겠지만 일단 생략 -->
<!-- 	<div id="upPassword" hidden="hidden"> -->
<!-- 		<form action="./upPassword.do" method="post"> -->
<%-- 			<input type="hidden" name="id" value="${ldto.id}"> --%>
<!-- 			패스워드 : <input type="text" name="password"> -->
<!-- 			<input type="submit" value="변경"> <input type="button" onclick="hidePass()" value="취소"> -->
<!-- 		</form> -->
<!-- 	</div> -->
<%-- 	가입일자 : ${ldto.regdate}<br> --%>
<%-- 	닉네임 : ${ldto.nickname} <button onclick="upNickName()">닉네임변경</button><br> --%>
<!-- 	<div id="upNickName" hidden="hidden"> -->
<!-- 		<form action="./upNickName.do" method="post"> -->
<%-- 			<input type="hidden" name="id" value="${ldto.id}"> --%>
<!-- 			닉네임 : 	<input type="text" name="nickname"> -->
<!-- 			<input type="submit" value="변경"> <input type="button" onclick="hideNick()" value="취소"> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	<button onclick="location.href='./LoginMain.do'">메인으로</button> -->
<%-- 	아이콘 : ${ldto.icon} --%>
	<table  class="table table-striped table-bordered table-responsive">
		<tr>
			<th>아이디 : ${ldto.id} </th><td><button onclick="upPassword()">비밀번호 변경</button></td>
		</tr>
		<tr id="upPassword" hidden="hidden">
			<th>바꿀 패스워드 </th>
			<td>
				<div>
					<form action="./upPassword.do" method="post">
						<input type="hidden" name="id" value="${ldto.id}">
						<input type="text" name="password">
						<input type="submit" value="변경"> <input type="button" onclick="hidePass()" value="취소">
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<th>가입일자</th><td>${ldto.regdate}</td>
		</tr>
		<tr>
			<th>닉네임</th><td>${ldto.nickname} <button onclick="upNickName()">닉네임변경</button></td>
		</tr>
		<tr hidden="hidden" id="upNickName">
			<th>변경할 닉네임</th>
			<td>
				<div>
					<form action="./upNickName.do" method="post">
						<input type="hidden" name="id" value="${ldto.id}">
						<input type="text" name="nickname">
						<input type="submit" value="변경"> <input type="button" onclick="hideNick()" value="취소">
					</form>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>