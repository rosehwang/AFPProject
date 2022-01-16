<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@ include file="/top.jsp" %> 
<!-- 일반사용자 이메일 신청-->
 <link rel="stylesheet" type="text/css" href="css/oneqna/board_type1.css" />
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>

<script type="text/javascript">
	function writeSave(){
		
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		var reg=alert("글을 입력하시겠습니까?");
		if(reg){
			alert("글입력이 완료되었습니다.");
		}
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기</title>
</head>
<div align="center">

<form name="f" action="userWritePro.do"  method="post" onsubmit="return writeSave()" enctype="multipart/form-data"  style="border-collapse:collapse;">

<table width="600">		
		<tr height="30"></tr>
		<tr>
			<td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">Q. 문의할 내용을 등록하세요</font></td>
		</tr>
			<tr height="30"></tr>
		<td>작성자:<input type="text" name="writer" value="<%=session.getAttribute("loginId")%>" readOnly></td>
		</tr>
		<tr>
			<td align="center"s><textarea name="content" rows="15" cols="70" style="resize:none;"></textarea></td>
		</tr>

		<tr align="center" height="40">
			<td colspan="2" align="center">
	
				<input type="submit" value="질문입력 완료">&nbsp;&nbsp;
				<input type="reset" value="다시작성">
		</tr>
	</table>
	
	</form>
	</div>
</body>