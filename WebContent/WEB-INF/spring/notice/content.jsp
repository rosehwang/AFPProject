<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<c:if test="${empty loginId}">
			<script>
		alert("로그인 후 이용이 가능합니다.")
		window.location = "index.jsp"
			</script>
</c:if>
<script type="text/javascript">
	function deleteConfirm() {
		if (confirm("정말 삭제하시겠습니까?") == true) {
			window.location = "notice_delete.do?notice_no=${dto.notice_no}"
			self.close()
		} else {

			return;
		}
	}
</script>
<html>
<head>
<title>글 읽기</title>
</head>

<body>
	<div align="center">
		<table width="800">
			<tr height = "30"></tr>
			<tr><td align ="left" colspan = "3"><font size = "6">공지사항</font></td></tr>
			<tr height = "30"></tr>
			<tr height = "30" bgcolor =#223A5E>
				<td width="70%"><font color = "white">&nbsp;${dto.notice_title}</font></td>
				<!-- title -->

				<td align="center" width="20%"><font color = "white">작성일 ${dto.notice_regdate}</font></td>
				<!-- regdate -->

				<td align="center" width="10%"><font color = "white">조회수 ${dto.notice_readcount}</font></td>
				<!-- readcount -->
			</tr>

			<tr>
				<!-- content -->
				<td colspan="3">${dto.notice_content}<br> <br> <br>
					<br> <br></td>

			</tr>

			<tr>
				<!-- file -->
				<td colspan = "3" align = "left">첨부파일&nbsp;&nbsp;
                      <c:choose>
                      <c:when test="${dto.notice_filesize > 0}">
							<!-- 파일이 있으면 -->
							<%
								String upPath = config.getServletContext().getRealPath("/files");
							%>
							<a href="noticefileDownload.do?notice_file=${dto.notice_file}">${dto.notice_file}</a>
						</c:when>
						<c:otherwise>
							<!-- 파일이 없으면 -->
					첨부 파일이 없습니다.
				</c:otherwise>
					</c:choose>

			</tr>
			<tr bgcolor=#cccbcf>
				<td colspan="3"></td>
			</tr>
	<tr align="right">
	<td colspan="3">
<% if (session.getAttribute("loginId").equals("admin")){ %>			
			
				<input
					type="button" value="수정"
					onclick="window.location='notice_update.do?notice_no=${dto.notice_no}'">&nbsp;&nbsp;
					
					<input type="button" value="삭제"
					onclick="return deleteConfirm()">&nbsp;&nbsp;
<%} %>					
	
					<input type="button" value="목록으로"
					onclick="window.location='notice_list.do'"></td>
			</tr>
			
		</table>
	</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>