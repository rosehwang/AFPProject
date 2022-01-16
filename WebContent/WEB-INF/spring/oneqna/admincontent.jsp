<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
      
    	  function writeSave(){
		var reg=alert("수정하시겠습니까?");
		if(reg){
			alert("수정이완료 되었습니다.");
		}
      }
         </script>
</c:if>
<html>
<head>
<title>관리자 글내용보기</title>
</head>
<body>
<div align = "center">

<div align="left"><font size="5">&nbsp&nbsp&nbsp 1:1 문의</font></div>
		<form name="d" action="admindeletePro.do">
	<table id ='rn2' align="center" border="0" width="800" cellpadding="3" cellspacing="0" enctype="multipart/form-data" bordercolor="#999999" style="border-collapse:collapse;"onsubmit="return writeSave()" >
		<input type="hidden"name="no"value="${dto.no }">
			
	<tr>
	<th bgcolor =#223A5E align="center" width = "25%" height="40"> <font color="white">Q.</font></th>
	<td align="center">${dto.admin_title}</td>
	</tr>
	
	<tr>
	<th bgcolor =#223A5E align="center" width = "25%" height="40"> <font color="white">작성일</font></th>
	<td>${dto.admin_regdate}</td>
	</tr>
	
	<tr>
	<td colspan="2">${dto.admin_content}</td>
	</tr>
	
	</table>
	<div align="center"><input type="submit" value="관리자글 삭제"></div>
	</form>
	</div>
	
	</body>
	</html>
<%@ include file="/bottom.jsp" %>	