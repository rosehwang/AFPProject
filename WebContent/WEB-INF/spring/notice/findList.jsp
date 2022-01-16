<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<c:if test="${empty loginId}">
			<script>
		alert("로그인 후 이용이 가능합니다.")
		window.location = "index.jsp"
			</script>
</c:if>
 <script>
	function logout() {
		if (confirm("로그아웃 하시겠습니까?") == true) {
			window.location = "logout.do"
			self.close()
		} else {

			return;
		}
	}
</script>
<style>
a:link{
	text-decoration:none;
}
a:visited{/* 한번방문 */
	text-decoration:none;
}

</style>

<div align="center">
	<table width="800">
		<tr height = "30"></tr>
			<tr><td align ="left" colspan = "5"><font size = "6">공지사항</font></td></tr>
		<tr height = "30"></tr>
	<tr bgcolor =#223A5E  height = "30" align = "center">
				<td width="60%"><font color = "white">제목</font></td>
				<td width="20%"><font color = "white">작성일</font></td>
				<td width="10%"><font color = "white">파일</font></td>
				<td width="10%"><font color = "white">조회 수</font></td>
		</tr>
		<c:if test="${empty findList}">
			<tr>
				<td colspan="4">검색된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${findList}">
			<tr>
				<td><a href="notice_content.do?notice_no=${dto.notice_no}">&nbsp;${dto.notice_title}</a>
				</td>
				<td align="center">${dto.notice_regdate}</td>
				<td align="center"><c:choose>
						<c:when test="${dto.notice_filesize > 0}">
							<!-- 파일이 있으면 -->
							<img src="<%=request.getContextPath()%>/images/folder.gif">
						</c:when>
						<c:otherwise>
							<!-- 파일이 없으면 -->
							<img src="<%=request.getContextPath()%>/images/level.gif">
						</c:otherwise>
					</c:choose></td>
				<td align="center">${dto.notice_readcount}</td>
			</tr>
		</c:forEach>
		<tr bgcolor=#cccbcf>
				<td colspan="4"></td>
		</tr>
		<tr height = "30"></tr>
		<tr>
			<td align="center" colspan = "5">
				<%
					String type = request.getParameter("type");
					String word = request.getParameter("word");

						if (type.equals("notice_title")) {

							type = "제목";
						} else if (type.equals("notice_content")) {
							type = "내용";
						} 
				%> 검색 조건 '<%=type%>'으로 '<%=word%>'이 포함된 검색 결과입니다.
			</td>
		</tr>

		<tr align = "right">
		<td colspan = "5"><input type = "button" value = "전체 목록으로 돌아가기" onclick = "window.location='notice_list.do'"></td>
		</tr>
	
		</table>
	</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>