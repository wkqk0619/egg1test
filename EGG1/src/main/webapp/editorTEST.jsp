<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".editorHTMLDIV").hide();
		$(".editorDIV").keypress(function(key){
			//alert(key.keyCode);
			if(key.keyCode==95)
			{
				document.execCommand('delete');
				document.execCommand('Underline');
			}
			
			if(key.keyCode==96)
			{
				document.execCommand('formatBlock',false,'<h1>'); //제목 글씨 가능 기능
				
			}
			if(key.keyCode==33)
			{
				document.execCommand('enableInlineTableEditing');
			}
		});
	});
	
	//HTML 코드로 보기
	function convertToHTML()
	{
		$(".editorHTMLDIV").text($(".editorDIV").html());
		$(".editorHTMLDIV").show();
		$(".editorDIV").hide();
	}
	
	function convertToEditor()
	{
		$(".editorDIV").html($(".editorHTMLDIV").text());
		$(".editorDIV").show();
		$(".editorHTMLDIV").hide();
	}

</script>
<title>에디터 테스트</title>
</head>
<body>
일반 폰트 사이트
<small>asfd</small>
<h1>execCommand() 메서드 테스트</h1>
<div class="buttons">
	<input type="button" class="BOLD" value="B" onclick="document.execCommand('bold')"/>
	<input type="button" class="ITALIC" value="Italic" onclick="document.execCommand('Italic')"/>
	<input type="button" class="UNDERBAR" value="abc" onclick="document.execCommand('Underline')"/>
	<input type="button" class="BAR" value="abc" onclick="document.execCommand('StrikeThrough')"/>
	<input type="button" class="aignLeft" value="왼쪽정렬" onclick="document.execCommand('justifyleft')"/>
	<input type="button" class="aignCenter" value="가운데 정렬" onclick="document.execCommand('justifycenter')"/>
	<input type="button" class="aignRight" value="오른쪽정렬" onclick="document.execCommand('justifyright')"/>
</div>
<div>
	<div class="editorDIV" contenteditable="true"></div>
	<div class="editorHTMLDIV"></div>
</div>
<div class="buttons">
	<input type="button" value="에디터로 보기" onclick="convertToEditor()"/>
	<input type="button" value="HTML로 보기" onclick="convertToHTML()"/>
</div>
</body>
</html>