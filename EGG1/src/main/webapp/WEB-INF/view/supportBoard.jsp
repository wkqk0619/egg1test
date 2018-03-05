<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/theme.default.css">
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
<script type="text/javascript" src="js/paginathing.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#suportList").tablesorter();
		$('table tbody').paginathing({
			  // Limites your pagination number
			  // false or number
			  perPage: 5,
			  limitPagination: false,
			  // Pagination controls
			  prevNext: true,
			  firstLast: true,
			  prevText: '&laquo;',
			  nextText: '&raquo;',
			  firstText: 'First',
			  lastText: 'Last',
			  containerClass: 'pagination-container',
			  ulClass: 'pagination',
			  liClass: 'page',
			  activeClass: 'active',
			  disabledClass: 'disabled',
			});

	});
	function detalClo(){
		$("#alertpr").hide();
	    $("#detaliClo").hide();
	}
	
	function detail(val)
	{		
		//$("#alertpr").val("");
		$("#alertpr").empty();
		$.get("https://cors-anywhere.herokuapp.com/"+val
				, 
				function(data)
				{
				    var meta = $(data).filter('meta[property="og:description"]');
				    if($(meta).attr("content")!="")
			       	{		        
				   		$("#alertpr").val($(meta).attr("content"));
			      	}
				    else
				    {
				        $("#alertpr").val("본문이 삭제된 글");
				    }
				    $("#alertpr").show();
				    $("#detaliClo").show();
				}
		);
	}
	
	function addMySupport(sseq) 
	{
		parent.myS();
		$.ajax
		(
			{
				type: "POST",
				url: "./addMySupport.do",
				data:"sseq="+sseq,
				async:true,
				success:function(msg)
				{
					if(msg=="T")
					{
						alert("추가됨");
					}
					else if(msg=="O")
					{
						alert("이미 추가된상태라네");
					}
					else
					{
// 						alert("오류");
					}
				}
			}
		);
	}
	
	onload=function()
	{
		parent.ping();
	}
</script>
<style type="text/css">
	#alertpr
	{
		height: 500px;
		width: 500px;
		top : 50px;
		left: 500px;
		background-color: #d9dde2;
		position: fixed;
	}
	#detaliClo{
		top : 40px;
		left: 950px;
		position: fixed;
	}

</style>
</head>
<body>
<div>
	<table class="table table-striped table-bordered table-responsive tablesorter" id="suportList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>지원분야</th>
<!-- 			<th>지역</th> -->
<!-- 			<th>분류</th> -->
<!-- 			<th>URL</th> -->
<!-- 			<th>등록일</th> -->
<!-- 			<th>접수시작일</th> -->
				<th>접수종료일</th>
				<th>소속</th>
<!-- 			<th>대상</th> -->
<!-- 			<th>대상연령</th> -->
<!-- 			<th>대상업력</th> -->
				<th>마이지원등록</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.sseq}</td>
				<c:choose>
<%-- 					<c:when test="${ldto.role ne 'U'.charAt(0)}"> --%>
					<c:when test="${ldto.role ne 85}">
						<td><a href="./supportQus.do?sseq=${dto.sseq}">${dto.title}</a></td>
					</c:when>
					<c:otherwise>
						<td><span onclick="detail('${dto.url}')" >${dto.title}</span></td>
					</c:otherwise>
				</c:choose>
				<td>${dto.type}</td>
<%-- 				<td>${dto.area}</td> --%>
<%-- 				<td>${dto.biztitle}</td> --%>
<%--				<td>${dto.url}</td> --%>
<%-- 				<td>${dto.regdate}</td> --%>
<%-- 				<td>${dto.startdate}</td> --%>
				<td>${dto.enddate}</td>
				<td>${dto.sgroup}</td>
<%-- 				<td>${dto.target}</td> --%>
<%-- 				<td>${dto.targetage}</td> --%>
<%-- 				<td>${dto.targetcareer}</td> --%>
				<td><button onclick="addMySupport('${dto.sseq}')">추가</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>	
		<textarea id="alertpr"  hidden="hidden" rows="500" cols="400" readonly="readonly"></textarea>
		<button id="detaliClo" hidden="hidden" onclick="detalClo()">닫기</button>
	<c:choose>
		<c:when test="${ldto.role ne 'U'.charAt(0)}">
			<button onclick="location.href='./LoginMain.do'">메인으로</button>
		</c:when>
	</c:choose>
	
	
</body>
</html>