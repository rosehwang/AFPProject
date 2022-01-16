<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<script type="text/javascript">
	var msg = "${msg}"
	if(msg != "" && msg != null) {
		alert(msg)
	}
</script>
<html>
<body>
<div align="center">
	<form name="f" action="new_pass1.do" method="post">
		<table align="center">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">1차 비밀번호 입력</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr>
				<th align="center">로그인 비밀번호 입력</th>
				<td><input type="password" name="passwd">
				<input type="hidden" name="id" value=<%=session.getAttribute("loginId")%>>
				<input type="hidden" name="num" value='<%=session.getAttribute("num")%>'>
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
<script type="text/javascript">
	document.f.passwd.focus()
</script>
<%@ include file="/bottom.jsp" %>