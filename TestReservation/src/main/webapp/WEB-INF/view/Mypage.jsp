<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
<button type="button" onclick="location='./userLogout.do'">로그아웃</button>
<button type="button" onclick="location='./userMain.do'">유저메인화면으로</button>
<h1>이곳은 유저의 마이페이지가 보일 화면</h1>
<div id="MypageDiv">
	<table border="1">
		<tr>
			<td>프로필 이미지 영역
				<form action="./fileUpload.do" method="post" enctype="multipart/form-data">
					<input hidden="hidden" name="id" value="${ldto.email}"/>
					<input type="file" name="file"/>
					<input type="submit" value="저장"/>
				</form>
			</td>
		</tr>
		<tr>
			<td>내 이력 확인하기 : <button type="button"  onclick="location='./MyList.do'">이력 확인</button></td>
		</tr>
		<tr>
			<td>보유 포인트 : @@@</td>
		</tr>
		<tr>
			<td>이름 : @@@</td>
		</tr>
		<tr>
			<td>생년 월일 </td>
		</tr>
		<tr>
			<td>거주 지역 : @@@@</td>
		</tr>
		<tr>
			<td>연락처 : @@@-@@@@-@@@@</td>
		</tr>
		<tr>
			<td>
				쿠폰 등록 : 
				<form action="" method="post">
					<input type="text" name="code" required="required"/>
					<input type="submit" value="쿠폰등록"/>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>