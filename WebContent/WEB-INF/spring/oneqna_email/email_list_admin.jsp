
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/top.jsp" %>
<style type="text/css">
#rn2{

 margin:0px;padding:3px;
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

<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>    
<link rel="stylesheet" href="style.jsp" type="text/css">
<html>
<head>
	<title>이메일 문의</title>
</head>
<body>
<div align="center">

<table id ='rn2' align="center" border = "0" width="800" cellpadding="3" cellspacing="0" bordercolor="#999999" style="border-collapse:collapse;" >		
	<tr><td colspan = "3"><font size="6"><br>이메일 문의</font><br><br></td></tr>
	
		<tr bgcolor=#223A5E height="30">
			<td width="20%"align="center"><font color="white">작성일</font></td>
				<td width="65%"align="center"><font color="white">제목</font></td>
			<td width="15%"align="center"><font color="white">작성자</font></td>
			
		</tr>
	<c:if test="${empty emailListAdmin}">
		<tr height="30"> 
			<td colspan="3" >등록된 이메일 문의가 없습니다.</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${emailListAdmin}">
		<tr height="50">
			<td align="center">${dto.reg_date}</td>
			
			<td align="left">
				<a href="email_content.do?no=${dto.no}">
					${dto.writer_title}    
				</a>
			</td>
			<td align="center">${dto.writer}</td>
	
		</tr>	
		
		<c:set var="name" value="${dto.admin_title}"/>
		<c:choose>
						<c:when test="${name eq null}">
						
						</c:when>
						<c:otherwise>
						<tr>
						<td></td><td><font color="red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp →메일이 문의가 완료되었습니다.</font></td><td></td>
						</tr>
						</c:otherwise>
						</c:choose>
		
								
	</c:forEach>
	
	<tr bgcolor=#223A5E height="30">
	<%if(session.getAttribute("loginId").equals("admin")){System.out.println("admin");}else{ %>
			<td align="right" colspan="3"><a href="adminEmail.do">메일보내기</a></td>
			<%} %>
</tr>

</table>
		<%
		int pageSize=(int)request.getAttribute("pageSize");
		int count=(int)request.getAttribute("count");
		int currentPage=(int)request.getAttribute("currentPage");
		
		if(count>0){
			int pageCount=count/pageSize+(count%pageSize==0? 0 : 1);
			int pageBlock=2;
			int startPage=(currentPage-1)/pageBlock * pageBlock+1;
			
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			if (startPage != 1){%>
				[<a href="email_adminlist.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="email_adminlist.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="email_adminlist.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	
</div>

</body>
</html>


<%@ include file="/bottom.jsp" %>