<%@page import="com.hk.lab5.dtos.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">

function ajaxUserDetail(val){
	//alert(val);
	$.ajax({
		type: "POST",
		url: "./ajaxUserDetail.do",
		data:"id="+val,
		async:true,
		success:function(msg){
			//alert("OK");
			outTable(msg);
		}
	});
}

function outTable(node){
	$(".id").val(node.id);
	$(".password").val(node.password);
	$(".regdate").val(node.regdate);
	$(".role").val(node.role);
	$(".enabled").val(node.enabled);
	$(".nickname").val(node.nickname)
	
	if(node.enabled=="Y")
	{
		$("#y").attr("selected",true);
	}
	else
	{
		$("#n").attr("selected",true);
	}
	
	$("#detailUser").toggle();
}

function updateUserForm(){
	$("#detailUser").hide();
	$("#updateUser").show();
}

function hideUserUpdate(){
	$("#updateUser").hide();
}
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
	<h1>회원상태정보 전체조회</h1>
	<c:choose>
		<c:when test="${empty list}">
			<h1>회원이.. 없을리가 없잖아? 아 물론 어드민이 아닌 회원은 없을수도 있지만.. 하지만 테스트계정은 있지않을까?</h1>
		</c:when>
		<c:otherwise>
			<table class="table table-striped table-bordered table-responsive">
				<thead>
					<tr>
						<th>아이디</th>
						<th>패스워드</th>
						<th>가입날짜</th>
						<th>등급</th>
						<th>활성여부</th>
						<th>닉네임</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="dto">
					<tr onclick="ajaxUserDetail('${dto.id}')">
						<td>${dto.id}</td>
						<td>${dto.password}</td>
						<td>${dto.regdate}</td>
						<td>${dto.role}</td>
						<td>${dto.enabled}</td>
						<td>${dto.nickname}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
	
	<div id="detailUser" hidden="hidden">
		<input type="text" class="id" name="id" readonly="readonly"/>
		<input type="text" class="password" name="password" readonly="readonly"/>
		<input type="text" class="regdate" name="regdate" readonly="readonly"/>
		<input type="text" class="role" name="role" readonly="readonly"/>
		<input type="text" class="enabled" name="enabled" readonly="readonly"/>
		<input type="text" class="nickname" name="nickname" readonly="readonly">
		<button onclick="updateUserForm()">수정할까??</button>
	</div>
	<div id="updateUser" hidden="hidden">
		<form action="./updateUser.do" method="post">
			<input type="text" class="id" name="id" readonly="readonly"/>
			<input type="text" class="password" name="password" readonly="readonly"/>
			<input type="text" class="regdate" name="regdate" readonly="readonly"/>
			<input type="text" class="role" name="role" readonly="readonly"/>
			<select name="enabled">
				<option value="Y" id="y">활성</option>
				<option value="N" id="n">비활성</option>
			</select>
<!-- 			<input type="text" class="enabled" name="enabled"/> -->
			
			<input type="text" class="nickname" name="nickname" readonly="readonly">
			<input type="submit" value="수정"/>
		</form>
		<button onclick="hideUserUpdate()">취소</button>
	</div>
	<button onclick="location.href='./LoginMain.do'">메인으로</button>
	
</body>
</html>