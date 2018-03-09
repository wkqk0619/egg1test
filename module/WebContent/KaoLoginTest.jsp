<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오 로그인 테스트</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
$(function(){
	  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('98b59f338a6b0ed8c0956906971927cb');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
        getKakaotalkUserProfile();
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
});

function getKakaotalkUserProfile(){
	Kakao.API.request({
		url: '/v1/user/me',
		success: function(res) {
			$('#profileImage').attr('src', res.properties.profile_image);
			$('#profileName').text(res.properties.nickname);
			$('#profileDiv').show();
		},
		fail: function(error) {
			console.log(error);
		}
	});
}

function logout()
{
	Kakao.Auth.logout(function() 
			{ 
				console.log("logged out."); 
				location.href="/module/KaoLoginTest.jsp" ;
			}
	);
}
</script>
</head>
<body>
<h1>카카오톡 계정으로 로그인 테스트하는 페이지 입니다.</h1>
<a id="kakao-login-btn"></a>

<div id="profileDiv" hidden="hidden">
	<img id="profileImage" alt="카카오톡 프로필 이미지" src="">
	<h3 id="profileName"></h3>
	<a href="http://developers.kakao.com/logout?continue=http://localhost:8080/module/KaoLoginTest.jsp">카카오 로그아웃</a>
	<button type="button" onclick="logout()">로그아웃</button>
</div>

</body>
</html>












