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
				<td align = "left" colspan="3"><font size = "6">회원 검색 결과</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr class = "w3-2017-navy-peony" align ="center" height = "30">
				<td width = "10%">이름</td>
				<td width = "15%">ID</td>
				<td width = "20">생년월일</td>
				<td width = "25%">이메일</td>
				<td width = "25%">전화번호</td>
			</tr>
			
			<c:if test="${empty findList}">
				<tr height = "30">
					<td colspan="5">검색된 회원이 없습니다.</td>
				</tr>
			</c:if>
			
			<c:forEach var="dto" items="${findList}">
				<tr height = "30" align ="center">
					<td>${dto.name}</td>
					<td>${dto.id}</td>
					<td>${dto.ssn}</td>
			<c:choose>
				<c:when test="${empty dto.email}">
					<td>없음</td>
				</c:when>
				<c:otherwise>
					<td>${dto.email}</td>
				</c:otherwise>
			</c:choose>
					
			<c:choose>
				<c:when test="${empty dto.hp1}">
					<td>없음</td>
				</c:when>
				<c:otherwise>
					<td>${dto.hp1}-${dto.hp1}-${dto.hp1}</td>
				</c:otherwise>
			</c:choose>
				</tr>
		</c:forEach>
		<tr bgcolor=#cccbcf>
			<td colspan="5"></td>
		</tr>
		
		<tr height = "30"></tr>
		<tr>
			<td align="center" colspan = "5">
				<%
					String searchMode = request.getParameter("searchMode");
					String word = request.getParameter("word");

						if (searchMode.equals("name")) {

							searchMode = "이름";
						} else if (searchMode.equals("ID")) {
							searchMode = "ID";
						} 
				%> 검색 조건 '<%=searchMode%>'으로(로) '<%=word%>'이(가) 포함된 검색 결과입니다.
			</td>
		</tr>
		
		<tr align = "right">
		<td colspan = "5"><a href = "memberAll.do"><input type = "button" value = "회원 목록으로 돌아가기"></a></td>
		</tr>
		</table>
		</div>
</body>
</html>
  <%@ include file="/bottom.jsp" %>