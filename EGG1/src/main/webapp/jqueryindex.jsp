<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>초기화면Ver.1</title>
<!-- <link rel="stylesheet" type="text/css" href="css/page.css"> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="js/egg1JS.js"></script>
<script type="text/javascript">
	$( function() {
    	$( "#tabs" ).tabs();
  	} );
</script>
<body>
<div id="search">
	<input type="text" name="searword"/><button>검색</button>
</div>

<!-- 전체를 감싼 div -->
<div id="tabs">
<div id="Master">
	<!-- 페이지 테마 담당 -->
	<select id="theme">
		<option value="white">색선택</option>
		<option value="pink">분홍</option>
		<option value="gray">회색</option>
		<option value="aqua">아쿠아</option>
	</select>
	  <ul>
  	<c:choose>
  		<c:when test="${empty ldto}">
  			<li><a href="#tabs-1">소개영상</a></li>
  		</c:when>
  		<c:otherwise>
  			<li><a href="#tabs-2">아이디어</a></li>
    		<li><a href="#tabs-3">지원사업</a></li>
    		<li><a href="#tabs-4">로그아웃</a></li>
  		</c:otherwise>
  	</c:choose>
  </ul>
  <div id="tabs-1" hidden="hidden">
  		<!-- 초기화면 -->
	<div id="indexmain">
		<div id="continer">
			<div id="intro">
				<iframe id="player" width="850" height="500" src="//www.youtube.com/embed/kaMWDfbPjp0">
				</iframe>
				<!-- 유튜브 영상 사용할때 소스 -->
			</div>
			<div id="loginForm">
				<input type="text" value="login" name="command" hidden="hidden"/>
				<span>로그인</span>
				<br/>
				<input type="text" id="loginemail" name="email" placeholder="이메일"/>
				<br/>
				<input type="text" id="loginpwd" name="pwd" placeholder="비밀번호"/>
				<button onclick="getlogin()">로그인</button>
				<button onclick="repassword()">비밀번호 찾기</button>
			</div>
			<div id="regForm">
				<span>회원가입</span><br/>
				<input type="hidden" id="rNum">
				<input type="text" id="regemail" name="email" placeholder="이메일"/><button onclick="check()" id="keyBtn">인증코드보내기</button><br/>
				<input type="text" id="accKey" name="accKey"/><button id="keyChk" onclick="keyChk()">인증확인</button>
				<input type="text" id="pwd" placeholder="비밀번호"/>
				<button id="registBtn" onclick="regist()" disabled="disabled">회원가입</button>
			</div>
	</div><!-- 초기화면 div 의 끝 -->
  </div>
	<div id="repassword" hidden="hidden">
		<input type="hidden" id="findrNum">
		<input type="text" id="findemail" name="email" placeholder="이메일"/><button id="findKeyBtn" onclick="findCheck()">인증번호전송</button><br/>
		<input type="text" id="findKey" name="findKey" placeholder="인증키"/><button onclick="findkeyChk()">인증키확인</button>
	</div>
</div>
</div>
</div>

	
	<%-- 
	<!-- 로그인시 화면 div -->
	<c:choose>
		<c:when test="${empty ldto}"></c:when>
		<c:otherwise>
			<script type="text/javascript">
				//alert("멀쩡");
				$("#indexmain").hide();
			</script>
			<div id="loginAfter">
				<header id="indexHeader">
					<input type="text"/><button>검색</button>
					<button onclick="showidearMain()">아이디어</button>
					<button onclick="showsupptyBis()">지원사업</button>
					<a href="controller.do?command=logout"><button>로그아웃</button></a>
				</header>
				
				<h1>${ldto} 님 환영합니다.</h1>
				
				<div id="idearMain">
					<div>Welcome EGG1</div>
				</div>
				
				<div id="supptyBis" hidden="hidden">
					지원사업공고들~~
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	 --%>


<footer></footer>
</body>
</html>