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
<script type="text/javascript">
	function upNickName() 
	{
		$("#upNickName").show();
	}

	function hideNick() 
	{
		$("#upNickName").hide();
	}
	
	function upPassword() 
	{
		$("#upPassword").show();
	}
	
	function hidePass() 
	{
		$("#upPassword").hide();
	}
	
	function sec() 
	{
		$("#secession").show();
	}
	
	function hideSec() 
	{
		$("#secession").hide();
	}
	
	function secession() 
	{
		window.parent.location.href="./secession.do";
	}
	function iconFormOpen()
	{
		$(".iconForm").toggle();
	}
	$( function() {
    	var introi=introJs("#myPageIntro");
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
<body>
	<h1>가입정보</h1>
<%-- 	아이디 : ${ldto.id}<br> --%>
<!-- 	<button onclick="upPassword()">비밀번호 변경</button><br> 현재 비밀번호를 묻는 절차가 있어야 하겠지만 일단 생략 -->
<!-- 	<div id="upPassword" hidden="hidden"> -->
<!-- 		<form action="./upPassword.do" method="post"> -->
<%-- 			<input type="hidden" name="id" value="${ldto.id}"> --%>
<!-- 			패스워드 : <input type="text" name="password"> -->
<!-- 			<input type="submit" value="변경"> <input type="button" onclick="hidePass()" value="취소"> -->
<!-- 		</form> -->
<!-- 	</div> -->
<%-- 	가입일자 : ${ldto.regdate}<br> --%>
<%-- 	닉네임 : ${ldto.nickname} <button onclick="upNickName()">닉네임변경</button><br> --%>
<!-- 	<div id="upNickName" hidden="hidden"> -->
<!-- 		<form action="./upNickName.do" method="post"> -->
<%-- 			<input type="hidden" name="id" value="${ldto.id}"> --%>
<!-- 			닉네임 : 	<input type="text" name="nickname"> -->
<!-- 			<input type="submit" value="변경"> <input type="button" onclick="hideNick()" value="취소"> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	<button onclick="location.href='./LoginMain.do'">메인으로</button> -->
<%-- 	아이콘 : ${ldto.icon} --%>
<button id="guard">가이드</button>
<div id="myPageIntro">
	<table  class="table table-striped table-bordered table-responsive" data-step="1" data-intro="마이페이지 정보">
		<tr>
			<th data-step="2" data-intro="계정">아이디 : ${ldto.id} </th><td data-step="3" data-intro="비밀번호 번경"><button onclick="upPassword()">비밀번호 변경</button></td>
		</tr>
		<tr id="upPassword" hidden="hidden">
			<th>바꿀 패스워드 </th>
			<td>
				<div>
					<form action="./upPassword.do" method="post">
						<input type="hidden" name="id" value="${ldto.id}">
						<input type="text" name="password" pattern="^[A-Za-z0-9]{6,16}$">
						<input type="submit" value="변경"> <input type="button" onclick="hidePass()" value="취소">
					</form>
				</div>
			</td>
		</tr>
		<tr data-step="4" data-intro="가입일자">
			<th>가입일자</th><td>${ldto.regdate}</td>
		</tr>
		<tr data-step="5" data-intro="닉네임">
			<th>닉네임</th><td>${ldto.nickname} <button onclick="upNickName()">닉네임변경</button></td>
		</tr>
		<tr hidden="hidden" id="upNickName">
			<th>변경할 닉네임</th>
			<td>
				<div>
					<form action="./upNickName.do" method="post">
						<input type="hidden" name="id" value="${ldto.id}">
						<input type="text" name="nickname">
						<input type="submit" value="변경"> <input type="button" onclick="hideNick()" value="취소">
					</form>
				</div>
			</td>
		</tr>
			<c:choose>
				<c:when test="${empty ldto.icon}">
					<tr>
						<td>프로필이미지를 설정하지 않으셨습니다.</td><td><button onclick="iconFormOpen()">프로필 사진 추가</button></td>
					</tr>
					<tr class="iconForm" hidden="hidden">
						<td>
							<form action="./fileUpload.do" method="post" enctype="multipart/form-data">
								<input name="id" value="${ldto.id}"/>
								<input type="file" name="file"/>
								<input type="submit" value="저장"/>
							</form>
						</td>
					</tr>
				</c:when>
					<c:otherwise>
						<tr>
							<td>
								<img alt="프로필" src="${ldto.icon}"/>
							</td>
						</tr>
					</c:otherwise>
			</c:choose>
		<tr>
			<td><button onclick="location.href='./myLog.do'">접속기록 조회</button></td>
		</tr>
		<tr>
			<td><button onclick="sec()">탈퇴요청</button></td>
		</tr>
		<tr hidden="hidden" id="secession">
			<td><button onclick="secession()">진짜로 탙퇴할끼가?</button></td>
			<td><button onclick="hideSec()">취소</button></td>
		</tr>
	</table>
	</div>
</body>
</html>