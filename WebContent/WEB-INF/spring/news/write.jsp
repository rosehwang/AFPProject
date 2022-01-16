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
			alert("제목을 입력하세요!!");
			f.news_title.focus();
			return ;
		}
		document.f.submit();
	}
</script>
<div align="center">
	<form name="f" action="news_insert.do" method="post"
		enctype="multipart/form-data">
		<table width="600">
			<tr height = "30"></tr>
			<tr>
				<td align = "left" colspan="2"><font size = "6">새 소식 작성</font></td>
			</tr>
			<tr height = "30"></tr>
			<tr>
				<td width="30%" height = "40" align="center" bgcolor =#223A5E><font color = "white">제 목</font></td>
				<td><input type="text" name="news_title" size="50" maxlength="50"></td>
			</tr>
			<tr>
				<td width="30%" align="center" bgcolor =#223A5E><font color = "white">내 용</font></td>
				<td ><textarea name="news_content" rows="18" cols="52"></textarea></td>
			</tr>
			<tr>
				<td width="30%" height = "40" align="center" bgcolor =#223A5E><font color = "white">파일 첨부</font></td>
				<td><input type="file" name="news_file"></td>
			</tr>
			<tr align = "center" height = "40">
				<td colspan="2" align="center"><a href = "javascript:writeSave()"><input type="button" value="작성 완료"></a>
			</tr>
			<tr align = "center" height = "40">
				<td colspan="2" align="center">
				<input type="reset" value="다시 작성">&nbsp;&nbsp;
				<input type="button" value="목록으로" onClick = "window.location = 'news_list.do'"></td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/bottom.jsp" %>


