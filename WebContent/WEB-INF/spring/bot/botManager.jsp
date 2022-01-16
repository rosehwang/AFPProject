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
<c:if test='${! (loginId eq "admin") }'>
<script>
alert("괸리자만 이용이 가능합니다.")
location.href = "index.jsp"
</script>
</c:if>
<html>
<head>
	<title>봇 답변 관리</title>
</head>
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<style>
font{

	font-family: 'Nanum Gothic', sans-serif;
}

</style>
<body bgcolor = #ececec>
<div align="center">
<div class="w3-container">
  <p><button class="w3-button w3-black w3-round w3-right" Onclick="window.location = 'bot.do'">코코봇으로 돌아가기</button></p>
  </div>
<br>
	<table width = "300">
		<tr>
			<td align = "left">
				<font size = "6">답변 목록</font>
			</td>
		</tr>
		<tr>
		<td bgcolor = #223A5E></td>
		</tr>
	</table>
		<form name="list" method="post" action="botAnswerList.do">
			<table>
				<tr>
					<td>
						<input type="submit" value="목록보기">
					</td>
				</tr>
			</table>
	</form>
	<table width = "300">
		<tr>
			<td align = "left">
				<font size = "6">답변 등록</font>
			</td>
		</tr>
		<tr>
			<td bgcolor = #223A5E></td>
		</tr>
	</table>
	<form name="insert" method="post" action="insertAnswerBot.do">
		<table>
			<tr>
				<td>
					 <input type="text" name="bot_no" placeholder = "번호" maxlength="1"><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="bot_title" placeholder = "답변 제목"><br>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="bot_content" rows="11" cols="21" placeholder = "답변 내용"></textarea><br>
				</td>
			</tr>
			<tr>
				<td align = "center">
				<input type="submit" value="등록">&nbsp;
				<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</div>	
</body>
</html>











