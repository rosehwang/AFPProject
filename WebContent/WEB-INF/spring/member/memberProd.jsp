<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="/top.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align = "center">
	<table width="800">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">${param.id } 님의 가입 상품</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr height = "30" align = "center">
			<td width = "20%" class = "w3-2017-navy-peony">번호</td>
			<td width = "50%" class = "w3-2017-navy-peony">상품명</td>
			<td width = "40%" class = "w3-2017-navy-peony">가입일</td>
			</tr>
			
			<c:if test="${empty myProdList}">
				<tr height = "30">
					<td colspan = "3">가입한 상품이 없습니다.</td>
				</tr>
			</c:if>
			<%int a = 1;%>
   		   <c:forEach var="myProd" items="${myProdList}">
   		   <tr height = "30">
   		   <td align = "center"><%=a %></td>
   		   <td>&nbsp;${myProd.name}</td>
   		   <td align = "center">&nbsp;${myProd.day}</td>
     		 <% a++; %>
     		</tr>
      		</c:forEach>
      		<tr bgcolor=#cccbcf>
				<td colspan="3"></td>
			</tr>
			<tr align = "right">
		<td colspan = "3"><a href = "memberAll.do"><input type = "button" value = "회원 목록으로 돌아가기"></a></td>
		</tr>
			</table>
			</div>
</body>
</html>
<%@ include file="/bottom.jsp" %> 