<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	var msg = "${msg}"
	if(msg != "" && msg != null) {
		alert(msg)
	}else {
		alert("경고 : Coconut을 삭제하면 계좌를 추가 개설할 수 없습니다!!")
	}
	window.onload = function() {
		document.f.passwd.focus()
	}
</script>
<title>코코넛 삭제 1차 인증</title>
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
	<form name="f" action="coconut_delete1.do" method="post">
		<table align="center">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="3"><font size = "6">1차 비밀번호 입력</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr>
				<th align="center">로그인 비밀번호 입력</th>
				<td><input type="password" name="passwd">
				<input type="hidden" name="id" value=<%=session.getAttribute("loginId")%>>
				</td>
			</tr>
			<tr><td height = "30"></td></tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" class="w3-button w3-small w3-black" value="확인">&nbsp;
				<input type="reset" class="w3-button w3-small w3-black" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>