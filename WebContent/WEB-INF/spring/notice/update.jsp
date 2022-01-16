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
	function writeSave() {
	
		if (f.notice_title.value == "") {
			alert("제목을 입력하세요!!");
			f.notice_title.focus();
			return false;
		}
		if (f.notice_content.value == "") {
			alert("내용을 입력하세요!!");
			f.notice_content.focus();
			return false;
		}
		return true;
	}
</script>
<div align="center">
	<form name="f" action="notice_update.do" method="post"
		onsubmit="return writeSave()" enctype="multipart/form-data">
		<input type = "hidden" name = "notice_no" value = "${dto.notice_no}">
		<table width="600">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">공지사항 수정</font></td>
			</tr>
			<tr height = "30"></tr>
			
			<tr>
				<td width="30%" align="center" bgcolor =#223A5E><font color = "white">제 목</font></td>
				<td><input type="text" value = "${dto.notice_title}" name="notice_title" size="50" maxlength="50"></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgcolor =#223A5E><font color = "white">내 용</font></td>
				<td><textarea name="notice_content" rows="17" cols="52">${dto.notice_content}</textarea></td>
			</tr>
			<tr height = "50">
				<td width="30%" align="center" rowspan = "2" bgcolor =#223A5E><font color = "white">파일 첨부</font></td>
				<td>
				
				<c:choose>
				<c:when test="${dto.notice_filesize > 0}">
				기존 파일: ${dto.notice_file}
				 </c:when>
				 <c:otherwise>
				 기존 파일 없음.
				 </c:otherwise>
				 </c:choose>
				<input type="file" name="notice_file">
				</td>
			</tr>
			<tr>
				<td>
				기존 파일 삭제 하기 <input type = "checkbox" name = "fileClear" value = "chk">
				</td>
			</tr>
			<tr height = "40">
				<td colspan="2" align="center"><input type="submit" value="수정 완료">
			</tr>
			<tr height = "40">
				<td colspan="2" align="center">
					<input type="reset" value="다시작성">&nbsp;&nbsp;
				<input type="button" value="목록으로" onClick = "window.location = 'notice_list.do'"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/bottom.jsp" %>



