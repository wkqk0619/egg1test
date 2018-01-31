<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>화면을 pdf 로 배포하기</title>
<!-- <script type="text/javascript" src="js/jspdf.js"></script> -->
<link rel="stylesheet" type="text/css" href="css/pdftest.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script type="text/javascript" src="js/jquery-3.2.1.js"></script> -->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
 <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">

$(function(){
	 var clone, before, parent;
	  $('.connected').each(function () {
	       $(this).sortable({
	           connectWith: '.sortable',
	           helper: "clone",
	           start: function (event, ui) {
	               $(ui.item).show();
	               clone=$(ui.item).clone();
	               before = $(ui.item).prev();
	               parent = $(ui.item).parent();

	           },
	           receive: function (event, ui) {//only when dropped from one to another!
	               if (before.length) before.after(clone);
	               else parent.prepend(clone);
	           }
	       }).disableSelection();
	  });
	 
	    $("#ssortable").sortable();
	    $("#ssortable").disableSelection();	 
	    $(".ui-icon-arrowthick-2-n-s").on('click',function(){
	    	alert("클릭");
	    	$(this).prop("disabled",true);
	    	var doc = $(this).parent();
	    	//alert(doc.children().last().text());
	    	
	    	//var ahtext = doc;​
	    	//doc.children("span").siblings().remove();
	    	//var spanTag = $("<span class='ui-icon ui-icon-arrowthick-2-n-s'></span>");
	    	var inputTag = $("<input class='reInfo' type='text'/>");
	    	var rebutton = $("<button class='repBtn'>수정</button>");
	    	//doc.append(spanTag);
	    	doc.append(inputTag);
	    	doc.append(rebutton);
	    	//doc.children().last().prev().val(ahtext);
	    	doc.children().last().prev().val(doc.children(".InfoSpan").text());
	    	doc.children(".InfoSpan").text("");
	    	   $(".repBtn").click(function(){
	    			//alert(doc.children().last().prev().val());
	    			var newVal = doc.children(".reInfo").val();
	    			doc.find("input, .repBtn").remove();
	    			//doc.append(newVal);
	    			doc.children(".InfoSpan").text(newVal);
	    			doc.children(".ui-icon-arrowthick-2-n-s").prop("disabled",false);
	    		});
	    });
	       
	$("#pdte").submit(function() {
		
		var s="<div style='font-family: MalgunGothic;'>";
		
		for (var i = 0; i < $(".question").length; i++) 
		{
			s += $(".question").eq(i).text();
			s += $(".answer").eq(i).val();
		}

		s += $('#tabletest').html();
		s+="</div>";
		$("#pdarea").val(s);
// 		$("#pdarea").val($("#testPDF").html());
// 		alert($("#pdarea").val());
// 		return false;
	});
	
});

</script>
<style type="text/css">
  #sortable, #ssortable
  { list-style-type: none; margin: 0; padding: 0; width: 100%; float: left; }
  #sortable li
  { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
  #sortable li span
  { position: absolute; margin-left: -1.3em; }
  #ssortable li
  { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
  #ssortable li span
  { position: absolute; margin-left: -1.3em; }
  .continer{
  	width : 20%;
  	position: fixed;
  }  
  #tabletest
  {
  	position: absolute;
  	left: 21%;
  }
  .ee{
  	margin-left: 20px;
  	width: 70%;
  	height: 400px;
  	float: left;
  }
  #ssortable{height: 200px;}
  .ui-state-default div{
  	display: none;
  }
  #scv{
  display: none;
  }
  #masterDiv
  {
  	position: relative;
  }
  
</style>
</head>
<body>
<div id="masterDiv">
<form action="./pdfTest.do" method="post" id="pdte">
<input id="pdfName" type="text" name="fName"> : PDF파일명 작성 <input type="submit" value="pdf다운로드"/>

<div style="font-family: MalgunGothic;">
	<div id="testPDF">
		<div class="continer ert">
			<div id="sortable" class="connected list1">
			<c:forEach begin="0" end="${fn:length(question)-1}" step="1" varStatus="status" >
<%-- 				<span class="question">${question[status.index]} : </span><input class="answer" type="text" value="${answer[status.index]}"/><br/> --%>
				<div class="ui-state-default"><button class="ui-icon ui-icon-arrowthick-2-n-s" type="button"></button>${question[status.index]}:<span class="InfoSpan">${answer[status.index]}</span></div>
			</c:forEach>
			</div><!-- sortable 끝 -->
		</div><!-- continer ert 끝 -->
<div id="tabletest">			
<table class="tg" id="tage">
 <tbody>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">
    <pre>전라남도 
    1인 창조기업 모집</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">사업구분</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">1인창조기업(<div class="connected sortable list2"></div> 업종)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">사업명</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="4"> </td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="4">대표자</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">성 명 </td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">주민등록번호</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"> </td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="3">연락처</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">자택전화</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">휴대폰</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">email</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">자택주소</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="4">공동사업자</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">성명</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">주   민   번   호  </td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">연락처</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">담당분야</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="7">기업현황</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">기업명</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">주 생상품</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">법인등록번호</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">사업자 등록번호</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">창업일</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">전년도 매출액</td>
    <td class="tg-lqy6" style="font-family: MalgunGothic;"><div class="connected sortable list2"></div> 백만원</td>
    <td class="tg-baqh" style="font-family: MalgunGothic;">전년도 수출액</td>
    <td class="tg-lqy6" colspan="2" style="font-family: MalgunGothic;"><div class="connected sortable list2"></div> 백만불</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">전화번호</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">팩스</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">종업원수</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">사무직 명 기술직 명 기능직등 명 합계 명</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">소재지</td>
    <td class="tg-lqy6" colspan="4" style="font-family: MalgunGothic;">(우)[ <div class="connected sortable list2"></div> ]</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="4">준비사항</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">지적재산권</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">□ 유(특허/실용신안/상표/디자인)   □ 무</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="5" style="font-family: MalgunGothic;">창업아이템 관련 수상실적</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">대회명</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">수상내역</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">수상일자</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">시행기관</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">특기사항</td>
    <td class="tg-baqh" colspan="5" style="font-family: MalgunGothic;">(창업 후 인.허가, 인증, 홍보 등 관련내용)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">이전 비스니스 센터</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">센터명</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">입주기간</td>
    <td class="tg-baqh connected sortable list2" colspan="4" style="font-family: MalgunGothic;">년 월 일 ∼ 년 월 일 (총 개월)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">입주희망기간</td>
    <td class="tg-baqh connected sortable list2" colspan="4" style="font-family: MalgunGothic;">년 월 일 ∼ 년 월 일 (총 개월)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6" rowspan="5">
    	<pre>* 비즈니스센터에 입주한 1인 창조기업은 타 비즈니스센터에 신청하여 입주할 수 있으나,
    	         전체 비즈니스센터에 입주한 기간이 연장기간을 포함하여 최대 24개월을 초과할 수 없다.
    	         
    	         『1인 창조기업 비즈니스센터』에 입주하고자 본 신청서를 제출하며 작성한 신청서 내용에
    	         허위 사실이 있을 경우 선정 취소 및 손해배상 등의 불이익 처분에 동의합니다.
    	         
    	         20 년 월 일
    	         (대표) 신청인 : (인)
    	         
    	         첨부 : 1. 사업계획서 1부.
    	           : 2. 개인정보 수집 동의서 1부.        
    	           : 3. 대표자이력서 1부.</pre></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">
    <pre>[첨부1] 사업계획서1. 
    	창업 동기 및 추진사항</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">창업 동기</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">◈ 창업동기 및 창업목표를 기술</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">입주 중 추진사항</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">◈ 입주 중 사업추진 내용</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">졸업 후 계획</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">◈ 졸업 후 향후 계획</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">2. 사업화 및 추진계획**</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">제품의 개요</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">
    <pre>◈ 기술개발의 필요성, 창업과제의 용도, 사양, 
    	주기능, 성능 등 제품에 대한 설명</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">추진현황 (해당 사항의□난에 √ 표시)</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">
    <pre>□ 기술개발 구상중   □ 기술개발중   □ 기술도입
    	 □ 산업재산권(특허, 실용신안) 보유 또는 출원중</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">국내외 시장규모·전망</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">
    <pre>◈ 현재 및 향후 3년간의 시장규모, 시장전망, 국내외 시장동향, 
    	    시장진입 조건 등 시장구조 및 특성, 주요 수요처 등</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">파급효과</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">
    <pre>◈ 사업화 성공에 따른 고용인원 창출 등 
    	    고용창출을 많이 필요로하는 과제 우대</pre></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="6" rowspan="5"></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">[첨부2] 개인정보 수집 동의서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">개인(신용)정보 수집‧이용‧제공 동의서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6" rowspan="4">
    <pre>전라남도 1인 창조기업 비즈니스센터는 「1인 창조기업 비즈니스센터」 사업과 관련하여 「개인정보보호법」
    제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항제1호 및「신용정보의 이용 및 보호에 관한 법률」
    제32조제1항, 제33조, 제34조에 따라 아래와 같이 개인(신용)정보의 수집·이용 및 제3자 제공에 관하여 귀하의 동의를 얻고자합니다.</pre></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6" rowspan="7">
    <pre>1. 수집.이용에 관한 사항
    
    □ 수집·이용 목적
    	○ 1인 창조기업 비즈니스센터 사업과 관련한 선정평가 및 사업 운영·관리를 목적으로 합니다.
    	
    □ 수집·이용할 항목
    	○ 필수항목
    		- 개인식별정보(성명, 주민등록번호, 연락처, 주소, E-mail)
    	
    □ 보유.이용기간
    	○ 위 개인(신용)정보는 수집.이용에 관한 동의일로부터 보유목적 달성 
    		시 또는 정보주체가 개인정보 삭제를요청할 경우 지체 없이 파기합니다.
    		
    	○ 단, 협약 종료일 후에는 향후 정부지원사업 신청 시의 이력관리만을 위하여 보유.
    		이용되며 기간은 3년입니다. (공공기록물 관리에 관한 법률 시행령)
    	
    □ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
    	○ 위 개인(신용)정보 중 필수항목의 수집.이용에 관한 동의는 본사업의 수행을 위해 필수적이므로 이에 동의
    		하셔야 이후 절차를 진행할 수 있습니다. 단, 동의하지 않으시는 경우 본 지원사업에 신청이 불가합니다.
    		
    2. 제3자 제공에 관한 사항
    
    □ 제공받는 자
    	○ 창업진흥원 : 1인 창조기업 비즈니스센터 사업 운영기관 및 전담기관
    	
    □ 제공받는 자의 이용 목적
    	○ 1인 창조기업 비즈니스센터 사업 관련 자료 활용, 정책자료 활용
    	
    □ 제공할 개인(신용)정보의 항목
    	○ 수집·이용에 동의한 정보 중 위탁업무 목적달성을 위해 필요한 정보에 한함
    	
    □ 제공받은 자의 개인(신용) 정보 보유.이용 기간
    	○ 위 개인(신용)정보는 제공된 날부터 3년간 보유·이용되며 보유목적 달성 시 또는 정보주체가 개인정보 삭제를 요청할 경우 지체 없이 파기합니다.
    	
    □ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
    	○ 위 개인(신용)정보의 제공 동의를 거부할 권리가 있으며, 동의를 거부 시 본 지원사업에 신청이 불가합니다.</pre></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">□ 위와 같이 귀하의 개인(신용)정보를 제3자에게 제공하는 것에 동의합니까?</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">고유식별정보</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">주민등록번호 ( □동의함  □동의하지 않음 )</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">개인정보</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">필수항목 : 개인식별정보 ( □동의함 □동의하지 않음 )</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="6" rowspan="2" style="font-family: MalgunGothic;">20 년 월 일 동의자 성명 :              서명 또는 인</td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">[첨부3] 대표자 이력서</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="6" style="font-family: MalgunGothic;">이 력 서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">□ 개인 신상</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">성명</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">한글</td>
    <td class="tg-lqy6 connected sortable list2">(인)</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">생년월일</td>
    <td class="tg-baqh"><div class="connected sortable list2"></div> (만 세)</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="4">사 진6개월 이내에 촬영한탈모 상반신 사진</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">한자</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">주민번호</td>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-baqh" style="font-family: MalgunGothic;">주 소</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-baqh" style="font-family: MalgunGothic;">현 소 속</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">기관 및 부서 : <div class=" connected sortable list2"></div>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 직위 : <div class="connected sortable list2"></div> </td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">연락처</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">자택</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">휴대전화</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">E-mail</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">□ 학력.경력</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">구 분</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">내 용</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="6">학력</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">년월</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="3">학교명</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">비고</td>
  </tr>
  <tr>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">,</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3">고등학교(졸업,졸업예정)</td>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">-</td>
  </tr>
  <tr>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">,</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3">전문대학(졸업,졸업예정)</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" rowspan="2"></td>
  </tr>
  <tr>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">,</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3">대학교 대학(입학, 편입)</td>
  </tr>
  <tr>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">,</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3">대학교 대학(졸업,졸업예정)</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" rowspan="2"></td>
  </tr>
  <tr>
    <td class="tg-baqh connected sortable list2" style="font-family: MalgunGothic;">,</td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="3">대학교 대학원(입학)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="5">주요경력</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">근무기간</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">근무처</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">직위</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" rowspan="2">담당업무</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">부터</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">까지</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">...</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">□ 기술.자격</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">구분</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="4">내용</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2" rowspan="4">자격증</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">자격증명</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">취득일자</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">시행기관</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="6">□ 수상경력</td>
  </tr>
  <tr>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">수상일자</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">내용(훈격)</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;" colspan="2">수여기관</td>
    <td class="tg-yw4l" style="font-family: MalgunGothic;">수상경위</td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  <tr>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;" colspan="2"></td>
    <td class="tg-yw4l connected sortable list2" style="font-family: MalgunGothic;"></td>
  </tr>
  </tbody>
</table>
</div>
</div>
</div> <!-- table test 끝 -->



<textarea rows="100" cols="100" id="pdarea" name="pdfarea" hidden="hidden"></textarea>
</form>
</div><!-- masterDiv 끝 -->
</body>
</html>