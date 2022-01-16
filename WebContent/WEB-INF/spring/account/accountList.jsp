<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<html>
<body>
<script type="text/javascript">
function mapLocation(num){
	window.open("map_location.do?num="+num, "list", "width=800, height=600");
}
</script>

	
	
<% int a = 1; %>
<div align="center">
	 
	<table width="90%"> 
	<tr height = "30" ></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">금융 상품 목록</font></td>
			</tr>
			<tr height = "30"></tr>
		<tr height = "30">
			<td align="right"><a href="myAccount.do?id=<%=session.getAttribute("loginId")%>">
				<input type="button" class="w3-button w3-small w3-black" value="내 계좌 보기">
			</a></td>
		</tr>
	</table>
	<table width="90%">
		<tr height = "40" align = "center">
			<td bgcolor =#223A5E><font color = "white">순 서</font></td>
			<td bgcolor =#223A5E><font color = "white">종 목</font></td>
			<td bgcolor =#223A5E><font color = "white">판매 은행</font></td>
			<td width="30%" bgcolor =#223A5E><font color = "white">상품명</font></td>
			<td bgcolor =#223A5E><font color = "white">가입 대상</font></td>
			<td bgcolor =#223A5E><font color = "white">가입 기간</font></td>
			<td bgcolor =#223A5E><font color = "white">가입 금액</font></td>
			<td bgcolor =#223A5E><font color = "white">이자율</font></td>
			<td bgcolor =#223A5E><font color = "white">계좌 개설</font></td>
			<td bgcolor =#223A5E><font color = "white">판매 위치</font></td>
		</tr>
		<c:if test="${empty prodList}">
			<tr height = "40">
				<td colspan="9">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${prodList}">
			<tr height = "40">
				<td align="center"><%=a %></td><% a++; %>
				<td align="center">${dto.kind}</td>
				<td align="center">${dto.bank}은행</td>
				<td align="center"><a href="prod_content.do?num=${dto.num}">${dto.name}</a>
				<td align="center">${dto.member}대</td>
				<td align="center">${dto.duration}년</td>
				<td align="center">${dto.money}원</td>
				<td align="center">${dto.interest}%</td>
				<td align="center"><a href="new_account.do?id=<%=session.getAttribute("loginId")%>&num=${dto.num}"><input type="button" value="개설"></a></td>
				<td align="center"><a href="javascript:mapLocation(${dto.num})"><input type="button" value="위치"></a></td>
			</tr>
		</c:forEach>
		<tr  bgcolor=#cccbcf>
				<td colspan="10"></td>
			</tr>
	</table>
</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>






