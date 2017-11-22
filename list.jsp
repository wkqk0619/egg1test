<%@page import="java.util.List"%>
<%@page import="board.dto.Dto"%>
<%@page import="board.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%> <!-- 페이지 선언부 언어:자바 콘텐츠타입 : text/html 문자형식 : UTF-8 -->
<%request.setCharacterEncoding("UTF-8"); %>	<!-- 요청할때 문자형식을 UTF-8로 인코딩 -->
<%response.setContentType("text/html; charset=utf-8"); %> <!-- 반환하는 값의 타입을 지정 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$
	(
		function()
		{
			$("#allform").submit
			(
				function() 
				{
					if($("#allform input:checked").length==0)
					{
						alert("삭제하려면 뭘 삭제할지 선택은 해야 할것 아닌가");
						return false;
					}
				}
			);
		}	
	);
	
	function allCheck(chk)
	{
		var sel = document.getElementsByName("sel");
		for(var i = 0 ; i < sel.length ; i++)
		{
			sel[i].checked=chk;
		}
	}
</script>
<title>게시판</title>
</head>
<%
	Dao dao = new Dao();
	List<Dto> list =  dao.getAllBoard();
	int pg = Integer.parseInt(request.getParameter("pg")); // 10글 1조 보여줄 10개의글 팀번호
%>
<body>
	<div>
		<h1>게시판</h1>
		<form action="muldel.jsp" method="post" id="allform">
		<input type="hidden" name="pg" value="<%=pg%>">
			<table border="1">
				<col width="30"><col width="60"><col width="150"><col width="300"><col width="200">
				<tr>
					<th><input type="checkbox" id="all" onclick="allCheck(this.checked)"></th><th>번호</th><th>작성자</th><th>제목<th>작성일</th>
				</tr>
				<%
					if(list.size()==0)
					{
						%>
							<tr>
								<td colspan="5">게시판에 아무으으긋드 없네</td>
							</tr>
						<%
					}
					else
					{
						if(list.size()>10)
						{
							int pgn;
							if(list.size()%10==0)
							{
								pgn=10;
							}
							else
							{
								pgn=list.size()%10;
							}
							
							int a=0;
							
							if(list.size()%10==0)
							{
								a=1;
							}
							
							if(list.size()/10-a == pg)
							{
								for(int i = pg*10 ; i < pgn+pg*10 ; i++)
								{
									Dto dto = new Dto();
									dto = list.get(i);
									
									if(dto.getDelflag().equals("Y"))
									{
										%>
											<tr>
												<td colspan="5">--숙청되기전 무엇이라도 남기려 했지만 그의 바램과는 달리 남은 것은 삭제된 글의 흔적 뿐이었다.--</td>
											</tr>
										<%
									}
									else
									{
										%>
											<tr>
												<td><input type="checkbox" name="sel" value="<%=dto.getSeq()%>"></td>
												<td><%=dto.getSeq()%></td>
												<td><%=dto.getId()%></td>
												<td><a href="deteail.jsp?pg=<%=pg%>&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
												<td><%=dto.getRegdate()%></td>
											</tr>
										<%
									}
								}
							}
							else
							{
								for(int i = pg*10 ; i < 10+pg*10 ; i++)
								{
									Dto dto = new Dto();
									dto = list.get(i);
									if(dto.getDelflag().equals("Y"))
									{
										%>
											<tr>
												<td colspan="5">--숙청되기전 무엇이라도 남기려 했지만 그의 바램과는 달리 남은 것은 삭제된 글의 흔적 뿐이었다.--</td>
											</tr>
										<%
									}
									else
									{
										%>
											<tr>
												<td><input type="checkbox" name="sel" value="<%=dto.getSeq()%>"></td>
												<td><%=dto.getSeq()%></td>
												<td><%=dto.getId()%></td>
												<td><a href="deteail.jsp?pg=<%=pg%>&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
												<td><%=dto.getRegdate()%></td>
											</tr>
										<%
									}
								}
							}
						}
						else
						{
							for(int i = 0 ; i < list.size() ; i++)
							{
								Dto dto = new Dto();
								dto = list.get(i);
								if(dto.getDelflag().equals("Y"))
								{
									%>
										<tr>
											<td colspan="5">--숙청되기전 무엇이라도 남기려 했지만 그의 바램과는 달리 남은 것은 삭제된 글의 흔적 뿐이었다.--</td>
										</tr>
									<%
								}
								else
								{
									%>
										<tr>
											<td><input type="checkbox" name="sel" value="<%=dto.getSeq()%>"></td>
											<td><%=dto.getSeq()%></td>
											<td><%=dto.getId()%></td>
											<td><a href="deteail.jsp?pg=<%=pg%>&seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a></td>
											<td><%=dto.getRegdate()%></td>
										</tr>
									<%
								}
							}
						}
					}
				%>
			<tr>
				<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='addboard.jsp?pg=<%=pg%>'">
				<input type="submit" value="삭제">
				</td>
			</tr>
			</table>
		</form>
		<p>
			<%
				int a=1;
			
				if(list.size()%10==0)
				{
					a=0;
				}
				for(int i=0 ; i < list.size()/10 + a; i++) // 0은 걸러서 안들어옴  1~9 = 1	10 = 1  11~19 = 2 20 = 2
				{
					%>
						<span><a href="list.jsp?pg=<%=i%>"><%=i+1%></a></span>
					<%
				}
			%>
		</p>
	</div>
</body>
</html>