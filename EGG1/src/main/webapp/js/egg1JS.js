$(function(){
		//$("#continer").children("#intro").siblings().hide();
		$("#theme").change(function() {
			$("body").css({"background-color":$("#theme").val()});
		});
	});
	
	function showintro(){
//		$("#intro").siblings().hide();
		$("#intro").show();
		$("#repassword").hide();
	}
	
	function showloginForm(){
		$("#loginForm").siblings().hide();
		$("#loginForm").show();
	}
	
	function showregForm(){
		$("#regForm").siblings().hide();
		$("#regForm").show();
	}
	
	function repassword()
	{
		$("#repassword").show();
		/*
		$("#repassword").dialog({
		dialogClass: "no-close",
		modal: true
		});
		*/
	}
	
	function check() 
	{
		var email = $("#regemail").val()
		
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
					}
					else
					{
						$("#rNum").val(msg);
						$("#regemail").attr("readonly","true");
						$("#keyBtn").attr("disabled","true");
					}
				}
				
			}
		);
	}
	
	function keyChk() 
	{
		if($("#accKey").val()==$("#rNum").val())
		{
			$("#keyChk").attr("disabled",true);
			$("#registBtn").attr("disabled",false);
		}
		else
		{
			alert("인증 번호를 확인해주세요");
		}
	}
	
	function regist() 
	{
		var email = $("#regemail").val();
		var pw = $("#pwd").val();
		var patten = /^[A-Za-z0-9]{6,16}$/;
		var pattenOkFalse = patten.test(pw);
		if(pattenOkFalse==false)
		{
			alert("6~16자 영문 대 소문자, 숫자를 사용하세요");
			return false;
		}
		$.ajax
		(
			{
				type : "POST",
				url : "./Regist.do",
				data : "email="+email+"&pw="+pw, 
				async : true,
				success : function(msg)
				{
					if(msg=="S")
					{
						showloginForm();
					}
				}
				
			}
		);
	}
	
	function getlogin() 
	{
		var email = $("#loginemail").val();
		var pw = $("#loginpwd").val();
		var patten = /^[A-Za-z0-9]{6,16}$/;
		var pattenOkFalse = patten.test(pw);
		if(pattenOkFalse == false)
		{
			alert("아이디와 비밀번호가 일치하지 않습니다. 비밀번호는 6~16자리 영문대소문자, 숫자를 사용합니다.");
			return false;
		}
		$.ajax
		(
			{
				type : "POST",
				url : "./Login.do",
				data : "id="+email+"&pw="+pw, 
				async : true,
				success : function(msg)
				{
//					alert(msg);
					if(msg=="S")
					{
						location.href="./LoginMain.do";
					}
					else
					{

						//alert("아이디와 비밀번호가 일치하지 않습니다."+pattenOkFalse);

						if(msg=="O")
						{
							alert("탈퇴 신청이 된 회원입니다 복구페이지로 이동합니다.");
							//복구페이지로 이동
							location.href="./recoveryAccount.do?email="+email;
						}
						else
						{							
							alert("아이디와 비밀번호가 일치하지 않습니다.");
						}

					}
				}
				
			}
		);
	}
	
	function findCheck() 
	{
		var email = $("#findemail").val()
		
		$.ajax
		(
			{
				type : "POST",
				url : "./FindCheck.do",
				data : "email="+email, 
				async : true,
				success : function(msg)
				{
					if(msg=="O")
					{
						alert("존재하지 않는 계정입니다.");
					}
					else
					{
						$("#findrNum").val(msg);
						$("#findemail").attr("readonly","true");
						$("#findKeyBtn").attr("disabled","true");
					}
				}
				
			}
		);
	}
	
	function findkeyChk() 
	{
		if($("#findKey").val()==$("#findrNum").val())
		{
			var email = $("#findemail").val()
			
			$.ajax
			(
				{
					type : "POST",
					url : "./Sendpw.do",
					data : "email="+email, 
					async : true,
					success : function(msg)
					{
						if(msg=="S")
						{
							$("#repassword").hide();
							$("#findrNum").val("");
							$("#findemail").val("");
							$("#findKey").val("");
						}
					}
					
				}
			);
		}
		else
		{
			alert("인증 번호를 확인해주세요");
		}
	}
	
	
	
	
	/*
	function showidearMain(){
		$("#supptyBis").hide();
		$("#idearMain").show();
	}
	
	function showsupptyBis(){
		$("#idearMain").hide();
		$("#supptyBis").show();
	}
	*/
   