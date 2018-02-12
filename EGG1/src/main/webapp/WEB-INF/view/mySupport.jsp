<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
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

	/* 
	이주당한 함수
	function searchSupport() 
	{
		$("#searchSupport").show();
	}
	
	function searchCancel() 
	{
		$("#searchSupport").hide();
	}
	 */
	
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
	
	// 이것도 프로젝트를 뭘 쓸지 선택하면 아예 지원작성 탭을 빠지게 하여야 할것같다.
	// 현재에선 이 마이지원페이지가 전환되는 방식이다
	// 즉 탭을 하나더 만들고 거기에 지원을 분리해야겠다.
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
						$tr.append($("<td><button onclick='parent.insertAnswer("+msg[i].pseq+","+sseq+")'>선택</button></td>"));
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

	<!-- 요놈은 남기고 부모창의 함수호출해서 지원사업탭으로 전환시키고 지원사업 iframe을 검색하는 jsp로 보내야할것같다 -->	
	<button onclick="parent.searchSupport()">지원사업탐색</button>
	
	
<!-- 	<button onclick="location.href='./LoginMain.do'">메인으로</button> -->
</div> <!-- mySupportIntro div 끝 -->
</body>
</html>