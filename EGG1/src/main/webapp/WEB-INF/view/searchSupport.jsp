<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">




$(function(){
	var typeArr = ["창업교육","정책자금","판로·해외진출","멘토링·컨설팅","사업화","시설·공간","R&D","행사·네트워크"];
	var targetArr = ["일반기업","1인 창조기업","대학생","일반인","대학","연구기관","청소년"];
	var areaArr = ["서울특별시","인천광역시","경기도",
					"전라남도","전라북도","광주광역시",
					"대전광역시","대구광역시","부산광역시",
					"충청남도","충청북도"];
	$('.searInput2').keydown(function(e){
		 if (e.keyCode == 13) {
			 e.preventDefault();
		 }
	});
    $( "#typeInput" ).autocomplete({
        source: typeArr
      });
    $( "#targetInput" ).autocomplete({
        source: targetArr
      });
    $( "#areaInput" ).autocomplete({
        source: areaArr
      });
    
    $( "#typeInput" ).autocomplete({
        open: function( event, ui ) 
        {
              //$("#test").val($("#typeDiv>.ui-menu-item").length);
              if($("#ui-id-1>li>div").length==1)
              {
//              alert($(".ui-menu-item>div").text());
				$("#typeInput").blur();
              	$("#typeInput").autocomplete("close");
              	
              	$("#typeInput").val($("#ui-id-1>li>div").text());
              	setTimeout(function() {
              		      // Do something after 2 seconds
              		$("#typeInput").focus();
              	}, 100);
              	
              }
        }
      });
    
    $( "#targetInput" ).autocomplete({
        open: function( event, ui ) 
        {
              //$("#test").val($("#typeDiv>.ui-menu-item").length);
              if($("#ui-id-2>li>div").length==1)
              {
//              alert($(".ui-menu-item>div").text());
				$("#targetInput").blur();
              	$("#targetInput").autocomplete("close");
              	
              	
              	$("#targetInput").val($("#ui-id-2>li>div").text());
            	setTimeout(function() {
        		      // Do something after 2 seconds
        			$("#targetInput").focus();
        		}, 100);
              }
        }
      });
    
    $( "#areaInput" ).autocomplete({
        open: function( event, ui ) 
        {
              //$("#test").val($("#typeDiv>.ui-menu-item").length);
              if($("#ui-id-3>li>div").length==1)
              {
//              alert($(".ui-menu-item>div").text());
				$("#areaInput").blur();
              	$("#areaInput").autocomplete("close");
              	
              	
              	$("#areaInput").val($("#ui-id-3>li>div").text());
              	setTimeout(function() {
      		      // Do something after 2 seconds
              		$("#areaInput").focus();
      			}, 100);
              }
        }
      });

});
function autoListShow()
{
	$('#autoList').toggle();
}
</script>
</head>
<body>
	<div id="searchSupport">
		<form action="./searchSupport.do" method="post" id="searchFrom">
		<div class="ui-widget" id="typeDiv">
<!--   			<label for="tags">Tags:</label> -->
  			<input type="text" class="searInput2" id="typeInput" name="type" placeholder="분야"/>
<!--   			 <input type="text" readonly="readonly" id="test"> -->
		</div>
		<div class="ui-widget" id="targetDiv">
<!--   			<label for="tags">Tags:</label> -->
  			<input type="text" class="searInput2" id="targetInput" name="target" placeholder="대상"/>
<!--   			 <input type="text" readonly="readonly" id="test"> -->
		</div>
		<div class="ui-widget" id="areaDiv">
<!--   			<label for="tags">Tags:</label> -->
  			<input type="text" class="searInput2" id="areaInput" name="area" placeholder="지역"/>
<!--   			 <input type="text" readonly="readonly" id="test"> -->
		</div>
		
			
			
			
<!-- 			<select name="type" id="type" hidden="hidden"> -->
<!-- 				<option value="창업교육">창업교육</option> -->
<!-- 				<option value="정책자금">정책자금</option> -->
<!-- 				<option value="판로·해외진출">판로·해외진출</option> -->
<!-- 				<option value="멘토링·컨설팅">멘토링·컨설팅</option> -->
<!-- 				<option value="사업화">사업화</option> -->
<!-- 				<option value="시설·공간">시설·공간</option> -->
<!-- 				<option value="R&D">R&D</option> -->
<!-- 				<option value="행사·네트워크">행사·네트워크</option> -->
<!-- 				
<!-- 				<option value="인력">인력</option> -->
<!-- 				<option value="연구">연구</option> -->
<!-- 				<option value="인증">인증</option> -->
<!-- 				<option value="회계">회계</option> -->
<!-- 				 -->
<!-- 				<option value="기타">기타</option> -->
<!-- 			</select> -->
<!-- 			<select name="target" id="target" hidden="hidden"> -->
<!-- 				<option value="일반기업">일반기업</option> -->
<!-- <!-- 				<option value="중소기업">중소기업</option> --> 
<!-- <!-- 				<option value="소상공인">소상공인</option> --> 
<!-- 				<option value="1인 창조기업">1인 창조기업</option> -->
<!-- <!-- 				<option value="창업기업">창업기업</option> --> 
<!-- <!-- 				<option value="예비창업자">예비창업자</option> --> 
<!-- 				<option value="대학생">대학생</option> -->
<!-- 				<option value="일반인">일반인</option> -->
<!-- 				<option value="대학">대학</option> -->
<!-- 				<option value="연구기관">연구기관</option> -->
<!-- 				<option value="청소년">청소년</option> -->
<!-- 				<option value="기타">기타</option> -->
<!-- 			</select> -->
<!-- 			<select name="area" id="area" hidden="hidden"> -->
<!-- 				<option value="서울특별시">서울특별시</option> -->
<!-- 				<option value="인천광역시">인천광역시</option> -->
<!-- 				<option value="경기도">경기도</option> -->
<!-- 				<option value="전라남도">전라남도</option> -->
<!-- 				<option value="전라북도">전라북도</option> -->
<!-- 				<option value="광주광역시">광주광역시</option> -->
<!-- 				<option value="대전광역시">대전광역시</option> -->
<!-- 				<option value="대구광역시">대구광역시</option> -->
<!-- 				<option value="부산광역시">부산광역시</option> -->
<!-- 				<option value="충청남도">충청남도</option> -->
<!-- 				<option value="충청북도">충청북도</option> -->
<!-- 			</select> -->
			<input type="submit" value="검색">
		</form>
<!-- 		<button onclick="searchCancel()">취소</button> -->
	</div><!-- searchSupport 끝 -->
	<button onclick="autoListShow()">자동완성 항목 보기</button>
	<div id="autoList" hidden="hidden">
		자동완성 항목들
		<table border="1">
			<thead>
				<tr>
					<th>분야</th><th>대상</th><th>지역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>창업교육</td><td>일반기업</td><td>서울특별시</td>
				</tr>
				<tr>
					<td>정책자금</td><td>1인 창조기업</td><td>인천광역시</td>
				</tr>
				<tr>
					<td>판로·해외진출</td><td>대학생</td><td>경기도</td>
				</tr>
				<tr>
					<td>멘토링·컨설팅</td><td>일반인</td><td>전라남도</td>
				</tr>
				<tr>
					<td>사업화</td><td>대학</td><td>전라북도</td>
				</tr>
				<tr>
					<td>시설·공간</td><td>연구기관</td><td>광주광역시</td>
				</tr>
				<tr>
					<td>R&D</td><td>청소년</td><td>대전광역시</td>
				</tr>
				<tr>
					<td>행사·네트워크</td><td>없음</td><td>대구광역시</td>
				</tr>
				<tr>
					<td>없음</td><td>없음</td><td>부산광역시</td>
				</tr>
				<tr>
					<td>없음</td><td>없음</td><td>충청남도</td>
				</tr>
				<tr>
					<td>없음</td><td>없음</td><td>충청북도</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>