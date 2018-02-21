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