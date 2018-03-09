<%@page import="com.hk.lab5.dtos.AccountDto"%>
<%@page import="oracle.net.aso.s"%>
<%@page import="com.hk.lab5.dtos.NotionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html  onclick="parent.closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/introjs.css">
<link rel="stylesheet" href="css/introjs-rtl.css">
<script type="text/javascript" src="js/intro.js"></script>
<script type="text/javascript">

function ajaxNotionDetail(val){
	//alert(val);
	$.ajax({
		type: "POST",
		url: "./ajaxNotionDetail.do",
		data:"nseq="+val,
		async:true,
		success:function(msg){
			//alert("OK");
			outTable(msg);
		}
	});
}

function outTable(node){
	var nseq = node.dto.nseq;
// 	var id=node.dto.id;
	var title=node.dto.title;
	var content=node.dto.content;
	var regdate=node.dto.regdate;
	$(".notseq").val(nseq);
	$(".nottitle").val(title);
// 	$(".notid").val(id);
	$(".notcontent").val(content);
	$(".notregdate").val(regdate);
	$("#detailNot").toggle();
}

function delNot(){
	var val = $("#notseq").val();
	location.href="./delNot.do?nseq="+val;
}

function hideNot(){
	$("#newNot").hide();
}

function shownewNot(){
	$("#newNot").show();
}

function upNotForm(){
	$("#detailNot").hide();
	$("#UpNot").show();
}

function hideUpNot(){
	$("#UpNot").hide();
}

$( function() {
	
	var introi=introJs("#notionIntro");
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
</script>
</head>
<%
	AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
	if(ldto==null)
	{
		response.sendRedirect("./index.jsp");
	}
%>
<body>
<div id="notionIntro">
<div>
	<c:choose>
<%-- 		<c:when test="${ldto.role eq 'U'.charAt(0)}"> --%>
		<c:when test="${ldto.role eq 85}">
			<button id="guard">가이드</button>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${empty notList}">
			<h1>작성된 공지사항이 없습니다.</h1>
		</c:when>
		<c:otherwise>
			<h3>작성된 공지사항들 입니다.</h3>
			<table class="table table-bordered" data-step="1" data-intro="작성된 공지사항입니다.">
				<tr>
					<td>번호</td>
					<td>제목</td>
				</tr>
				<c:forEach items="${notList}" var="dto">
					<tr onclick="ajaxNotionDetail(${dto.nseq})">
						<td class="nseq">${dto.nseq}</td>
						<td class="title">${dto.title}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
<%-- 		<c:when test="${ldto.role ne 'U'.charAt(0)}"> --%>
		<c:when test="${ldto.role ne 85}">
			<button onclick="shownewNot()">공지 추가하기</button>
			<div id="newNot" hidden="hidden">
				<form action="./insertNot.do" method="post">
					<input type="text" name="title"/>
					<input type="hidden" name="id" value="${ldto.id}"/>
<!-- 					<input type="text" name="id"/> -->
					<textarea rows="10" cols="20" name="content"></textarea>
					<input type="submit" value="공지추가"/>
				</form>
				<button onclick="hideNot()">취소</button>
			</div>
		</c:when>
	</c:choose>
</div>

<c:choose>
<%-- 		<c:when test="${ldto.role ne 'U'.charAt(0)}"> --%>
		<c:when test="${ldto.role ne 85}">
			<button onclick="location.href='./LoginMain.do'">메인으로</button>
		</c:when>
</c:choose>

<div id="detailNot" hidden="hidden">
<!-- 		<input type="text" class="notseq" name="nseq" readonly="readonly"/> -->
<!-- 		<input class="upinf nottitle" type="text" name="title" readonly="readonly"/> -->
<!-- xxxx		<input type="text" class="notid" name="id" readonly="readonly"/> -->
<!-- 		<textarea class="upinf notcontent" rows="10" cols="20" readonly="readonly"></textarea> -->
<!-- 		<input type="text" class="notregdate" name="regdate" readonly="readonly"/> -->
		<table  class="table table-bordered">
			<tr>
				<th>번호</th><td><input type="text" class="notseq" name="nseq" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>제목</th><td><input class="upinf nottitle" type="text" name="title" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea class="upinf notcontent" rows="10" cols="20" readonly="readonly"></textarea></td>
			</tr>
			<tr>
				<th>작성일</th><td><input type="text" class="notregdate" name="regdate" readonly="readonly"/></td>
			</tr>
		</table>
		<c:choose>
<%-- 			<c:when test="${ldto.role ne 'U'.charAt(0)}"> --%>
			<c:when test="${ldto.role ne 85}">
				<button onclick="upNotForm()">수정할까??</button>
				<button onclick="delNot()">삭제</button>
			</c:when>
		</c:choose>
</div>
<div id="UpNot" hidden="hidden">
	<form action="./updateNot.do" method="post">
		<input type="text" class="notseq" name="nseq" readonly="readonly"/>
		<input class="upinf nottitle" type="text" name="title"/>
<!-- 		<input type="text" class="notid" name="id" readonly="readonly"/> -->
		<textarea class="upinf notcontent" rows="10" cols="20" name="content"></textarea>
		<input type="text" class="notregdate" name="regdate" readonly="readonly"/>
		<input type="submit" value="수정"/>
	</form><button onclick="hideUpNot()">취소</button>
</div>
</div><!-- notionIntro 끝 -->
</body>
</html>