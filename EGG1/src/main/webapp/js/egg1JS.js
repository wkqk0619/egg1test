/**
 * 
 */
$(function(){
		$("#continer").children("#intro").siblings().hide();
		$("#theme").change(function() {
			$("body").css({"background-color":$("#theme").val()});
		});
	});
	
	function showintro(){
		$("#intro").siblings().hide();
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
	
	function repassword(){
		$("#repassword").dialog({
		dialogClass: "no-close",
		modal: true
		});
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
   