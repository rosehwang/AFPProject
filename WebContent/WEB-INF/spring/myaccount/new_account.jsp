<%@page import="product.dto.ProductDTO"%>
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
<form name="f" action="insert_NewAccount.do" method="post">
	<table width="500" align="center">
		<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">새 금융상품 가입하기</font></td>
			</tr>
			<tr height = "30"></tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">은행</td>
			<td width="60%">&nbsp;${dto1.bank }
			<input type="hidden" name="id" value=<%=session.getAttribute("loginId") %>>
			<input type="hidden" name="num" value='<%=session.getAttribute("num")%>'>
			<input type="hidden" name="bank" value="${dto1.bank }">
			</td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">위치</td>
			<td>&nbsp;${dto1.location }</td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">상품 종목</td>
			<td>&nbsp;${dto1.kind }
			<input type="hidden" name="kind" value="${dto1.kind }">
			</td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">상품명</td>
			<td>&nbsp;${dto1.name }
			<input type="hidden" name="name" value="${dto1.name }">
			</td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">가입기간</td>
			<td>
				&nbsp;<select name="duration">
					<option value="6개월">6개월</option>
					<option value="1년">1년</option>
					<option value="2년">2년</option>
					<option value="3년">3년</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">월 가입금액 / 대출금액</td>
			<td>&nbsp;<input type="text" name="money"></td>
		</tr>
		<tr height = "30">
			<td width="40%" class="w3-2017-navy-peony" align = "center">적용금리</td>
			<td>&nbsp;<input type="text" name="interest"></td>
		</tr>
		<tr><td height = "30"></td></tr>
		<tr height = "30">
			<td colspan="2" align="center">
				<a href="javascript:check2()"><input type="button" class="w3-button w3-small w3-black" value="가입완료"></a>
			</td>
		</tr>
		<tr><td height = "30"></td></tr>
		
		<tr>
		<td align = "center" colspan = "2">
		<input type="reset" class="w3-button w3-small w3-black" value="초기화">
				&nbsp;
				<a href="account_list.do"><input type="button" class="w3-button w3-small w3-black" value="돌아가기"></a>
		</td>
		</tr>

	</table>
</form>
</body>
</html>
<%@ include file="/bottom.jsp" %>