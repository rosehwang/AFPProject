<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>

<script type="text/javascript">
	function deleteConfirm() {
		if (confirm("정말 삭제하시겠습니까?") == true) {
			window.location = "news_delete.do?news_no=${dto.news_no}"
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
			<tr><td align ="left" colspan = "3"><font size = "6">새 소식</font></td></tr>
			<tr height = "30"></tr>
			<tr height = "30" bgcolor =#223A5E>
				<td align="left" width="70%"><font color = "white">&nbsp;${dto.news_title}</font></td>
				<!-- title -->

				<td align="center" width="20%"><font color = "white">작성일 ${dto.news_regdate}</font></td>
				<!-- regdate -->

				<td align="center" width="10%"><font color = "white">조회수 ${dto.news_readcount}</font></td>
				<!-- readcount -->
			</tr>

			<tr>
				<!-- content -->
				<td colspan="3">&nbsp;${dto.news_content}<br> <br> <br> <br> <br></td>
			</tr>

			<tr>
				<!-- file -->
				<td colspan="3" align="left">첨부파일&nbsp;&nbsp; 
				<c:choose>
						<c:when test="${dto.news_filesize > 0}">
							<!-- 파일이 있으면 -->
							<%
								String upPath = config.getServletContext().getRealPath("/files");
							%>
							<a href="fileDownload.do?news_file=${dto.news_file}">${dto.news_file}</a>
						</c:when>
						<c:otherwise>
							<!-- 파일이 없으면 -->
					첨부 파일이 없습니다.
				</c:otherwise>
					</c:choose></td>
			</tr>
			<tr bgcolor=#cccbcf>
				<td colspan="3"></td>
			</tr>

			<tr align="right">
			<td colspan="3">
				<c:if test='${loginId eq "admin"}'>
					<input type="button" value="수정"
					onclick="window.location='news_update.do?news_no=${dto.news_no}'">&nbsp;&nbsp;
					<input type="button" value="삭제" onclick="return deleteConfirm()">&nbsp;&nbsp;
			</c:if>
				
					<input type="button" value="목록으로"
					onclick="window.location='news_list.do'"></td>
			</tr>
		</table>
	</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>