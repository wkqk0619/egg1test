<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
	$
	(
		function() 
		{
			$("#tabs").tabs();
		}	
	);
	
	function active()
	{
		var id = $("#num").val();
		$("#tabs").tabs("option","active",id);
	}
	
	function enable()
	{
		var num = $("#num").val()*1+1;
		var id = "tabs-"+num;
		
// 		$("#tabs").tabs("enable",id);
		$("#tabs"+num).show();
	}
	
	function disable()
	{
		var num = $("#num").val()*1+1;
		var id = "tabs-"+num;
		
		$("#tabs"+num).hide();
// 		$("#tabs").tabs("disable",id);
	}
	
</script>
</head>
<body>
	<div>
		기능 테스트
		<input type="number" id="num" value="0"><button onclick="active(num.value)">active</button>
		<button onclick="enable()">enable</button>
		<button onclick="disable()">disable</button>
	</div>
	<div id="tabs">
		<ul>
			<li id="tabs1"><a href="#tabs-1">One</a></li>
			<li id="tabs2"><a href="#tabs-2">Two</a></li>
			<li id="tabs3"><a href="#tabs-3">Three</a></li>
		</ul>
		<div id="tabs-1" id="tabs-1">
			1탭
		</div>
		<div id="tabs-2" id="tabs-2">
			2탭
		</div>
		<div id="tabs-3" id="tabs-3">
			3탭
		</div>
	</div>
</body>
</html>