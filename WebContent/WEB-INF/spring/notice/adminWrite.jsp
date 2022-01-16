<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>	

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
<form name="f" action="notice_insert.do" method="post"
		onsubmit="return writeSave()" enctype="multipart/form-data">
		<table width="600">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">공지사항 작성</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr>
				<td width="30%" height = "40" align="center" bgcolor =#223A5E><font color = "white">제 목</font></td>
				<td><input type="text" name="notice_title" size="50" maxlength="50"></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgcolor =#223A5E><font color = "white">내 용</font></td>
				<td><textarea name="notice_content" rows="18" cols="52"></textarea></td>
			</tr>
			<tr>
				<td width="30%" height = "40" align="center" bgcolor =#223A5E><font color = "white">파일 첨부</font></td>
				<td><input type="file" name="notice_file"></td>
			</tr>
			<tr align = "center" height = "40">
				<td colspan="2" align="center"><input type="submit" value="작성 완료">
			</tr>
			<tr align = "center" height = "40">
			<td colspan="2" align="center">
				<input type="reset" value="다시작성">&nbsp;&nbsp;
				<input type="button" value="목록으로" onClick = "window.location = 'notice_list.do'"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/bottom.jsp" %>




