<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="searchSupport">
		<form action="./searchSupport.do" method="post">
			<select name="type">
				<option value="창업교육">창업</option>
				<option value="정책자금">자금</option>
				<option value="판로·해외진출">판로</option>
				<option value="멘토링·컨설팅">멘토링·컨설팅</option>
				<option value="사업화">사업화</option>
				<option value="시설·공간">시설·공간</option>
				<option value="R&D">R&D</option>
				<option value="행사·네트워크">행사·네트워크</option>
				<!-- 
				<option value="인력">인력</option>
				<option value="연구">연구</option>
				<option value="인증">인증</option>
				<option value="회계">회계</option>
				 -->
				<option value="기타">기타</option>
			</select>
			<select name="target">
				<option value="일반기업">일반기업</option>
<!-- 				<option value="중소기업">중소기업</option> -->
<!-- 				<option value="소상공인">소상공인</option> -->
				<option value="1인 창조기업">1인 창조기업</option>
<!-- 				<option value="창업기업">창업기업</option> -->
<!-- 				<option value="예비창업자">예비창업자</option> -->
				<option value="대학생">대학생</option>
				<option value="일반인">일반인</option>
				<option value="대학">대학</option>
				<option value="연구기관">연구기관</option>
				<option value="청소년">청소년</option>
				<option value="기타">기타</option>
			</select>
			<select name="area">
				<option value="서울특별시">서울특별시</option>
				<option value="인천광역시">인천광역시</option>
				<option value="경기도">경기도</option>
				<option value="전라남도">전라남도</option>
				<option value="전라북도">전라북도</option>
				<option value="광주광역시">광주광역시</option>
				<option value="대전광역시">대전광역시</option>
				<option value="대구광역시">대구광역시</option>
				<option value="부산광역시">부산광역시</option>
				<option value="충청남도">충청남도</option>
				<option value="충청북도">충청북도</option>
			</select>
			<input type="submit" value="검색">
		</form>
<!-- 		<button onclick="searchCancel()">취소</button> -->
	</div><!-- searchSupport 끝 -->
</body>
</html>