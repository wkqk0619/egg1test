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

	function insertQnaForm() 
	{
		$("#insertQnaForm").show();
	}
	
	function insertCancel() 
	{
		$("#insertQnaForm").hide();
	}
	
	function ajaxNotionDetail(val)
	{
		$.ajax
		(
			{
				type: "POST",
				url: "./ajaxQnaDetail.do",
				data:"aseq="+val,
				async:true,
				success:function(msg)
				{
					outTable(msg);
				}
			}
		);
	}

	function outTable(node)
	{
		var aseq = node.dto.aseq;
		var id = node.dto.id;
		var title = node.dto.title;
		var content = node.dto.content;
		var regdate = node.dto.regdate;
		
		var isS = node.isS;
		
		if(isS)
		{
			$(".my").show();
			$(".other").hide();
		}
		else
		{
			$(".my").hide();
			$(".other").show();
		}
		
		$(".aseq").val(aseq);
		$(".qnaid").val(id);
		$(".qnatitle").val(title);
		$(".qnacontent").val(content);
		$(".qnaregdate").val(regdate);
		$("#qnaDetail").toggle();
	}
	
	function deleteQna()
	{
		var val = $("#aseq").val();
		location.href="./deleteQna.do?aseq="+val;
	}
	
	function updateQna() 
	{
		$("#updateQna").show();
	}
	
	function updateCancel() 
	{
		$("#updateQna").hide();
	}
	
	function insertReplyQna() 
	{
		$("#insertReplyQna").show();
	}
	
	function replyCancel() 
	{
		$("#insertReplyQna").hide();
	}
	
	$( function() {
    	var introi=introJs("#qnaIntro");
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
	<c:choose>
		<c:when test="${ldto.role eq 'U'.charAt(0)}">
			<button id="guard">가이드</button>
		</c:when>
	</c:choose>
	<div id="qnaIntro">
	<table class="table table-striped table-bordered table-responsive" data-step="1" data-intro="작성한 문의글 및 답변">
		<tr>
			<th>제목</th>
			<c:choose>
				<c:when test="${ldto.role ne 'U'.charAt(0)}">
					<th>작성자</th>
				</c:when>
			</c:choose>
			<th>작성일</th>
		</tr>

		<c:choose>
			<c:when test="${empty list}">
				<tr>
					
					<c:choose>
						<c:when test="${ldto.role ne 'U'.charAt(0)}">
							<td colspan="3">
								작성된 문의가 없다네
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="2">
								작성된 문의가 없다네
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
						<tr onclick="ajaxNotionDetail(${dto.aseq})">
							<td>
								<c:forEach var="i" begin="0" end="${dto.depth}" step="1">
									<c:if test="${i>0}">
										&nbsp;&nbsp;
									</c:if>
								</c:forEach>
								${dto.title}
							</td>
							<c:choose>
								<c:when test="${ldto.role ne 'U'.charAt(0)}">
									<td>${dto.id}</td>
								</c:when>
							</c:choose>
							<td>${dto.regdate}</td>
						</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	<c:choose>
		<c:when test="${ldto.role eq 'U'.charAt(0)}">
			<button onclick="insertQnaForm()">문의작성</button>
		</c:when>
		<c:otherwise>
			<button onclick="location.href='./LoginMain.do'">메인으로</button>		
		</c:otherwise>
	</c:choose>
	
	<div id="insertQnaForm" hidden="hidden">
		<form action="./insertQna.do" method="post">
			<input type="hidden" name="id" value="${ldto.id}">
<!-- 			<input type="text" name="title"> -->
<!-- 			<textarea rows="10" cols="20" name="content"></textarea> -->
<!-- 			<input type="submit" value="작성"> -->
<!-- 			<input type="button" value="취소" onclick="insertCancel()"> -->
			<table class="table table-bordered table-responsive">
				<tr>
					<th>제목</th><td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th><td><textarea rows="10" cols="20" name="content"></textarea></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="작성">
						<input type="button" value="취소" onclick="insertCancel()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="qnaDetail" hidden="hidden">
		<input type="hidden" class="aseq" id="aseq" name="aseq">
<!-- 		<input class="qnaid" type="text" name="id" id="id" readonly="readonly"/> -->
<!-- 		<input class="qnatitle" type="text" name="title" readonly="readonly"/> -->
<!-- 		<textarea class="qnacontent" name="content" rows="10" cols="20" readonly="readonly"></textarea> -->
<!-- 		<input type="text" class=qnaregdate name="regdate" readonly="readonly"/> -->
		<%-- 
		<c:choose>
			<c:when test="${ldto.role ne 'U'.charAt(0)}">
				<button onclick="insertReplyQna()">답글</button>
			</c:when>
		</c:choose>
		 --%>
		 <table class="table table-striped table-bordered table-responsive">
		 	<tr>
		 		<th>작성자</th><td><input class="qnaid" type="text" name="id" id="id" readonly="readonly"/></td>
		 	</tr>
		 	<tr>
		 		<th>제목</th><td><input class="qnatitle" type="text" name="title" readonly="readonly"/></td>
		 	</tr>
		 	<tr>
		 		<th>내용</th><td><textarea class="qnacontent" name="content" rows="10" cols="20" readonly="readonly"></textarea></td>
		 	</tr>
		 	<tr>
		 		<th>작성일</th><td><input type="text" class=qnaregdate name="regdate" readonly="readonly"/></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2">
		 			<button class="my" onclick="updateQna()">수정</button>
					<button class="my" onclick="deleteQna()">삭제</button>
					<button class="other" onclick="insertReplyQna()">답글</button>
				</td>
		 	</tr>
		 </table>
<!-- 		<button class="my" onclick="updateQna()">수정</button> -->
<!-- 		<button class="my" onclick="deleteQna()">삭제</button> -->
<!-- 		<button class="other" onclick="insertReplyQna()">답글</button> -->
	</div>
	
	<div id="insertReplyQna" hidden="hidden">
		<form action="./insertReplyQna.do" method="post">
			<input type="hidden" class="aseq" name="aseq">
			<input type="hidden" name="id" value="${ldto.id}">
<!-- 			<input type="text" name="title"/> -->
<!-- 			<textarea name="content" rows="10" cols="20"></textarea> -->
<!-- 			<input type="submit" value="답글작성"> -->
<!-- 			<input type="button" value="취소" onclick="replyCancel()"> -->
			<table class="table table-bordered table-responsive">
				<tr>
					<th>제목</th><td><input type="text" name="title"/></td>
				</tr>
				<tr>
					<th>내용</th><td><textarea name="content" rows="10" cols="20"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="답글작성">
						<input type="button" value="취소" onclick="replyCancel()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="updateQna" hidden="hidden">
		<form action="./updateQna.do" method="post">
			<input type="hidden" class="aseq" name="aseq">
			<input class="qnatitle" type="text" name="title"/>
			<textarea class="qnacontent" name="content" rows="10" cols="20"></textarea>
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="updateCancel()">
		</form>
	</div>
	</div><!-- qnaIntro 끝 -->
</body>
</html>