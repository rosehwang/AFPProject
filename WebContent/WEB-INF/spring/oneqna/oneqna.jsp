<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:if test="${empty loginId}">
         <script>
      alert("�α��� �� �̿��� �����մϴ�.")
      window.location = "index.jsp"
         </script>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1��1 �����ϱ�</title>
</head>
<body>
		<h1 align="light">FAQ</h1><F2>1��1 �����ϱ�</F2>
	<hr color="blue">
	<table border="1" width="1400" height="900">
	<tr>
		<td>	
	<a href="userWriter.do">�۾���</a>
	<br>
	<c:if test="${empty oneqnalist}">
			Q. 	�����ѳ����� �����ϴ�.
		</c:if>
		<c:forEach var="dto" items="${oneqnalist}">
		<tr>
		<td>Q.		${dto.content} </td>
   		<td>�ۼ���.		${dto.reg_date} </td>
		</tr>

	<hr color="skyblue"> 

		<tr>
		<td>F.  ${dto.admin_title}</td>
		<td>�ۼ���. ${dto.admin_regdate} </td>
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