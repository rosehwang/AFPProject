<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<html>
<body>
<% int a = 1; %>
<div align="center">

	<table width="90%">
	<tr height = "30"></tr>
		<tr>
			<td align = "left" colspan="2"><font size = "6">금융 상품 목록</font></td>
		</tr>
	<tr height = "30"></tr>
	 <c:if test='${loginId eq "admin" }'>
		<tr>
			<td align="right"><a href="prod_insert.do"><input type = "button"  class="w3-button w3-small w3-black" value = "상품 추가하기"></a></td>
		</tr>
	</c:if>
	</table>
	<table width="90%">
		<tr bgcolor= #223A5E align = "center" height = "40">
			<td><font color= "white">순 서</font></td>
			<td><font color= "white">종 목</font></td>
			<td><font color= "white">판매은행</font></td>
			<td width="30%"><font color= "white">상품명</font></td>
			<td><font color= "white">가입 대상</font></td>
			<td><font color= "white">가입 기간</font></td>
			<td><font color= "white">가입 금액</font></td>
			<td><font color= "white">이자율</font></td>
		</tr>
		<c:if test="${empty prodList}">
			<tr>
				<td colspan="8">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${prodList}">
			<tr height=  "40">
				<td align="center"><%=a %></td><% a++; %>				
				<td align="center">${dto.kind}</td>
				<td align="center">${dto.bank}은행</td>
				<td align="center"><a href="prod_content.do?num=${dto.num}">${dto.name}</a></td>
				<td align="center">${dto.member}대</td>
				<td align="center">${dto.duration}년</td>
				<td align="center">${dto.money}원</td>
				<td align="center">${dto.interest}%</td>
			</tr>
		</c:forEach>
		<tr  bgcolor=#cccbcf>
				<td colspan="8"></td>
			</tr>
	</table>
</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>
