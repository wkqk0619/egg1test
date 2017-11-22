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
	
	function showidearMain(){
		$("#supptyBis").hide();
		$("#idearMain").show();
	}
	
	function showsupptyBis(){
		$("#idearMain").hide();
		$("#supptyBis").show();
		
	}

   