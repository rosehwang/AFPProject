<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>
<style type="text/css">
#rn2{

 margin:0px;padding:3px;
 text-align:center;
 border-bottom:1px solid #999999;
 border-top:1px solid #9999999;
 border-collapse:collapse;

}

#rn2 th,#rn2 td{
 text-align:center;
 border-bottom:1px solid #D5D5D5;
}

#rn2 th{
 border-cols:solid #999999;
}

#rn2 tr:hover{
 background:#D1B2FF
}
</style>
<html>
<head>
<title>이메일 상담 내용보기</title>
</head>
<body>
	<div align = "center">

	<table id ='rn2' align="center" border="0" width="800" cellpadding="3" cellspacing="0" enctype="multipart/form-data" bordercolor="#999999" style="border-collapse:collapse;" >
		
	<form name="f" action="adminEmailForm.do?no=${dto.no}"  method="post" >
	<tr height = "30"></tr>
<tr height = "30" bgcolor =#223A5E>
<div align="left"><font size="5">&nbsp&nbsp&nbsp 이메일 상담 </font></div>
		
		<table border="0" width = "600">
	<tr height = "30">
	<!--regdate -->
	<td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">작성일</font></td>
				<td align="center"><font>${dto.reg_date}</font></td>
					<td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">e-mail</font></td>
				<td align="center"><font>${dto.writer_email}</font></td>
			</tr>
			<tr>
			<td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">제목</font>
			<td align="center"><font>${dto.writer_title}</font></td>
			</tr>
			<tr>
			<!--질문내용 -->
				<td bgcolor =#223A5E align="center" width = "25%" height="40"><font color="white">질문 내용</font></td>
				<td colspan="3" align="left">&nbsp;${dto.content}</td>
			</tr>
		</table>
		

		<br>
		<br>
		<br>
		<table border="0" width = "600">
		<c:set var="name" value="${dto.admin_title}"/>
	<c:choose>
	<c:when test="${name eq null}">
	
		<tr><td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">메일이 아직 발송되지 않았습니다.</font></td></tr>
	</c:when> 
	<c:otherwise>

	<tr>
	<td bgcolor =#223A5E align="center" width = "25%" height="40">
	<input type="hidden" value="${dto.admin_title}">  
			<font color="white">메일이 발송되었습니다.</font> 	
		</td>
	</tr>
	

	</table>
	
	
	<table border="0" width = "600">
		</c:otherwise>
	</c:choose>
	
				<td colspan ="4" align = "right">
						<c:choose>
						<c:when test="${name eq null}">
						<%if(session.getAttribute("loginId").equals("admin")){ %>
						<input type="submit" value="관리자 이메일 보내기">
						<%} %>
						</c:when>
						<c:otherwise>
						<%if(session.getAttribute("loginId").equals("admin")){ %>
						<%} %>
						</c:otherwise>
						</c:choose>
						<%if(session.getAttribute("loginId").equals("admin")){%>
							<input type = "button" value = "글목록" onclick = "window.location='email_adminlist.do'">
						<%}else{ %>
						<input type = "button" value = "글삭제" onclick = "window.location='deleteE.do?no=${dto.no}'">&nbsp&nbsp
						
						<input type = "button" value = "글목록" onclick = "window.location='emailList_id.do?writer=${dto.writer}'">
						<%} %>
				</td>
			</tr>
		</table>
		
		</form>
	</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>