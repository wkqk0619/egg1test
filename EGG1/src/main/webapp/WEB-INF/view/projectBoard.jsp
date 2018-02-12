<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html onclick="parent.closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 테스트</title>
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/introjs.css">
<link rel="stylesheet" href="css/introjs-rtl.css">
<link rel="stylesheet" href="css/theme.default.css">
<script type="text/javascript" src="js/intro.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
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
	
	$(function(){
		 $("#projtable").tablesorter();
    	var introi=introJs("#projIntro");
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
	
	function restoreProj()
	{
		$("#restoreProj").toggle();
	}
</script>
<body>
<h1>프로젝트 테스트</h1>
<c:choose>
	<c:when test="${empty prlist}">
		<h1>작성된 프로젝트가 존재하지 않습니다.</h1>
		<button id="guard">가이드</button>
	</c:when>
	<c:otherwise>
		<table class="table table-striped table-bordered table-responsive tablesorter" id="projtable">
			<thead>
				<tr>
					<th>번호</th><th>프로젝트 이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prlist}" var="dto">
<%-- 					<div onclick="ajaxProjDetail('${dto.pseq}')"> --%>
<%-- 						번호 : <span>${dto.pseq}</span><br/> --%>
<%-- 						프로젝트 이름 : <span>${dto.name}</span><br/> --%>
<!-- 					</div> -->
<!-- 					<hr/> -->
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
			
				<tr onclick="ajaxProjDetail('${dto.pseq}')">
					<td>${dto.pseq}</td><td>${dto.name}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
<div id="projIntro">
<button onclick="ShowNewProj()" data-step="1" data-intro="프로젝트 추가할 수 있는 양식 보여주기">프로젝트 추가하자</button>
<button onclick="restoreProj()">프로젝트 복구 신청</button>
<div id="restoreProj" hidden="hidden">
	<form action="./insertrestoreProj.do" method="post">
		<input type="hidden" name="id" value="${ldto.id}"/>
		복구할 프로젝트 번호를 적어주세요 : <input type="text" name="projnum"/>
		<input type="submit" value="복구신청하기">
	</form>
</div>
<div id="NewProj" hidden="hidden">
	<form action="./insertProject.do" method="post">
		<input type="hidden" name="id" value="${ldto.id}"/><br/>
<!-- 		프로젝트 이름 : <input type="text" name="name"/><br/> -->
<!-- 		분류 : <input type="text" name="typeclass"/><br/> -->
<!-- 		프로젝트 설명 : <input type="text" name="info"/><br/> -->
<!-- 		<input type="submit" value="추가"/><br/> -->
		<table class="table table-bordered table-responsive"  data-step="2" data-intro="프로젝트 추가할 수 있는 양식">
			<tbody>
				<tr>
					<th>프로젝트 이름</th><td><input type="text" name="name" placeholder="프로젝트 이름"/></td>
				</tr>
				<tr>
					<th>분류</th><td><input type="text" name="typeclass" placeholder="분류"/></td>
				</tr>
				<tr>
					<th>프로젝트 설명</th><td><input type="text" name="info" placeholder="간략한 프로젝트 설명"/></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input type="submit" value="추가"/></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<div id="detailProj" hidden="hidden">
	<form action="./updateProject.do" method="post">
<!-- 	번호 : <input type="text" class="prpseq" name="pseq" readonly="readonly"/> -->
<!-- 	계정 : <input type="text" class="prid" name="id" readonly="readonly"/><br/> -->
<!-- 	프로젝트 이름 : <input type="text" class="prname" name="name"/><br/> -->
<!-- 	분류 : <input type="text" class="prtypeclass" name="typeclass"/><br/> -->
<!-- 	프로젝트 설명 : <input type="text" class="prinfo" name="info"/><br/> -->
<!-- 	삭제여부 : <input type="text" class="prdelflag" name="delflag" readonly="readonly"/> -->
<!-- 	<input type="submit" value="수정하기"/> -->
<!-- 	<input type="button" value="삭제" onclick="delProj()"/> -->
	<table class="table table-bordered table-responsive">
		<tbody>
		
		<tr>
			<th>번호</th><td><input type="text" class="prpseq" name="pseq" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>프로젝트 이름</th><td><input type="text" class="prname" name="name"/></td>
		</tr>
		<tr>
			<th>분류</th><td><input type="text" class="prtypeclass" name="typeclass"/></td>
		</tr>
		<tr>
			<th>프로젝트 설명</th><td><input type="text" class="prinfo" name="info"/></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정하기"/>
				<input type="button" value="삭제" onclick="delProj()"/>
			</td>
		</tr>
		</tfoot>
	</table>
	</form>

</div>
<c:choose>
		<c:when test="${ldto.role ne 'U'.charAt(0)}">
			<button onclick="location.href='./LoginMain.do'">메인으로</button>
		</c:when>
</c:choose>
</div>
<button onclick="location.href='./fileTest.do'">파일저장테스트</button>
</body>
</html>