<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script type="text/javascript">
var isLogin = '<c:out value="${loginId}"/>';
if(isLogin == null || isLogin.trim()=="") {
	alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
	location.href = "index.jsp"
}
</script>
<script type="text/javascript">
function checkNo() {
	if (f.userChoiceNo.value == "") {
		alert("번호를 입력해 주세요.");
		f.userChoiceNo.focus();
		return ;
	}
	document.f.submit();
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<style>
body,input[type="button"],input[type="submit"]{

	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body bgcolor = #ececec>
<c:if test='${ (loginId eq "admin") }'>
<div class="w3-container">
  <p><button class="w3-button w3-black w3-round w3-right" Onclick="window.location = 'botManager.do'">코코봇 관리</button></p>
  </div>
</c:if>
<div align = "center" valign = "center">
<table width = "320" height = "400" border ="1"  style='float:left;'>
<tr valign="top" height = "90%">
<td>
<table width = "300">
<tr>
<td align = "left">
"안녕하세요! 코코봇입니다~<br>
번호를 입력해 주세요!"
</td>
</tr>

<% String answerOk = (String)request.getAttribute("mode");
if(answerOk.equals("ok"))
{
%>
<tr>
<td align = "right" border = "1">
"${userChoiceNo}"
</td>
</tr>

<%if(request.getAttribute("dto")!=null){%>
<tr>
<td align = "left" border = "1">
"${dto.bot_content} 다른 문의사항은 1:1문의, 이메일 상담, 전화 상담을 이용해 주세요."
</td>
</tr>
<%} %>
<c:if test="${dto==null}">
		<tr>
		<td>
			"등록된 번호가 아닙니다. 다시 입력해 주세요."
			</td>
		</tr>			
</c:if>
<% }%>
</table>
</td>
</tr>
<tr>
<td>
<form name = "f" action = "bot.do" method = "post">
<input type = "text" name = "userChoiceNo" size ="30">
<input type = "button" value = "전송" onClick = "javascript:checkNo()">
</form>
</td>
</tr>

<div class="w3-bar-block w3-border w3-2017-navy-peony" style="width:260px; float:left;">

<c:if test="${empty answerList}">
				 <div class="w3-bar-item">등록된 번호가 없습니다.</div>
</c:if>
<c:forEach var="dto" items="${answerList}">
  <div class="w3-bar-item">${dto.bot_no }. ${dto.bot_title }</div>
</c:forEach>
</div>


</div>
</body>
</html>