<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<c:if test='${! (loginId eq "admin") }'>
<script>
alert("괸리자만 이용이 가능합니다.")
location.href = "index.jsp"
</script>
</c:if>
<script type="text/javascript">
function writeSave() {
	if (f.news_title.value == "") {
		alert("제목을 입력하세요!!")
		f.news_title.focus()
		return false
	}
	document.f.submit();
}
</script>
<div align="center">
	<form name="f" action="news_update.do" method="post"
		enctype="multipart/form-data">
		<input type = "hidden" name = "news_no" value = "${dto.news_no}">
		<table width="600">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">새 소식 수정</font></td>
			</tr>
			<tr height = "30"></tr>
			
			<tr>
				<td width="30%" height = "40" align="center" bgcolor =#223A5E><font color = "white">제 목</font></td>
				<td><input type="text" value = "${dto.news_title}" name="news_title" size="50" maxlength="50"></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgcolor =#223A5E><font color = "white">내 용</font></td>
				<td><textarea name="news_content" rows="17" cols="52">${dto.news_content}</textarea></td>
			</tr>
			<tr height = "50">
				<td width="30%" align="center" rowspan = "2" bgcolor =#223A5E><font color = "white">파일 첨부</font></td>
				<td>
				
				<c:choose>
				<c:when test="${dto.news_filesize > 0}">
				기존 파일: ${dto.news_file}
				 </c:when>
				 <c:otherwise>
				 기존 파일 없음.
				 </c:otherwise>
				 </c:choose>
				<input type="file" name="news_file">
				</td>
			</tr>
			<tr>
				<td>
				기존 파일 삭제 하기 <input type = "checkbox" name = "fileClear" value = "chk">
				</td>
			</tr>
			<tr height = "40">
				<td colspan="2" align="center"><a href = "javascript:writeSave()"><input type="button" value="수정 완료"></a>
			</tr>
			<tr height = "40">
				<td colspan="2" align="center">
					<input type="reset" value="다시 작성">&nbsp;&nbsp;
				<input type="button" value="목록으로" onClick = "window.location = 'news_list.do'"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/bottom.jsp" %>



