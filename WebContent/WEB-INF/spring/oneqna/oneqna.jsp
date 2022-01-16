<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1대1 문의하기</title>
</head>
<body>
		<h1 align="light">FAQ</h1><F2>1대1 문의하기</F2>
	<hr color="blue">
	<table border="1" width="1400" height="900">
	<tr>
		<td>	
	<a href="userWriter.do">글쓰기</a>
	<br>
	<c:if test="${empty oneqnalist}">
			Q. 	질문한내용이 없습니다.
		</c:if>
		<c:forEach var="dto" items="${oneqnalist}">
		<tr>
		<td>Q.		${dto.content} </td>
   		<td>작성일.		${dto.reg_date} </td>
		</tr>

	<hr color="skyblue"> 

		<tr>
		<td>F.  ${dto.admin_title}</td>
		<td>작성일. ${dto.admin_regdate} </td>
		</tr>
		<tr>
		<td> ${dto.admin_content}</td>
		 </tr>
		</c:forEach>
		<hr color="skyblue"> 
		</td>
		
	</tr>
	</table>

</body>