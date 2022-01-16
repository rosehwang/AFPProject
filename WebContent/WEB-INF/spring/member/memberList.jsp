<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- memberAll.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<hr color="green" width="300">
	<h2>회 원 목 록</h2>
	<hr color="green" width="300">
	<table border="0" width="100%" class="outline">
		<tr bgcolor="yellow">
			<th class="m3">번호</th>
			<th class="m3">아이디</th>
			<th class="m3">이름</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">수정 | 삭제</th>
		</tr>
		<c:if test="${memberList==null || memberList.isEmpty()}">
		
			<tr>
				<td colspan="7">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${memberList}"> 

			<tr>
				<td align="right">${dto.no}</td>
				<td align="center">${dto.id}</td>
				<td align="center">${dto.name}</td>
				<td align="center">${dto.email}</td>
				<td align="center">${dto.hp1}-${dto.hp2 }-${dto.hp3}</td>
				<td align="center">${dto.joindate}</td>
				<td><a href="member_edit.do?no=${dto.no}">수정</a> | <a
					href="member_delete.do?no=${dto.no}">삭제</a></td>
			</tr>
		</c:forEach>
		</table>
</div>







