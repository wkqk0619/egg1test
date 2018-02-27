<%@page import="com.hk.lab5.dtos.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html onclick="closeSearch()">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>초기화면Ver.1</title>
<link rel="stylesheet" type="text/css" href="css/page.css">
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="css/jquery-ui.min.css">
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
    	/*
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
    	*/
    	$("#loginpwd").keypress(function(key) {
    		  //alert(key.keyCode);
    		  if(key.keyCode == 13)
    		  {
    			  getlogin();
    		  }
    	});
    	
    	<% AccountDto ldto = (AccountDto)session.getAttribute("ldto"); %>
    	
    	if(<%=ldto!=null%>)
    	{
    		$.ajax
    		(
    			{
    				type : "POST",
    				url : "./alarm.do",
    				async : true,
    				success : function(msg)
    				{
    					if(msg.length==0)
    					{
    						$("#alarm").empty();
    						$("#alarm").text("알림이 읎어요");
    					}
    					else
    					{
    						for(var i=0; i<msg.length; i++)
    						{
    							var $tr = $("<tr>");
//    	 						msg[i].sseq
    							$tr.append("<td>"+msg[i].title+"</td>");
    							$tr.append("<td>"+msg[i].dday+"</td>");
    							
    							$("#alarmtable").append($tr);
    						}
    					}
    					
    				}
    				
    			}
    		);
    	}    	
  });
  
  function myS() 
  {
	 $("#mtab").attr("src","./mySupportList.do");
  }
  
  function seout(){
	  location.href="./EggLogout.do";
  }
  
  function idearShew(){
	  //호출시  class=idearS 인것을 클릭하는 효과
	  $(".idearS").trigger("click");
  }
  
  	/* 
	function onEnterLogin(){

		var keyCode = window.event.keyCode;

		

		if (keyCode == 13) { //엔테키 이면

			getlogin();

		}

	} //onEnterLogin()
	 */
	
	function searching() 
	{
		var keyword = $("#searchWord").val();
		
		$.ajax
		(
			{
				type : "POST",
				url : "./combineSearch.do",
				data : "search="+keyword, 
				async : true,
				success : function(msg)
				{
					$("#searchResult").empty();
					$('#searchResultDIV').show();
					if(msg.pList.length!=0)
					{
						$("#searchResult").append($("<tr><th colspan='3'>프로젝트</th></tr>"));
						$("#searchResult").append($("<tr><th>프로젝트명</th><th>분류</th><th>설명</th></tr>"));
						for(var i=0; i<msg.pList.length; i++)
						{
							var $tr = $("<tr onclick='projectSelect("+msg.pList[i].pseq+")'></tr>");
							$tr.append("<td>"+msg.pList[i].name+"</td>");
							$tr.append("<td>"+msg.pList[i].typeclass+"</td>");
							$tr.append("<td>"+msg.pList[i].info+"</td>");
							
							$("#searchResult").append($tr);
							
						}
					}
					
					if(msg.mList.length!=0)
					{
						$("#searchResult").append($("<tr><th colspan='3'>마이지원</th></tr>"));
						for(var i=0; i<msg.mList.length; i++)
						{
							var $tr = $("<tr onclick='mSupportSelect("+'"'+msg.mList[i].sseq+'"'+")'></tr>");
							$tr.append("<td colspan='3'>"+msg.mList[i].title+"</td>");
							
							$("#searchResult").append($tr);
						}
					}
					
					if(msg.sList.length!=0)
					{
						$("#searchResult").append($("<tr><th colspan='3'>지원사업</th></tr>"));
						for(var i=0; i<msg.sList.length; i++)
						{
							var $tr = $("<tr onclick='supportSelect("+'"'+msg.sList[i].url+'"'+")'></tr>");
							$tr.append("<td colspan='3'>"+msg.sList[i].title+"</td>");
							
							$("#searchResult").append($tr);
						}
					}
					
					if(msg.pList.length==0 && msg.sList.length==0 && msg.mList.length==0)
					{
						$("#searchResult").append($("<tr><th>검색결과가 없습니다.</th></tr>"));
					}
					$("#searchResult").show();
				}				
			}
		);
	}
	
	function projectSelect(pseq) 
	{
		$('#tabs').tabs("option","active", 0); // 탭 전환
		var iframe = document.getElementById("ptab");
		if (iframe) 
		{
		   var iframeContent = (iframe.contentWindow || iframe.contentDocument);
		   iframeContent.ajaxProjDetail(pseq);
		}
		
		var event = window.event;
		if(event.stopPropagation())
		{
			event.stopPropagation();  // W3C 표준
		}
		else
		{
			event.cancelBubble = true; // 인터넷 익스플로러 방식
		}
	}
	
	function mSupportSelect(sseq) 
	{
		$('#tabs').tabs("option","active", 1); // 탭 전환
		var iframe = document.getElementById("mtab");
		
		if (iframe) 
		{
		   var iframeContent = (iframe.contentWindow || iframe.contentDocument);
		   iframeContent.ajaxProject(sseq);
		}
		
		var event = window.event;
		if(event.stopPropagation())
		{
			event.stopPropagation();  // W3C 표준
		}
		else
		{
			event.cancelBubble = true; // 인터넷 익스플로러 방식
		}
	}
	
	function supportSelect(url) 
	{
		$("#ping").val("");
		
		$("#stab").attr("src","./supportList.do");
		
		if($("#pong").val()=="pong")
		{
			$("#pong").val("");
			pingpong = setInterval
			(
				function() 
				{
					
					if($("#ping").val()=="ping")
					{
						disableTab();
						
						// 지원사업쪽 탭 활성화 및 보이게함
						$("#tabs4").show();
						$("#tabs").tabs("enable","#tabs-4");
						
						// 지원사업탭으로 전환
						// 주) 인덱스는 0부터 시작한다
						$("#tabs").tabs("option","active",2);
						
						var iframe = document.getElementById("stab");
						if (iframe) 
						{
						   var iframeContent = (iframe.contentWindow || iframe.contentDocument);
						   iframeContent.detail(url);
						}
						clearInterval(pingpong);
						$("#pong").val("pong");
					}
				}
				,
				1000
			);
		}
		
		
		
		
		/* 
		$("#stab").on
		(
			'load'
			,
			function()
			{
				disableTab();
				
				// 지원사업쪽 탭 활성화 및 보이게함
				$("#tabs4").show();
				$("#tabs").tabs("enable","#tabs-4");
				
				// 지원사업탭으로 전환
				// 주) 인덱스는 0부터 시작한다
				$("#tabs").tabs("option","active",2);
				
				var iframe = document.getElementById("stab");
				if (iframe) 
				{
				   var iframeContent = (iframe.contentWindow || iframe.contentDocument);
				   iframeContent.detail(url);
				}
			}
		);
		 */
		var event = window.event;
		if(event.stopPropagation())
		{
			event.stopPropagation();  // W3C 표준
		}
		else
		{
			event.cancelBubble = true; // 인터넷 익스플로러 방식
		}
		
	}
	
	// 탭전환이 페이지 전환보다 일찍일어나기 때문에 데이터가 바뀌면서 살짝 깜빡하는 현상이 있다. 보완해야함
	function searchSupport() 
	{
		$("#stab").attr("src", "./searchSupportPage.do");
		
		disableTab();
		
		// 지원사업 탭 활성화 및 보이게함
		$("#tabs4").show();
		$("#tabs").tabs("enable","#tabs-4");
		
		// 지원사업탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",2);
		
	}
	
	function disableTab() 
	{
		$("#tabs4").hide();
		$("#tabs5").hide();
		$("#tabs6").hide();
		$("#tabs7").hide();
		$("#tabs8").hide();
		$("#tabs9").hide();
		$("#tabs10").hide();
// 		$("#tabs11").hide();
		
		$("#tabs").tabs("disable","#tabs-4");
		$("#tabs").tabs("disable","#tabs-5");
		$("#tabs").tabs("disable","#tabs-6");
		$("#tabs").tabs("disable","#tabs-7");
		$("#tabs").tabs("disable","#tabs-8");
		$("#tabs").tabs("disable","#tabs-9");
		$("#tabs").tabs("disable","#tabs-10");
// 		$("#tabs").tabs("disable","#tabs-11");
	}
	
	function mypage() 
	{
		disableTab();
		
		// 마이페이지 탭 활성화 및 보이게함
		$("#tabs5").show();
		$("#tabs").tabs("enable","#tabs-5");
		
		// 마이페이지탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",3);
	}
	
	function notion()
	{
		disableTab();
		
		// 공지사항 탭 활성화 및 보이게함
		$("#tabs6").show();
		$("#tabs").tabs("enable","#tabs-6");
		
		// 공지사항탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",4);
	}
	
	function qna()
	{
		disableTab();
		
		// 문의 탭 활성화 및 보이게함
		$("#tabs7").show();
		$("#tabs").tabs("enable","#tabs-7");
		
		// 문의탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",5);
	}
	
	function logout()
	{
		disableTab();
		
		// 로그아웃 탭 활성화 및 보이게함
		$("#tabs8").show();
		$("#tabs").tabs("enable","#tabs-8");
		
		// 로그아웃탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",6);
	}
	
	function alarm()
	{
		disableTab();
		
		// 알림쪽 탭 활성화 및 보이게함
		$("#tabs9").show();
		$("#tabs").tabs("enable","#tabs-9");
		
		// 알림탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",7);
	}
	
	function insertAnswer(pseq,sseq)
	{
		$("#itab").attr("src","./insertAnswerForm.do?pseq="+pseq+"&sseq="+sseq);
		disableTab();
		
		// 검색쪽 탭 활성화 및 보이게함
		$("#tabs10").show();
		$("#tabs").tabs("enable","#tabs-10");
		
		// 검색탭으로 전환
		// 주) 인덱스는 0부터 시작한다
		$("#tabs").tabs("option","active",8);
		
// 		$tr.append($("<td><button onclick='location.href="+'"./insertAnswerForm.do?pseq='+pseq+'&sseq='+sseq+'"'+"'>선택</button></td>"))
	}
	
	function tabActive() 
	{
		$("#tabs").tabs("option","active",1);
	}
	
	function recoveryCheck() 
	{
		var email = $("#recoveryEmail").val();
		
		$.ajax
		(
			{
				type : "POST",
				url : "./recoveryCheck.do",
				data : "email="+email, 
				async : true,
				success : function(msg)
				{
					$("#recoveryCode").val(msg);
					$("#emailChk").attr("disabled",true);
					$("#recoveryBtn").attr("disabled",false);
				}
				
			}
		);
	}
	
	function recoverykeyChk() 
	{
		var email = $("#recoveryEmail").val()
		
		if($("#chkCode").val()==$("#recoveryCode").val())
		{
			location.href="./recovery.do?email="+email;
		}
		else
		{
			alert("인증 번호를 확인해주세요");
		}
	}
	
	function menu() 
	{
		$("#menu").toggle();
	}
	
	function closeSearch() 
	{
		$("#searchResult").hide();	
	}
	
	function ping() 
	{
		$("#ping").val("ping");
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
	  
	  #menudiv
	  {
	  	float: right;
	  }
	  
	  #menuBtn
	  {
	  	float: right;
	  	margin-top: 15px;
	  	margin-right: 20px;
	  }
	  
	  #menu
	  {
	  	background-color: #dfdfdf;
	  	clear: both;
	  	position: absolute;
	  	top: 45px;
	  	right: 10px;
	  	z-index: 10;
	  }
	  
	  #menu a
	  {
	  	font-size:10pt;
	  	color: black;
	  	cursor:pointer;
	  }
	  
	  #menu ul
	  {
		  margin:0px; padding:2px;
	  }
	  
	  #menu li
	  {
	  	list-style:none
	  }
	  
	  #menu a:link
	  {
	  	color: black; text-decoration: none;
	  }
	  #menu a:visited
	  {
	  	color: black; text-decoration: none;
	  }
	  #menu a:hover 
	  {
	  	color: blue; text-decoration: none;
	  }

	  #searchDiv
	  {
/* 	  	height: 500px; */
	  	overflow: auto;
	    position: absolute;
	    left: 35%;
	  	z-index: 12;
	  }
	  
	  #searchResult
	  {
	  	background-color: #dfdfdf;
	  }
	  
	  #searchResult th
	  {
	  	border-top: 1px solid black;
	  	border-bottom: 1px solid black;
	  	border-collapse: collapse;
	  }
	  
</style>
</head>
<body>
<input type="hidden" id="ping">
<input type="hidden" id="pong" value="pong">
<header>
<span>로고가 보이는 상단</span>
<c:choose>
	<c:when test="${not empty ldto}">
		<div id="searchDiv" class="searchDiv">
			<input type="text" id="searchWord" onkeypress="if(event.keyCode==13) {searching(); return false;}"><button onclick="searching()">검색</button>
			<div hidden="hidden" id="searchResultDIV">
				<table id="searchResult"></table>
			</div>
		</div>

		<div id="menudiv">
			<button id="menuBtn" onclick="menu()">menu</button>
			
			<div id="menu" hidden="hidden">
				<ul>
					<li><a onclick="mypage()">마이페이지</a></li>
					<li><a onclick="notion()">공지사항</a></li>
					<li><a onclick="qna()">문의</a></li>
					<li><a onclick="logout()">로그아웃</a></li>
					<li><a onclick="alarm()">알림</a></li>
				</ul>
			</div>
		</div>
		
	</c:when>
</c:choose>
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
  				<li><a href="#tabs-12">로그인</a></li>
  				<li><a href="#tabs-13">회원가입</a></li>
  				<li><a href="#tabs-14">비밀번호찾기</a></li>
  			</c:when>
  			<c:otherwise>
  				<li id="tabs2"><a href="#tabs-2" class="idearS">프로젝트</a></li>
    			<li id="tabs3"><a href="#tabs-3" onclick="myS()">my지원</a></li>
    			<li id="tabs4" hidden="hidden"><a href="#tabs-4">지원사업</a></li>
    			<li id="tabs5" hidden="hidden"><a href="#tabs-5">my페이지</a></li>
    			<li id="tabs6" hidden="hidden"><a href="#tabs-6">공지사항</a></li>
    			<li id="tabs7" hidden="hidden"><a href="#tabs-7">문의</a></li>
    			<li id="tabs8" hidden="hidden"><a href="#tabs-8">로그아웃</a></li>
    			<li id="tabs9" hidden="hidden"><a href="#tabs-9">알림</a></li>
 <!--     			<li id="tabs10" hidden="hidden"><a href="#tabs-10">검색</a></li> -->
    			<li id="tabs10" hidden="hidden"><a href="#tabs-10">지원하기</a></li>
  			</c:otherwise>
  		</c:choose>
  	</ul>

	<c:choose>
		<c:when test="${empty ldto}">
		
			<div id="tabs-1" hidden="hidden" class="egtab">
<!-- 			<button id="guard">가이드</button> -->
			<!-- 초기화면 -->
				<div id="indexmain">
					<div id="continer">
						<div id="intro">
<!-- 							<iframe class="embed-responsive-item" width="850px" height="500px" id="player" src="//www.youtube.com/embed/kaMWDfbPjp0" data-step="1" data-intro="소개영상"></iframe> -->
								<iframe class="embed-responsive-item" width="850px" height="500px" id="player" src="//www.youtube.com/embed/wZTFsgheewk" data-step="1" data-intro="소개영상"></iframe>
							<!-- 유튜브 영상 사용할때 소스 -->
						</div>
					</div><!-- continer 의 끝 -->
				</div><!-- indexmain 끝 -->
			</div><!-- tabs-1 끝 -->
			
			<div id="tabs-12" hidden="hidden" class="egtab">
				<div id="loginForm" data-step="2" data-intro="로그인을 위한 입력창입니다.">
					<input type="text" value="login" name="command" hidden="hidden"/>
					<span>로그인</span>
					<br/>
					<input type="text" class="form-control" id="loginemail" name="email" placeholder="이메일"/>
					<br/>
					<input type="password" class="form-control" id="loginpwd" name="pwd" placeholder="비밀번호" pattern="[A-Za-z0-9]{6,16}"/>
					<button onclick="getlogin()" class="btn btn-success">로그인</button>
<!-- 					<button onclick="repassword()" class="btn btn-warning">비밀번호 찾기</button> -->
				</div>
				<div id="recoveryAccount" hidden="hidden">
					<br/>
					<input type="hidden" id="recoveryEmail" readonly="readonly">
					<button id="emailChk" onclick="recoveryCheck()">이메일 인증</button>
					<input type="text" id="chkCode" name="chkCode">
					<button id="recoveryBtn" disabled="disabled" onclick="recoverykeyChk()">복구</button>
					<input hidden="hidden" id="recoveryCode">
				</div>
			</div>
			
			<div id="tabs-13" hidden="hidden" class="egtab">
				<div id="regForm" data-step="3" data-intro="회원가입을 위한 입력창입니다.">
					<span>회원가입</span><br/>
					<input type="hidden" id="rNum">
					<input type="text" id="regemail" name="email" placeholder="이메일"/><button onclick="check()" id="keyBtn">인증코드보내기</button><br/>
					<input type="text" id="accKey" name="accKey"/><button id="keyChk" onclick="keyChk()" disabled="disabled">인증확인</button>
					<input type="text" id="pwd" placeholder="비밀번호"/>
					<button id="registBtn" onclick="regist()" disabled="disabled">회원가입</button>
				</div>
			</div>
			
			<div id="tabs-14" hidden="hidden" class="egtab">
				<div id="repassword">
					<input type="hidden" id="findrNum">
					<input type="text" id="findemail" name="email" placeholder="이메일"/><button id="findKeyBtn" onclick="findCheck()">인증번호전송</button><br/>
					<input type="text" id="findKey" name="findKey" placeholder="인증키"/><button id="findkeyChkBtn"onclick="findkeyChk()" disabled="disabled">인증키확인</button>
				</div>
			</div>
		
  		</c:when>
  		<c:otherwise>

			<div id="tabs-2" hidden="hidden" class="egtab">
<%-- 				<h1>${ldto.id} 님 환영합니다.</h1>	 --%>
				<div id="idearMain">
					<div>Welcome EGG1<br/>
						<iframe id="ptab" class="ifa" src="./selectProject.do" onclick="closeSearch()"></iframe>
					</div>
				</div>
			</div>
		
			<div id="tabs-3" hidden="hidden" class="egtab">
				마이지원<br/>
				<iframe id="mtab" class="ifa" src="./mySupportList.do" onclick="closeSearch()"></iframe>
			</div>
		
			<div id="tabs-4" hidden="hidden" class="egtab">
				<div id="supptyBis">
					지원사업공고들~~<br/>
					<iframe id="stab" class="ifa" src="./supportList.do"></iframe>
				</div>
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
			
			<div id="tabs-9" hidden="hidden" class="egtab">
				알림
				<div id="alarm">
					<table id="alarmtable">
						<tr>
							<th>제목</th><th>D-Day</th>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="tabs-10" hidden="hidden" class="egtab">
				<iframe id="itab" class="ifa"></iframe>
			</div>
		
  		</c:otherwise>
	</c:choose>
		
</div><!-- tabs 끝 -->
<footer>
	<span>회사 위치 뭐 그런게 적히는 하단부</span>
</footer>
</body>
</html>