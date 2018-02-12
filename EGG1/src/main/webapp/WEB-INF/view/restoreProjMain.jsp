<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 복구신청</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">
	$(function(){
		$(".restoreBtn").click(function(){
			var doc = $(this).parents('tr');
			//alert(doc.children(".id, .projnum").text());
			var id = doc.children(".id").text();
			var projnum = doc.children(".projnum").text();
			var restorenum = doc.children(".restorenum").text();
			$.ajax({
				type: "POST",
				url: "./ajaxProjSelect.do",
				data:"pseq="+projnum+"&id="+id,
				async:true,
				success:function(mg){
					$.ajax({
						type: "POST",
						url: "./UpResProject.do",
						data:"pseq="+projnum+"&id="+id,
						async:true,
						success:function(msg){
							//alert(msg);
							if(msg!=0)
							{
								deleteRes(restorenum);
							}
						}
					});
				}
			});
		});
	});
	function deleteRes(restorenum)
	{
		location.href='./deleteRestoreList.do?restorenum='+restorenum;
	}
</script>
</head>
<body>
<h1>프로젝트 복구 신청 페이지</h1>
<c:choose>
	<c:when test="${empty ResList}">
		<div class="emptyList">
			<h1>작성된 복구 요청이 없습니다.</h1>
		</div>
	</c:when>
	<c:otherwise>
	<div class="NotemptyList">
		<h1>요청된 프로젝트 복구 목록입니다.</h1>
			<table class="table table-bordered" data-step="1" data-intro="작성된 공지사항입니다.">
				<tr>
					<th>번호</th>
					<th>사용자</th>
					<th>프로젝트 번호</th>
					<th>복구하기</th>
				</tr>
				<c:forEach items="${ResList}" var="dto">
					<tr>
						<td class="restorenum">${dto.restorenum}</td>
						<td class="id">${dto.id}</td>
						<td class="projnum">${dto.projnum}</td>
						<td><button type="button" class="restoreBtn">복구</button></td>
					</tr>
				</c:forEach>
			</table>
	</div>
	</c:otherwise>
</c:choose>
</body>
</html>