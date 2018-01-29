<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function recoveryCheck() 
	{
		var email = $("#email").val();
		
		$.ajax
		(
			{
				type : "POST",
				url : "./recoveryCheck.do",
				data : "email="+email, 
				async : true,
				success : function(msg)
				{
					$("#recoveryCode").val(msg);
					$("#emailChk").attr("disabled",true);
					$("#recoveryBtn").attr("disabled",false);
				}
				
			}
		);
	}
	
	function recoverykeyChk() 
	{
		var email = $("#email").val()
		
		if($("#chkCode").val()==$("#recoveryCode").val())
		{
			location.href="./recovery.do?email="+email;
		}
		else
		{
			alert("인증 번호를 확인해주세요");
		}
	}
</script>
</head>
<body>
	<input type="text" id="email" name="email" readonly="readonly" value="${email}">
	<button id="emailChk" onclick="recoveryCheck()">이메일 인증</button>
	<input type="text" id="chkCode" name="chkCode">
	<button id="recoveryBtn" disabled="disabled" onclick="recoverykeyChk()">복구</button>
	<input hidden="hidden" id="recoveryCode">
</body>
</html>