
<%@page import="org.jdom2.JDOMException"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="com.xml.XmlTest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
   $(".urlinfo").click(function() {
      $.get("https://cors-anywhere.herokuapp.com/"+$(this).val(), function(data) {
          var meta = $(data).filter('meta[property="og:description"]');
          //alert();
          $("#alertpr2").val($(meta).attr("content"));
          $("#alertpr2").toggle();
      });
   });
});

</script>
</head>
<body>
<div id="g1group"></div>
<form action="BackDataTest.do" method="post">
<input type="hidden" name="command" value="backData"/>
<% XmlTest xt = new XmlTest();
List<Element> lis_E= xt.asdf();
for(int i=0; i<lis_E.size(); i++){
	   Element person_E=lis_E.get(i);
 		//System.out.println("firstName="+person_E.getValue());
 		%>
 		<div class="eg">
 			<span class="maintitle"><%=person_E.getChildText("title")%></span>
 			<div>
 				<span><%=person_E.getChildText("areaname")%></span>
 				<span><%=person_E.getChildText("enddate")%></span>
 				<span>
 					<a href="<%=person_E.getChildText("detailurl")%>">
 						<%=person_E.getChildText("biztitle")%>
 					</a>
 				</span>
 				<span><%=person_E.getChildText("insertdate")%></span>
 				<span><%=person_E.getChildText("organizationname")%></span>
 				<span><%=person_E.getChildText("enddate")%></span>
 				<hr/>
 				<input type="text" value="<%=person_E.getChildText("areaname")%>" name="areaname"/>
 				<input type="text" value="<%=person_E.getChildText("biztitle")%>" name="biztitle"/>
 				<input type="text" value="<%=person_E.getChildText("detailurl")%>" name="detailurl"/>
 				<input type="text" value="<%=person_E.getChildText("enddate")%>" name="enddate"/>
 				<input type="text" value="<%=person_E.getChildText("insertdate")%>" name="insertdate"/>
 				<input type="text" value="<%=person_E.getChildText("organizationname")%>" name="organizationname"/>
 				<input type="text" value="<%=person_E.getChildText("posttarget")%>" name="posttarget"/>
 				<input type="text" value="<%=person_E.getChildText("posttargetage")%>" name="posttargetage"/>
 				<input type="text" value="<%=person_E.getChildText("posttargetcomage")%>" name="posttargetcomage"/>
 				<input type="text" value="<%=person_E.getChildText("startdate")%>" name="startdate"/>
 				<input type="text" value="<%=person_E.getChildText("supporttype")%>" name="supporttype"/>
 				<input type="text" value="<%=person_E.getChildText("title")%>" name="title"/>
 			</div>
 		</div>
 		<%}%>
 		<input type="submit" value="테스트"/>
 </form>		
</body>
</html>