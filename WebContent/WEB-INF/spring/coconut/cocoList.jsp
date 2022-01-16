<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
	<title>My Coconut</title>
	<script type="text/javascript">
	var isLogin = '<c:out value="${loginId}"/>';
	if(isLogin == null || isLogin.trim()=="") {
		alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
		location.href = "index.jsp"
	}
		function selfClose(){
			self.close()			
		}
	</script>
</head>
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<style>
table
{
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body bgcolor = "ececec">
	<div align="center">

		<form name="f" action="prod_deletePro.do" method="post">
			<table width="500" class="outline">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="3"><font size = "6">나의 Coconut</font></td>
			</tr>
			<tr height = "30"></tr>
			
			<tr align = "center" height = "30">
					<td bgcolor =#223A5E><font color = "white">ID</font></td>
					<td bgcolor =#223A5E><font color = "white">생성 날짜</font></td>
					<td bgcolor =#223A5E><font color = "white">기능</font></td>
				</tr>
				<c:if test="${empty dto}">
					<tr height = "30">
						<td align="center" colspan="3">코코넛이 존재하지 않습니다!</td>
					</tr>
				</c:if>
				<c:if test="${dto!=null}">
				<tr height = "30">
					<td align="center">${dto.id}</td>
					<td align="center">${dto.day}</td>
					<td align="center"><a href="coconut_delete.do"><input type = "button" value = "삭제"></a></td>
				</tr>
				</c:if>
				<tr  bgcolor=#cccbcf>
				<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<a href="javascript:selfClose()"><input type="button" class="w3-button w3-small w3-black" value="확인"></a>
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>