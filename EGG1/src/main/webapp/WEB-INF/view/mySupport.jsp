<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/introjs.css">
<link rel="stylesheet" href="css/introjs-rtl.css">
<script type="text/javascript" src="js/intro.js"></script>
<link rel="stylesheet" href="css/theme.default.css">
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<script type="text/javascript">
$( function() {
	$("#mysuportList").tablesorter();
	var introi=introJs("#mySupportIntro");
	$("#guard").click(function() {
		//가이드 시작버튼 비활성화
		$("#guard").prop("disabled",true);
		introi.start();
	});
	
	//가이드가 종료됬을 시
	introi.onexit(function() {
	  //alert("exit of introduction");
	  //가이드 시작버튼 활성화
		$("#guard").prop("disabled",false);
	});
});

	function searchSupport() 
	{
		$("#searchSupport").show();
	}
	
	function searchCancel() 
	{
		$("#searchSupport").hide();
	}
	
	function delMySupport(sseq)
	{
		location.href="./delMySupport.do?sseq="+sseq;
		event.stopPropagation();
	}
	
	function menu(sseq) 
	{
		$(".pmenu").remove();
		var $tr = $("<tr class='pmenu'>");
		$tr.append($("<td colspan="+"'14'"+"><button onclick='ajaxProject("+sseq+")'>입력하기</button></td>"));
// 		$tr.append($("<td><button onclick=''>불러오기</button></td>")); // 이건 나중에
		$("#S"+sseq).after($tr);
	}
	
	function ajaxProject(sseq) 
	{
		$.ajax
		(
			{
				type: "POST",
				url: "./ajaxProject.do",
				data:"id=${ldto.id}",
				async:true,
				success:function(msg)
				{
					$("#project").show();
					
					$(".ptr").remove();
					var $tr = $("<tr class='ptr'>")
					
					for (var i = 0; i < msg.length; i++)
					{
						$tr.append($("<td>"+msg[i].pseq+"</td>"));
						$tr.append($("<td>"+msg[i].name+"</td>"));
						$tr.append($("<td>"+msg[i].info+"</td>"));
						$tr.append($("<td><button onclick='location.href="+'"./insertAnswerForm.do?pseq='+msg[i].pseq+'&sseq='+sseq+'"'+"'>선택</button></td>"))
					}
					
					$("#projectTable").append($("<tr class='ptr'><th>프로젝트번호</th><th>이름</th><th>정보</th><th>선택</th></tr"));
					$("#projectTable").append($tr);
				}
			}
		);
	}
</script>
</head>
<body>
	<h1>마이지원목록</h1>
	<button id="guard">가이드</button>
	<div id="mySupportIntro">
	<table class="table table-striped table-bordered table-responsive tablesorter" id="mysuportList" data-step="1" data-intro="관심 지원사업">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>분야</th>
				<th>지역</th>
				<th>분류</th>
<!-- 			<th>URL</th> -->
<!-- 			<th>등록일</th> -->
				<th>접수시작일</th>
				<th>접수종료일</th>
				<th>소속</th>
				<th>대상</th>
				<th>대상연령</th>
				<th>대상업력</th>
				<th data-step="2" data-intro="관심지원사업 삭제">삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr id="S${dto.sseq}" onclick="menu('${dto.sseq}')">
				<td>${dto.sseq}</td>
				<td>${dto.title}</td>
				<td>${dto.type}</td>
				<td>${dto.area}</td>
				<td>${dto.biztitle}</td>
<%-- 				<td>${dto.url}</td> --%>
<%-- 				<td>${dto.regdate}</td> --%>
				<td>${dto.startdate}</td>
				<td>${dto.enddate}</td>
				<td>${dto.sgroup}</td>
				<td>${dto.target}</td>
				<td>${dto.targetage}</td>
				<td>${dto.targetcareer}</td>
				<td><button onclick="delMySupport('${dto.sseq}')">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="project" hidden="hidden">
		<table id="projectTable"></table>
		<%-- 
		<button onclick="ShowNewProj()">프로젝트 추가</button>
		<div id="NewProj" hidden="hidden">
			<form action="./insertProject.do" method="post">
				<input type="hidden" name="id" value="${ldto.id}"/><br/>
				프로젝트 이름 : <input type="text" name="name"/><br/>
				분류 : <input type="text" name="typeclass"/><br/>
				프로젝트 설명 : <input type="text" name="info"/><br/>
				<input type="submit" value="추가"/><br/>
			</form>
		</div>
		 --%>
	</div>
	<button onclick="searchSupport()" data-step="3" data-intro="지원사업 탐색기">지원사업탐색</button>
	<div id="searchSupport" hidden="hidden" data-step="4" data-intro="지원사업 탐색기">
		<form action="./searchSupport.do" method="post">
			<select name="type"  class="form-control">
				<option value="창업교육">창업</option>
				<option value="정책자금">자금</option>
				<option value="판로·해외진출">판로</option>
				<!-- 
				<option value="인력">인력</option>
				<option value="연구">연구</option>
				<option value="인증">인증</option>
				<option value="회계">회계</option>
				 -->
				<option value="기타">기타</option>
			</select>
			<select name="target"  class="form-control">
				<option value="일반기업">일반기업</option>
				<option value="중소기업">중소기업</option>
				<option value="소상공인">소상공인</option>
				<option value="1인기업">1인기업</option>
				<option value="창업기업">창업기업</option>
				<option value="예비창업자">예비창업자</option>
				<option value="기타">기타</option>
			</select>
			<select name="area"  class="form-control">
				<option value="서울특별시">서울특별시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="경기도">경기도</option>
				<option value="전라남도">전라남도</option>
				<option value="전라북도">전라북도</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="대구광역시">대구광역시</option>
			</select>
			<input type="submit" value="검색">
		</form>
		<button onclick="searchCancel()">취소</button>
	</div><!-- searchSupport 끝 -->
<!-- 	<button onclick="location.href='./LoginMain.do'">메인으로</button> -->
</div> <!-- mySupportIntro div 끝 -->
</body>
</html>