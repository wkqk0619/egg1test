<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 테스트</title>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function ShowNewProj(){
		$("#NewProj").toggle();
	}
	
	function showupProj(){
		$("#upProj").toggle();
	}
	
	function ajaxProjDetail(val){
		//alert(val);
		$.ajax({
			type: "POST",
			url: "./ajaxProjDetail.do",
			data:"pseq="+val,
			async:true,
			success:function(msg){
				//alert("OK");
				outTable(msg);
			}
		});
	}

	function outTable(node){
		var pseq = node.dto.pseq;
// 		var id=node.dto.id;
		var name=node.dto.name;
		var typeclass=node.dto.typeclass;
		var info=node.dto.info;
// 		var delflag = node.dto.delflag;
		$(".prpseq").val(pseq);
// 		$(".prid").val(id);
		$(".prname").val(name);
		$(".prtypeclass").val(typeclass);
		$(".prinfo").val(info);
// 		$(".prdelflag").val(delflag);
		$("#detailProj").toggle();
	}
	
	function delProj(){
		var val = $(".prpseq").val();
		location.href="./deleteProject.do?pseq="+val;
	}
</script>
<body>
<h1>프로젝트 테스트</h1>
<c:choose>
	<c:when test="${empty prlist}">
		<h1>작성된 프로젝트가 존재하지 않습니다.</h1>
	</c:when>
	<c:otherwise>
		<c:forEach items="${prlist}" var="dto">
			<div onclick="ajaxProjDetail('${dto.pseq}')">
				번호 : <span>${dto.pseq}</span><br/>
				프로젝트 이름 : <span>${dto.name}</span><br/>
			</div>
			<hr/>
			<%-- <c:choose>
				<c:when test="${dto.delflag eq 'Y'}">
				삭제된 프로젝트입니다.
				</c:when>
				<c:otherwise>
				<div onclick="ajaxProjDetail('${dto.pseq}')">
				번호 : <span>${dto.pseq}</span><br/>
				프로젝트 이름 : <span>${dto.name}</span><br/>
				</div>
				<hr/>
				</c:otherwise>
			</c:choose> --%>
		</c:forEach>
	</c:otherwise>
</c:choose>
<button onclick="ShowNewProj()">프로젝트 추가하자</button>
<div id="NewProj" hidden="hidden">
	<form action="./insertProject.do" method="post">
		<input type="hidden" name="id" value="${ldto.id}"/><br/>
		프로젝트 이름 : <input type="text" name="name"/><br/>
		분류 : <input type="text" name="typeclass"/><br/>
		프로젝트 설명 : <input type="text" name="info"/><br/>
		<input type="submit" value="추가"/><br/>
	</form>
</div>
<div id="detailProj" hidden="hidden">
	<form action="./updateProject.do" method="post">
	번호 : <input type="text" class="prpseq" name="pseq" readonly="readonly"/>
<!-- 	계정 : <input type="text" class="prid" name="id" readonly="readonly"/><br/> -->
	프로젝트 이름 : <input type="text" class="prname" name="name"/><br/>
	분류 : <input type="text" class="prtypeclass" name="typeclass"/><br/>
	프로젝트 설명 : <input type="text" class="prinfo" name="info"/><br/>
<!-- 	삭제여부 : <input type="text" class="prdelflag" name="delflag" readonly="readonly"/> -->
	<input type="submit" value="수정하기"/>
	</form>
	<button onclick="delProj()">삭제</button>
</div>
<c:choose>
		<c:when test="${ldto.role ne 'U'.charAt(0)}">
			<button onclick="location.href='./LoginMain.do'">메인으로</button>
		</c:when>
</c:choose>
</body>
</html>