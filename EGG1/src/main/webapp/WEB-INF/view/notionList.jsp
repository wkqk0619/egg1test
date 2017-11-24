<%@page import="com.hk.lab5.dtos.NotionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 테스트</title>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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
	var id=node.dto.id;
	var title=node.dto.title;
	var content=node.dto.content;
	var regdate=node.dto.regdate;
	$(".notseq").val(nseq);
	$(".nottitle").val(title);
	$(".notid").val(id);
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
</script>
</head>
<body>
<div>
	<c:choose>
		<c:when test="${empty notList}">
			<h1>작성된 공지사항이 없습니다.</h1>
		</c:when>
		<c:otherwise>
			<h3>작성된 공지사항들 입니다.</h3>
			<table border="1">
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
	<button onclick="shownewNot()">공지 추가하기</button>
	<div id="newNot" hidden="hidden">
		<form action="./insertNot.do" method="post">
			<input type="text" name="title"/>
			<input type="text" name="id"/>
			<textarea rows="10" cols="20" name="content"></textarea>
			<input type="submit" value="공지추가"/>
		</form><button onclick="hideNot()">취소</button>
	</div>
</div>

<div id="detailNot" hidden="hidden">
		<input type="text" class="notseq" name="nseq" readonly="readonly"/>
		<input class="upinf nottitle" type="text" name="title" readonly="readonly"/>
		<input type="text" class="notid" name="id" readonly="readonly"/>
		<textarea class="upinf notcontent" rows="10" cols="20" readonly="readonly"></textarea>
		<input type="text" class="notregdate" name="regdate" readonly="readonly"/>
		<button onclick="upNotForm()">수정할까??</button>
		<button onclick="delNot()">삭제</button>
</div>
<div id="UpNot" hidden="hidden">
	<form action="./updateNot.do" method="post">
		<input type="text" class="notseq" name="nseq" readonly="readonly"/>
		<input class="upinf nottitle" type="text" name="title"/>
		<input type="text" class="notid" name="id" readonly="readonly"/>
		<textarea class="upinf notcontent" rows="10" cols="20" name="content"></textarea>
		<input type="text" class="notregdate" name="regdate" readonly="readonly"/>
		<input type="submit" value="수정"/>
	</form><button onclick="hideUpNot()">취소</button>
</div>
</body>
</html>