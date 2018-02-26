<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입을 위한 페이지</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	var rNum;
	
	function check() 
	{
		var email = $("#regemail").val()
		
		//var patten = /^[A-Za-z0-9]{6,16}$/; 비밀번호 패턴
		var patten = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$/;
		var pattenOkFalse = patten.test(email);
		if(pattenOkFalse == false)
		{
			alert("이메일 형식하고 맞지 않습니다.");
			//return false;
			return false;
		}
		else
		{
			alert('정상적인 이메일 형식 입니다.');
			$("#regemail").attr("readonly",true);
			$("#keyBtn").attr("disabled",true);
			$.ajax
			(
				{
					type : "POST",
					url : "./EmailCheck.do",
					data : "email="+email, 
					async : true,
					success : function(msg)
					{
						if(msg=="O")
						{
							alert("이미 가입된 이메일입니다.");
							$("#regemail").attr("readonly",false);
							$("#keyBtn").attr("disabled",false);
						}
						else
						{
							rNum=msg;
							$("#keyChk").show();
							$("#keyChkBtn").show();
						}
					}
					
				}
			);
		}
		
	}
	
	function keyCheck() 
	{
		if($("#keyChk").val()==rNum)
		{
			$("#submit").attr("disabled",false);
		}
		else
		{
			alert("인증번호를 확인해 주세요");
		}
	}
</script>
</head>
<body>
<h1>이곳은 회원 가입을 위한 페이지 입니다.</h1>
<form action="./regist.do" method="post">
	<input name="id" id="regemail" type="text" placeholder="이메일을 적어주세요" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"/><input type="button" id="keyBtn" onclick="check()" value="이메일인증">
	<input type="text" id="keyChk" hidden="hidden">
	<input id="keyChkBtn" type="button" onclick="keyCheck()" hidden="hidden" value="인증">
	<br>
	<input name="password" type="password" required="required" placeholder="패스워드를 적어주세요" pattern="^[A-Za-z0-9]{6,16}$">
	<br>
	<input type="submit" id="submit" value="회원가입" disabled="disabled"/>
</form>
</body>
</html>