<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		//$(".editorHTMLDIV").hide();
		
		$(".editorDIV").keydown(function(key){
			//alert(key.keyCode);
			if(key.altKey&&key.keyCode==189) //알트 + -
			{
				document.execCommand('Underline');
			}
			
			if(key.altKey&&key.keyCode==49) //복합키 인식 알트 + 1
			{
				//alert('2개 같이 눌린');
				document.execCommand('formatBlock',false,'<h1>');
			}
			if(key.altKey&&key.keyCode==50) //복합키 인식 알트 + 2
			{
				//alert('2개 같이 눌린');
				document.execCommand('insertHorizontalRule');//구분선 추가
			}
			if(key.altKey&&key.keyCode==51) // 알트 + 3
			{
					document.execCommand('insertOrderedList'); //1 2 3 리스트 구분		
			}
			if(key.altKey&&key.keyCode==52) // 알트 + 4
			{
					document.execCommand('insertUnorderedList'); //. 으로 나열		
			}
			if(key.altKey&&key.keyCode==73) // 알트 + i
			{
					document.execCommand('italic'); //이탤릭체(기울인글씨체)	
			}
			if(key.altKey&&key.keyCode==188) // 알트 + <
			{
					document.execCommand('justifyLeft'); //왼쪽정렬	
			}
			if(key.altKey&&key.keyCode==54) //알트 + ^
			{
					document.execCommand('justifyCenter'); //가운데정렬
			}

			if(key.altKey&&key.keyCode==190) //알트 + >
			{
					document.execCommand('justifyRight'); //오른쪽정렬	
			}
			if(key.altKey&&key.keyCode==88) //알트 + x
			{
					document.execCommand('strikeThrough'); //삭제글??(--dfsdfsdf가로줄 하고 같이있는 글씨)	
			}
			
			/*
			if(key.keyCode==9)//들여쓰기
			{
				document.execCommand('indent');
			}
			*/
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
	
	function guideShow()
	{
		$("#Editorguide").toggle();
	}

</script>
<style type="text/css">
.editorDIV, .editorHTMLDIV
{
	border: 1px solid black;
	height: 300px;
	overflow: scroll;
	
} 
</style>
<title>에디터 테스트</title>
</head>
<body>
일반 폰트 사이트
<small>asfd</small>
<h1>execCommand() 메서드 테스트</h1>
<div class="buttons" hidden="hidden">
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
	<div class="editorHTMLDIV" hidden="hidden"></div>
</div>
<div class="buttons">
	<input type="button" value="에디터로 보기" onclick="convertToEditor()"/>
	<input type="button" value="HTML로 보기" onclick="convertToHTML()"/>
	<input type="button" value="사용법 보기" onclick="guideShow()">
</div>
<div hidden="hidden" id="Editorguide">
	<table border="1">
		<thead>
			<tr>
				<th>기능명</th><th>조작키</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>알트 + -</td><td>밑줄</td>
			</tr>
			<tr>
				<td>알트 + !</td><td>제목태그</td>
			</tr>
			<tr>
				<td>알트 + @</td><td>구분선</td>
			</tr>
			<tr>
				<td>알트 + #</td><td>1 2 3 리스트</td>
			</tr>
			<tr>
				<td>알트 + $</td><td> . 점 리스트</td>
			</tr>
			<tr>
				<td>알트 + i</td><td>이탤릭체</td>
			</tr>
			<tr>
				<td>알트 + 〈  </td><td>왼쪽정렬</td>
			</tr>
			<tr>
				<td>알트 + ^</td><td>가운데 정렬</td>
			</tr>
			<tr>
				<td>알트 + > </td><td>오른쪽 정렬</td>
			</tr>
			<tr>
				<td>알트 + x </td><td>취소글씨?? 삭제글씨??</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>





















