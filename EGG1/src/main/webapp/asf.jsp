﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>      
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Sortable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <style>
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
  .tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-lqy6{text-align:right;vertical-align:top}
.tg .tg-yw4l{vertical-align:top}
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
  <script>
  $( function() {
	  /*
	  $("#as").submit(function() {
		  var sHTML = $('.summernote').summernote('code');
		  $("#ww").val(sHTML);
	  });
	  
	  
	  $('.summernote').summernote({
	        placeholder: 'Hello bootstrap 4',
	        tabsize: 2,
	        height: 400
	    });
	  */
   // $("#sortable").sortable({connectWith: "#ssortable"});
   /*
   $("#sortable").each(function() {
	   var clone, before,parent;
	   
	   $(this).sortable({
	        connectWith: "#ssortable",
	        helper: "clone",
	        start: function (event, ui) {
	            $(ui.item).show();
	            clone = $(ui.item).clone();
	            before = $(ui.item).prev();
	            parent = $(ui.item).parent();
	        },
	        stop: function (event, ui) {
	            if (before.length)
	                before.after(clone);
	            else
	                parent.prepend(clone);
	        }
	    }).disableSelection();
   });
   */
   
   var clone, before, parent
   /*
   $('.sortable').each(function () {
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
   */
   
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
      
       $(".ui-state-default").click(function() {
    	   $("#scv").show();
    	   $("#qwe").keypress(function(key) {
    		   if(key.keyCode==13)
    		   {
    			  $("#inp").val($("#qwe").val());
    			  $("#qwe").val("");
    		   }
    	   });
       });
   });
   
   

    //$("#sortable").disableSelection();
    $("#ssortable").sortable();
    $("#ssortable").disableSelection();
  } );
  
  function insQ(){
	  var div=$("<div class='ui-state-default'>");
	  var span=$("<span class='ui-icon ui-icon-arrowthick-2-n-s'>");
	  div.append(span);
	  div.text("item 추가");
	  $("#sortable").append(div);
  }
  </script>
</head>
<body>
<div class="continer ert">
 	<div id="sortable" class="connected list1">
  			<div class="ui-state-default">
  				<span class="ui-icon ui-icon-arrowthick-2-n-s">
  				</span>Item 1
  				<div class="chr">
  					<input type="text" name="adsf" id="inp">
  				</div>
  			</div>
  			
  			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>유영건</div>
  			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</div>
  			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</div>
  			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</div>
  			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</div>
 			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</div>
 			<div class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><input value="가가가"/></div>
	</div>
</div>
<form action="tes.jsp" method="post" id="as">
<!-- <div class="ee bur summernote" contenteditable="true" > -->
항목을 옮겨

	<div class="connected sortable list2">
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s" ></span>Item 1</div> -->
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</div> -->
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</div> -->
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</div> -->
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</div> -->
<!--   			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</div> -->
<!--  			<div class="ui-state-default rbn"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</div> -->
	</div>
	
	<table class="tg">
  <tr>
    <th class="tg-yw4l" colspan="6">전라남도 1인 창조기업 모집</th>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">사업구분</td>
    <td class="tg-yw4l" colspan="4">1인창조기업(        업종)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">사업명</td>
    <td class="tg-yw4l" colspan="4">유영건</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="4">대표자</td>
    <td class="tg-yw4l">성명 </td>
    <td class="tg-yw4l connected sortable list2"></td>
    <td class="tg-yw4l">주민등록번호</td>
    <td class="tg-yw4l" colspan="2">*앞자리만 기재</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="3">연락처</td>
    <td class="tg-yw4l">자택전화</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2">휴대폰</td>
  </tr>
  <tr>
    <td class="tg-yw4l">email</td>
    <td class="tg-yw4l" colspan="3"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">자택주소</td>
    <td class="tg-yw4l" colspan="3"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="4">공동사업자</td>
    <td class="tg-yw4l">성명</td>
    <td class="tg-yw4l">주   민   번   호  </td>
    <td class="tg-yw4l" colspan="2">연락처</td>
    <td class="tg-yw4l">담당분야</td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l">*앞자리만 기재</td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="7">기업현황</td>
    <td class="tg-yw4l">기업명</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2">주 생상품</td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">법인등록번호</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2">사업자 등록번호</td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">창업일</td>
    <td class="tg-yw4l" colspan="4">년                        월                          일</td>
  </tr>
  <tr>
    <td class="tg-yw4l">전년도 매출액</td>
    <td class="tg-lqy6">백만원</td>
    <td class="tg-baqh">전년도 수출액</td>
    <td class="tg-lqy6" colspan="2">백만불</td>
  </tr>
  <tr>
    <td class="tg-yw4l">전화번호</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l">팩스</td>
    <td class="tg-yw4l" colspan="2"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">종업원수</td>
    <td class="tg-yw4l" colspan="4">사무직 명 기술직 명 기능직등 명 합계 명</td>
  </tr>
  <tr>
    <td class="tg-yw4l">소재지</td>
    <td class="tg-lqy6" colspan="4">(우)[ - ]</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="4">준비사항</td>
    <td class="tg-yw4l">지적재산권</td>
    <td class="tg-yw4l" colspan="4">□ 유(특허/실용신안/상표/디자인)   □ 무</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="5">창업아이템 관련 수상실적</td>
  </tr>
  <tr>
    <td class="tg-yw4l">대회명</td>
    <td class="tg-yw4l">수상내역</td>
    <td class="tg-yw4l" colspan="2">수상일자</td>
    <td class="tg-yw4l">시행기관</td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">특기사항</td>
    <td class="tg-baqh" colspan="5">(창업 후 인.허가, 인증, 홍보 등 관련내용)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="2">이전 비스니스 센터</td>
    <td class="tg-yw4l">센터명</td>
    <td class="tg-yw4l" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">입주기간</td>
    <td class="tg-baqh" colspan="4">년 월 일 ∼ 년 월 일 (총 개월)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">입주희망기간</td>
    <td class="tg-baqh" colspan="4">년 월 일 ∼ 년 월 일 (총 개월)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5">* 비즈니스센터에 입주한 1인 창조기업은 타 비즈니스센터에 신청하여 입주할 수 있으나,<br>전체 비즈니스센터에 입주한 기간이 연장기간을 포함하여 최대 24개월을 초과할 수 없다.<br>『1인 창조기업 비즈니스센터』에 입주하고자 본 신청서를 제출하며 작성한 신청서 내용에<br>허위 사실이 있을 경우 선정 취소 및 손해배상 등의 불이익 처분에 동의합니다.<br>20 년 월 일(대표) 신청인 : (인)<br>첨부 : 1. 사업계획서 1부.<br>        : 2. 개인정보 수집 동의서 1부.<br>        : 3. 대표자이력서 1부.</td>
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
    <td class="tg-yw4l" colspan="6">[첨부1] 사업계획서<br>1. 창업 동기 및 추진사항</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">창업 동기</td>
    <td class="tg-yw4l" colspan="4">◈ 창업동기 및 창업목표를 기술</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="2">입주 중 추진사항</td>
    <td class="tg-yw4l" colspan="4">◈ 입주 중 사업추진 내용</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="2">졸업 후 계획</td>
    <td class="tg-yw4l" colspan="4">◈ 졸업 후 향후 계획</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="6">2. 사업화 및 추진계획**<br></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">제품의 개요</td>
    <td class="tg-yw4l" colspan="4">◈ 기술개발의 필요성, 창업과제의 용도, 사양, 주기능, 성능 등 제품에 대한 설명</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="2">추진현황 (해당 사항의□난에 √ 표시)</td>
    <td class="tg-yw4l" colspan="4">□ 기술개발 구상중   □ 기술개발중   □ 기술도입<br>□ 산업재산권(특허, 실용신안) 보유 또는 출원중</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">국내외 시장규모·전망</td>
    <td class="tg-yw4l" colspan="4">◈ 현재 및 향후 3년간의 시장규모, 시장전망, 국내외 시장동향, 시장진입 조건 등 시장구조 및 특성, 주요 수요처 등</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="2">파급효과</td>
    <td class="tg-yw4l" colspan="4">◈ 사업화 성공에 따른 고용인원 창출 등 고용창출을 많이 필요로하는 과제 우대</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="5"></td>
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
    <td class="tg-yw4l" colspan="6">[첨부2] 개인정보 수집 동의서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">개인(신용)정보 수집‧이용‧제공 동의서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="4">전라남도 1인 창조기업 비즈니스센터는 「1인 창조기업 비즈니스센터」 사업과 관련하여 「개인정보보호법」제15조제<br>1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항제1호 및「신용정보의 이용 및 보호에 관한 법률」제32조제<br>1항, 제33조, 제34조에 따라 아래와 같이 개인(신용)정보의 수집·이용 및 제3자 제공에 관하여 귀하의 동의를 얻고자합니다.</td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6" rowspan="7">1. 수집.이용에 관한 사항<br><br>□ 수집·이용 목적<br>○ 1인 창조기업 비즈니스센터 사업과 관련한 선정평가 및 사업 운영·관리를 목적으로 합니다.<br><br><br>□ 수집·이용할 항목<br>○ 필수항목<br>- 개인식별정보(성명, 주민등록번호, 연락처, 주소, E-mail)<br><br>□ 보유.이용기간<br>○ 위 개인(신용)정보는 수집.이용에 관한 동의일로부터 보유목적 달성 시 또는 정보주체가 개인정보 삭제를요청할 경우 지체 없이 파기합니다.<br>○ 단, 협약 종료일 후에는 향후 정부지원사업 신청 시의 이력관리만을 위하여 보유.이용되며 기간은 3년입니다. (공공기록물 관리에 관한 법률 시행령)<br><br>□ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익<br><br>○ 위 개인(신용)정보 중 필수항목의 수집.이용에 관한 동의는 본사업의 수행을 위해 필수적이므로 이에 동의하셔야 이후 절차를 진행할 수 있습니다. <br>단, 동의하지 않으시는 경우 본 지원사업에 신청이 불가합니다.<br><br><br>2. 제3자 제공에 관한 사항<br><br>□ 제공받는 자<br>○ 창업진흥원 : 1인 창조기업 비즈니스센터 사업 운영기관 및 전담기관<br><br>□ 제공받는 자의 이용 목적<br>○ 1인 창조기업 비즈니스센터 사업 관련 자료 활용, 정책자료 활용<br><br>□ 제공할 개인(신용)정보의 항목<br>○ 수집·이용에 동의한 정보 중 위탁업무 목적달성을 위해 필요한 정보에 한함<br><br>□ 제공받은 자의 개인(신용) 정보 보유.이용 기간<br>○ 위 개인(신용)정보는 제공된 날부터 3년간 보유·이용되며 보유목적 달성 시 또는 정보주체가 개인정보 삭제를 요청할 경우 지체 없이 파기합니다.<br><br>□ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익<br>○ 위 개인(신용)정보의 제공 동의를 거부할 권리가 있으며, 동의를 거부 시 본 지원사업에 신청이 불가합니다.</td>
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
    <td class="tg-yw4l" colspan="6">□ 위와 같이 귀하의 개인(신용)정보를 제3자에게 제공하는 것에 동의합니까?</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">고유식별정보</td>
    <td class="tg-yw4l" colspan="4">주민등록번호 ( □동의함 □동의하지 않음 )</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">개인정보</td>
    <td class="tg-yw4l" colspan="4">필수항목 : 개인식별정보 ( □동의함 □동의하지 않음 )</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="6" rowspan="2">20 년 월 일<br>동의자 성명 :              서명 또는 인</td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">[첨부3] 대표자 이력서</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="6">이 력 서</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">□ 개인 신상</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="2">성명</td>
    <td class="tg-yw4l">한글</td>
    <td class="tg-lqy6">(인)</td>
    <td class="tg-yw4l">생년월일</td>
    <td class="tg-baqh">.     .   . (만 세)</td>
    <td class="tg-yw4l" rowspan="4">사 진<br>6개월 이내에 촬영한<br>탈모 상반신 사진</td>
  </tr>
  <tr>
    <td class="tg-yw4l">한자</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l">주민번호</td>
    <td class="tg-baqh">-</td>
  </tr>
  <tr>
    <td class="tg-baqh">주 소</td>
    <td class="tg-yw4l" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-baqh">현 소 속</td>
    <td class="tg-yw4l" colspan="4">기관 및 부서 :                         직위 :</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="2">연락처</td>
    <td class="tg-yw4l" colspan="2">자택</td>
    <td class="tg-yw4l" colspan="2">휴대전화</td>
    <td class="tg-yw4l">E-mail</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-baqh">@</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">□ 학력.경력</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">구 분</td>
    <td class="tg-yw4l" colspan="4">내 용</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="6">학력</td>
    <td class="tg-yw4l">년월</td>
    <td class="tg-yw4l" colspan="3">학교명</td>
    <td class="tg-yw4l">비고</td>
  </tr>
  <tr>
    <td class="tg-baqh">,</td>
    <td class="tg-yw4l" colspan="3">고등학교(졸업,졸업예정)</td>
    <td class="tg-baqh">-</td>
  </tr>
  <tr>
    <td class="tg-baqh">,</td>
    <td class="tg-yw4l" colspan="3">전문대학(졸업,졸업예정)</td>
    <td class="tg-yw4l" rowspan="2"></td>
  </tr>
  <tr>
    <td class="tg-baqh">,</td>
    <td class="tg-yw4l" colspan="3">대학교 대학(입학, 편입)</td>
  </tr>
  <tr>
    <td class="tg-baqh">,</td>
    <td class="tg-yw4l" colspan="3">대학교 대학(졸업,졸업예정)</td>
    <td class="tg-yw4l" rowspan="2"></td>
  </tr>
  <tr>
    <td class="tg-baqh">,</td>
    <td class="tg-yw4l" colspan="3">대학교 대학원(입학)</td>
  </tr>
  <tr>
    <td class="tg-yw4l" rowspan="5">주요경력</td>
    <td class="tg-yw4l" colspan="2">근무기간</td>
    <td class="tg-yw4l" rowspan="2">근무처</td>
    <td class="tg-yw4l" rowspan="2">직위</td>
    <td class="tg-yw4l" rowspan="2">담당업무</td>
  </tr>
  <tr>
    <td class="tg-yw4l">부터</td>
    <td class="tg-yw4l">까지</td>
  </tr>
  <tr>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l">...</td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">□ 기술.자격</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">구분</td>
    <td class="tg-yw4l" colspan="4">내용</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2" rowspan="4">자격증</td>
    <td class="tg-yw4l">자격증명</td>
    <td class="tg-yw4l" colspan="2">취득일자</td>
    <td class="tg-yw4l">시행기관</td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="6">□ 수상경력</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">수상일자</td>
    <td class="tg-yw4l">내용(훈격)</td>
    <td class="tg-yw4l" colspan="2">수여기관</td>
    <td class="tg-yw4l">수상경위</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
</table>
<!-- </div> -->

    <textarea id="ww" rows="10" cols="60" name="tea" hidden="hidden"></textarea>
     <input type="submit" value="전송">
</form>
<button onclick="insQ()">항목을 추가해보자</button>
<div id="scv">
	<input type="text" id="qwe"/>
</div>
</body>
</html>