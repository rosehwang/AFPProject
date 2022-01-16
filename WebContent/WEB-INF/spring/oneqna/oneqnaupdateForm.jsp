<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@include file="/top.jsp" %>
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>

<%
 // 현재 날짜 시간 구하는 함수
	 
	  SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
	  Date currentTime = new Date ( );
	  String dTime = formatter.format ( currentTime );
	 
%>
<script type="text/javascript">
	function writeSave(){
		
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		var reg=alert("글을 수정하시겠습니까?");
		if(reg){
			alert("글 수정이 완료되었습니다.");
		}
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1대1 문의하기</title>
</head>
<div align="center">
<form name="f" action="userupdatepro.do"  method="post" onsubmit="return writeSave()" enctype="multipart/form-data">


	<table width="600">
	<input type=hidden name = "no" value="${dto.no} ">
		<input type=hidden name = "reg_date" value="${dto.reg_date} ">
		<tr height = "30"></tr>
		<tr>
		<td align = "left" colspan="2">
		<font size="6" >Q. 문의 내용 수정하기</font></td>
		</tr>
		<tr height = "30"></tr>
		<tr>
		
		<td width="30%" height = "40" align="left" bgcolor =#223A5E><font color="white">작성자:</font><input type="text" size = "10" name="writer" value="<%=session.getAttribute("loginId")%>" readOnly></td>
		</tr>
		<tr>
			<td><textarea name="content" rows="10" cols="80">${dto.content}</textarea></td>
		</tr>
		<tr>
		<td><br></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="수정완료">&nbsp;&nbsp;
				<input type="reset" value="다시작성">
		</tr>
	</table>
	
	</form>
</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>