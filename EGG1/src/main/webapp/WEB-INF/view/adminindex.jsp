<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function getlogin() 
	{
		var email = $("#id").val();
		var pw = $("#pw").val();
		
		$.ajax
		(
			{
				type : "POST",
				url : "./Login.do",
				data : "id="+email+"&pw="+pw, 
				async : true,
				success : function(msg)
				{
					if(msg=="S")
					{
						location.href="./AdminMain.do";
					}
					else
					{
						alert("아이디와 비밀번호가 일치하지 않습니다.");
					}
				}
				
			}
		);
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" id="id" required="required"></td>
		</tr>
		<tr>
			<th>pw</th>
			<td><input type="password" name="pw" id="pw" required="required"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="getlogin()" value="로그인">
			</td>
		</tr>
	</table>
</body>
</html>