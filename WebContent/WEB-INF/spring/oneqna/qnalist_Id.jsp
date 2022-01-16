<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 border-bottom:1px solid #D5D5D5;
}

#rn2 th{
 border-cols:solid #999999;
}

#rn2 tr:hover{
 background:#D1B2FF
}
 

</style>    
<link rel="stylesheet" href="style.jsp" type="text/css">
<html>
<head>
<title>1:1 문의</title>
</head>
<body>
<div align="center">

<hr color="skyblue" border="2">

	<table id ='rn2' border="0" width="800" cellpadding="3" cellspacing="0" bordercolor="#999999" style="border-collapse:collapse;" >
		<tr><td colspan="2" align="left"><font size="6">1:1문의</font><br><br></td></tr>
	
		<tr heignt="30">
		
			<td bgcolor=#223A5E align="center" width="70%"><font color="white">제목</font></td>
			<td bgcolor=#223A5E align="center" width="30"><font color="white">작성일</font></td>
		</tr>
	<c:if test="${empty IdOneqnaList}">
		<tr> 
			<td colspan="2">등록된 질문이 없습니다.</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${IdOneqnaList}">
		<tr height="50">
			
			<td align="left" >
				<a href="oneqna_content.do?no=${dto.no}">
					&nbsp&nbsp${dto.content}    
				</a>
			</td>
			<td>${dto.reg_date}</td>
		</tr>	
		
		<c:set var="name" value="${dto.admin_title}"/>
		<c:choose>
						<c:when test="${name eq null}">
						
						</c:when>
						<c:otherwise>
						<tr>
						<td><font color="red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp →관리자 답변이 등록되었습니다.</font></td>
						<td colspan="2"></td>
						</tr>
						</c:otherwise>
						</c:choose>
		
								
	</c:forEach>
	
	<tr heignt="30">
	<%if(session.getAttribute("loginId").equals("admin")){System.out.println("admin");}else{ %>
			<td></td>
			<td align="center" bgcolor=#223A5E ><a href="userWriter.do"><font color="white">질문등록하기</font></a></td>
			<%} %>
		</tr>
		</table>
</div>
<br>
<br>
<br>
<br>
<br>
</body>

</html>
<%@ include file="/bottom.jsp" %> 