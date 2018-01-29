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
<link rel="stylesheet" type="text/css" href="css/page.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/introjs.css">
<link rel="stylesheet" href="css/introjs-rtl.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery-3.2.1.js"></script> -->
<script src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/egg1JS.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/intro.js"></script>
<script type="text/javascript">
$( function() {
    	$( "#tabs" ).tabs();
    	var introi=introJs("#tabs-1");
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
  
  function myS() 
  {
	 $("#myS").attr("src","./mySupportList.do");
  }
  
  function seout(){
	  location.href="./EggLogout.do";
  }
  
  function idearShew(){
	  //호출시  class=idearS 인것을 클릭하는 효과
	  $(".idearS").trigger("click");
  }
</script>
<style type="text/css">
	   .ifa{
	     width: 100%;
	     height: 1000px;
	  }
	  .egtab{
	     height: 1100px;
	  }
</style>
</head>
<body>
<header>
<span>로고가 보이는 상단</span>
</header>
<!-- 전체를 감싼 div -->
<div id="tabs">
<!-- <button id="guard">가이드</button> -->

	<!-- 
	페이지 테마 담당
	<select id="theme">
		<option value="white">색선택</option>
		<option value="pink">분홍</option>
		<option value="gray">회색</option>
		<option value="aqua">아쿠아</option>
	</select>
	 -->
	<ul>
  		<c:choose>
  			<c:when test="${empty ldto}">
  				<li><a href="#tabs-1">소개영상</a></li>
  			</c:when>
  			<c:otherwise>
  				<li><a href="#tabs-2" class="idearS">프로젝트</a></li>
    			<li><a href="#tabs-3">지원사업</a></li>
    			<li><a href="#tabs-4" onclick="myS()">my지원</a></li>
    			<li><a href="#tabs-5">my페이지</a></li>
    			<li><a href="#tabs-6">공지사항</a></li>
    			<li><a href="#tabs-7">문의</a></li>
    			<li><a href="#tabs-8">로그아웃</a></li>
  			</c:otherwise>
  		</c:choose>
  	</ul>
	
	
	<div id="tabs-1" hidden="hidden" class="egtab">
	<button id="guard">가이드</button>
	<!-- 초기화면 -->
		<div id="indexmain">
			<div id="continer">
				<div id="intro">
					<iframe class="embed-responsive-item" width="850px" height="500px" id="player" src="//www.youtube.com/embed/kaMWDfbPjp0" data-step="1" data-intro="소개영상"></iframe>
					<!-- 유튜브 영상 사용할때 소스 -->
				</div>
				<div id="loginForm" data-step="2" data-intro="로그인을 위한 입력창입니다.">
					<input type="text" value="login" name="command" hidden="hidden"/>
					<span>로그인</span>
					<br/>
					<input type="text" class="form-control" id="loginemail" name="email" placeholder="이메일"/>
					<br/>
					<input type="password" class="form-control" id="loginpwd" name="pwd" placeholder="비밀번호"/>
					<button onclick="getlogin()" class="btn btn-success">로그인</button>
					<button onclick="repassword()" class="btn btn-warning">비밀번호 찾기</button>
				</div>
				<div id="regForm" data-step="3" data-intro="회원가입을 위한 입력창입니다.">
					<span>회원가입</span><br/>
					<input type="hidden" id="rNum">
					<input type="text" id="regemail" name="email" placeholder="이메일"/><button onclick="check()" id="keyBtn">인증코드보내기</button><br/>
					<input type="text" id="accKey" name="accKey"/><button id="keyChk" onclick="keyChk()">인증확인</button>
					<input type="text" id="pwd" placeholder="비밀번호"/>
					<button id="registBtn" onclick="regist()" disabled="disabled">회원가입</button>
				</div>
			</div><!-- continer 의 끝 -->
		
			<div id="repassword" hidden="hidden">
				<input type="hidden" id="findrNum">
				<input type="text" id="findemail" name="email" placeholder="이메일"/><button id="findKeyBtn" onclick="findCheck()">인증번호전송</button><br/>
				<input type="text" id="findKey" name="findKey" placeholder="인증키"/><button onclick="findkeyChk()">인증키확인</button>
			</div>
		</div><!-- indexmain 끝 -->
	</div><!-- tabs-1 끝 -->

	<div id="tabs-2" hidden="hidden" class="egtab">
<%-- 		<h1>${ldto.id} 님 환영합니다.</h1>	 --%>
		<div id="idearMain">
			<div>Welcome EGG1<br/>
				<iframe class="ifa" src="./selectProject.do"></iframe>
			</div>
		</div>
	</div>
	
	<div id="tabs-3" hidden="hidden" class="egtab">
		<div id="supptyBis">
			지원사업공고들~~<br/>
			<iframe class="ifa" src="./supportList.do"></iframe>
		</div>
	</div>
	
	<div id="tabs-4" hidden="hidden" class="egtab">
		마이지원<br/>
		<iframe class="ifa" id="myS" src="./mySupportList.do"></iframe>
	</div>
	
	<div id="tabs-5" hidden="hidden" class="egtab">
		마이페이지<br/>
		<iframe class="ifa" src="./myPage.do"></iframe>
	</div>
	
	<div id="tabs-6" hidden="hidden" class="egtab">
		공지사항<br/>
		<iframe class="ifa" src="./selectNotion.do"></iframe>
	</div>
	
	<div id="tabs-7" hidden="hidden" class="egtab">
		문의게시판<br/>
		<iframe class="ifa" src="./qnaList.do"></iframe>
	</div>
			
	<div id="tabs-8" hidden="hidden" class="egtab">
		로그아웃 하시겠습니까??
		<button onclick="seout()">로그아웃</button>
		<button onclick="idearShew()">아니오</button>
	</div>
	
</div><!-- tabs 끝 -->
	

<footer>
	<span>회사 위치 뭐 그런게 적히는 하단부</span>
</footer>
</body>
</html>