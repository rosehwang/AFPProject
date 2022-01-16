<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<title>답변 목록</title>
</head>
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<style>
body, tr, td{

	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body bgcolor = #ececec>
<div align="center">
	<table width = "500">
		<tr>
			<td align = "left">
				<font size = "6">답변 목록</font>
			</td>
		</tr>
		<tr>
			<td align = "right">
				<input type = "button" value = "코코봇 관리로 돌아가기" onClick = "window.location ='botManager.do'">
			</td>
		</tr>
	</table>
	
	<table width="500">
		<tr bgcolor =#223A5E align ="center" height = "30">
			<td width = "10%"><font color = "white">번호</font></td>
			<td width = "20%"><font color = "white">답변 제목</font></td>
			<td width = "50%"><font color = "white">답변 내용</font></td>
			<td width = "20%"><font color = "white">수정 | 삭제</font></td>
		</tr>
		<c:if test="${list==null or list.isEmpty()}">
		<tr>
			<td colspan="4">등록된 답변이 없습니다.</td>		
		</tr>			
		</c:if>
		<c:forEach var="dto" items="${list}">
		<tr align="center">
			<td>${dto.bot_no}</td>
			<td>${dto.bot_title}</td>
			<td>${dto.bot_content}</td>
			<td>
			<a href = "updateAnswerBot.do?bot_no=${dto.bot_no }">수정</a> |
			<a href = "deleteAnswerBot.do?bot_no=${dto.bot_no }"> 삭제</a>
			</td>
		</tr>
		</c:forEach>
		<tr bgcolor=#cccbcf>
				<td colspan="4"></td>
		</tr>
	</table>
</div>
</body>
</html>





