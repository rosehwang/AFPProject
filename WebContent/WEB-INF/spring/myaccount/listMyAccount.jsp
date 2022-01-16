<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="/top.jsp" %>
<html>
<body>
<% int a = 1; %>
	<div align="center">
	
		<form name="f" action="account_list.do">
			<table width="1000" class="outline">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">나의 계좌 리스트</font></td>
			</tr>
			<tr height = "30"></tr>
				<tr height = "40" align ="center">
					<td bgcolor =#223A5E><font color= "white">순 서</font></td>
					<td bgcolor =#223A5E><font color= "white">은행명</font></td>
					<td bgcolor =#223A5E><font color= "white">종 목</font></td>
					<td bgcolor =#223A5E><font color= "white">상품명</font></td>
					<td bgcolor =#223A5E><font color= "white">가입기간</font></td>
					<td bgcolor =#223A5E><font color= "white">가입금액</font></td>
					<td bgcolor =#223A5E><font color= "white">이자율/금리</font></td>
					<td bgcolor =#223A5E><font color= "white">가입일</font></td>
				</tr>
				<c:if test="${empty accountList}">
			<tr height = "40">
				<td colspan="9">가입한 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto3" items="${accountList}">
			<tr height = "40">
				<td align="center"><%=a %></td><% a++; %>
				<td align="center">${dto3.bank}은행</td>
				<td align="center">${dto3.kind}</td>
				<td align="center"><a href="myAccountContent.do?id=<%=session.getAttribute("loginId")%>&num=${dto3.num}">${dto3.name}</a></td>
				<td align="center">${dto3.duration}</td>
				<td align="center">${dto3.money}원</td>
				<td align="center">${dto3.interest}%</td>
				<td align="center">${dto3.day}</td>
			</tr>
		</c:forEach>
			<tr  bgcolor=#cccbcf>
				<td colspan="9"></td>
			</tr>
			<tr><td height = "30"></td></tr>
				<tr>
					<td colspan="9" align="center">
					<input type="submit" class="w3-button w3-small w3-black" value="돌아가기">
					</td>
				</tr>
			</table>
		</form>	
	</div>
	</body>
	</html>
	<%@ include file="/bottom.jsp" %>