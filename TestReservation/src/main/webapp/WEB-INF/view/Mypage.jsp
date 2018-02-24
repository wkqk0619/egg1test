<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function changeName() 
	{
		$(".iChange").hide();
		$("#changeName").show();
	}
	function cancelName() 
	{
		$("#changeName").hide();
	}
	
	function changeAge() 
	{
		$(".iChange").hide();
		$("#changeAge").show();
	}
	function cancelAge() 
	{
		$("#changeAge").hide();
	}
	
	function changeRegion() 
	{
		$(".iChange").hide();
		$("#changeRegion").show();
	}
	function cancelRegion() 
	{
		$("#changeRegion").hide();
	}
	
	function changeContact() 
	{
		$(".iChange").hide();
		$("#changeContact").show();
	}
	function cancelContact() 
	{
		$("#changeContact").hide();
	}
</script>
</head>
<body>
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>이곳은 유저의 마이페이지가 보일 화면</h1>
<div id="MypageDiv">
	<table border="1">
         <c:choose>
            <c:when test="${empty ldto.image}">
               <tr>
                  <td>
                     프로필 이미지가 등록되지 않았습니다.
                     <form action="./fileUpload.do" method="post" enctype="multipart/form-data">
                        <input hidden="hidden" name="id" value="${ldto.id}"/>
                        <input type="file" name="file"/>
                        <input type="submit" value="저장"/>
                     </form>
                  </td>
               </tr>   
            </c:when>
            <c:otherwise>
               <tr>
                  <td>
                     <img alt="프로필 이미지" src="${ldto.image}" title="프로필 이미지" id="profile"><br/>
                     <button onclick="UpdateiconFormOpen()">프로필 사진 변경</button>
                  </td>
               </tr>   
               <tr class="UpdateiconForm" hidden="hidden">
                  <td>
                     <form action="./fileUpload.do" method="post" enctype="multipart/form-data">
                        <input hidden="hidden" name="id" value="${ldto.id}"/>
                        <input type="file" name="file"/>
                        <input type="submit" value="저장"/>
                     </form>
                  </td>
               </tr>
            </c:otherwise>
		</c:choose>
		
		<tr>
			<td>내 이력 확인하기 : <button type="button"  onclick="location='./MyList.do'">이력 확인</button></td>
		</tr>
		<tr>
			<td>보유 포인트 : ${ldto.wallet} <button onclick="location='./myWallet.do'">조회하기</button></td>
		</tr>
		<tr>
			<td>이름 : ${ldto.name} <button onclick="changeName()">변경</button></td>
		</tr>
		<tr class="iChange" id="changeName" hidden="hidden">
			<td>
				<form action="./changeInfo.do" method="post">
					<input type="hidden" name="change" value="NAME">
					<input type="text" name="value">
					<input type="submit" value="변경">
				</form>
				<button onclick="cancelName()">취소</button>
			</td>
		</tr>
		<tr>
			<td>나이 : ${ldto.age} <button onclick="changeAge()">변경</button></td>
		</tr>
		<tr class="iChange" id="changeAge" hidden="hidden">
			<td>
				<form action="./changeInfo.do" method="post">
					<input type="hidden" name="change" value="AGE">
					<input type="text" name="value">
					<input type="submit" value="변경">
				</form>
				<button onclick="cancelAge()">취소</button>
			</td>
		</tr>
		<tr>
			<td>거주 지역 : ${ldto.region} <button onclick="changeRegion()">변경</button></td>
		</tr>
		<tr class="iChange" id="changeRegion" hidden="hidden">
			<td>
				<form action="./changeInfo.do" method="post">
					<input type="hidden" name="change" value="REGION">
					<input type="text" name="value">
					<input type="submit" value="변경">
				</form>
				<button onclick="cancelRegion()">취소</button>
			</td>
		</tr>
		<tr>
			<td>연락처 : ${ldto.contact} <button onclick="changeContact()">변경</button></td>
		</tr>
		<tr class="iChange" id="changeContact" hidden="hidden">
			<td>
				<form action="./changeInfo.do" method="post">
					<input type="hidden" name="change" value="CONTACT">
					<input type="text" name="value">
					<input type="submit" value="변경">
				</form>
				<button onclick="cancelContact()">취소</button>
			</td>
		</tr>
		<tr>
			<td>
				쿠폰 등록 : 
				<form action="./coupon.do" method="post">
					<input type="text" name="code" required="required"/>
					<input type="submit" value="쿠폰등록"/>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>