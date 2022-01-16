<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<html>
<body>
<script type="text/javascript">
	var msg = "${msg}"
	if(msg != "" && msg != null) {
		alert(msg)
	}
	window.onload = function() {
		document.f.key.focus()
	}
</script>
<div align="center">
	<form name="f" action="third_pass.do" method="post">
		<table align="center">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">3차 공인인증 확인</font></td>
			</tr>
			<tr height = "30"></tr>
			<%int image= (int)(Math.random()*5+1);
			System.out.println(image+"번");%>
			<tr>
				<td align="center" colspan="2">
				<img src="<%=request.getContextPath()%>/coconut_images/<%=image%>.jpg" width="400" height="250" border="0"></td>
			</tr>
			<tr>
				<th align="center">위 그림은 무엇인가요?</th>
				<td><input type="text" name="key">
				<input type="hidden" name="num" value=<%=image %>>
				<input type="hidden" name="id" value=<%=session.getAttribute("loginId") %>>
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
<%@ include file="/bottom.jsp" %>