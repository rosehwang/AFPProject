<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<html>
<head>
<title>내 금융상품 상세보기</title>
</head>
<body>
<div align="center">
<h2>내 금융상품 상세보기</h2>
<table width="1000">
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">번호</font></td>
		<td>&nbsp;&nbsp;${content.num}</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">은행</font></td>
		<td>&nbsp;&nbsp;${content.bank}은행</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">상품 종목</font></td>
		<td>&nbsp;&nbsp;${content.kind}</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">상품명</font></td><!-- 해당금융상품 상세보기 링크 -->
		<td>&nbsp;&nbsp;<a href="prod_content.do?num=${content.num}">${content.name}</a></td>
	</tr>
	<tr height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">계좌번호</font></td>
		<td>&nbsp;&nbsp;${content.accountNum}</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">가입기간</font></td>
		<td>&nbsp;&nbsp;${content.duration}</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">가입금액</font></td>
		<td>&nbsp;&nbsp;${content.money}원</td>
	</tr>
	<tr  height = "30">
		<td align="center" bgcolor= #223A5E><font color="white">금리안내</font></td>
		<td>&nbsp;&nbsp;${content.interest}%</td>
	</tr>
	<tr height = "30">
		<td align="center"  bgcolor= #223A5E><font color="white">가입일</font></td>
		<td>&nbsp;&nbsp;${content.day}</td>
	</tr>
	<tr height = "30" align="center">
		<td colspan="2"><input type = "button"  class="w3-button w3-small w3-black"  id = "back" value = "뒤로가기"></td>
	</tr>
</table>
</div>
</body>
</html>
<script type="text/javascript">
	document.getElementById("back").onclick = function() { // 뒤로가기 기능(캐시값 유지를 위해)
		history.back();
	}
</script>
<%@ include file="/bottom.jsp" %>