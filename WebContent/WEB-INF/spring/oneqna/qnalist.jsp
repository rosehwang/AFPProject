<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/top.jsp" %>
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

<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>    
<link rel="stylesheet" href="style.jsp" type="text/css">
<html>
<head>
	<title>1:1 문의</title>
</head>
<body>
<div align="center">

<table id ='rn2' border="0" width="800" cellpadding="3" cellspacing="0" bordercolor="#999999" style="border-collapse:collapse;" >
		<tr height="30"></tr>		
		<tr><td align="left"><font size="6">1:1문의</font><font size="2">(관리자 페이지)</font></td></tr>
		<tr height="30"></tr>	
		<tr height="30" bgcolor=#223A5E>
			<td width="70%"align="center"><font color="white">제목</font></td>
			<td width="20%"align="center"><font color="white">작성자</font></td>
			<td width="10%"align="center"><font color="white">작성일</font></td>
		</tr>
	<c:if test="${empty oneqnalist}">
		<tr bgcolor=#223A5E height="30"> 
			<td colspan="3" align = "left"><font color= "white">등록된 질문이 없습니다.</font></td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${oneqnalist}">
		<tr height="50">
			
			<td align="left">
				<a href="oneqna_content.do?no=${dto.no}">
					&nbsp;&nbsp;${dto.content}    
				</a>
			</td>
		<td>${dto.writer}</td>
		<td>${dto.reg_date}</td>
		</tr>	
		
		<c:set var="name" value="${dto.admin_title}"/>
		<c:choose>
						<c:when test="${name eq null}">
						
						</c:when>
						<c:otherwise>
						<tr>
						<td><font color="red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp →관리자 답변이 등록되었습니다.</font></td>
						</tr>
						</c:otherwise>
						</c:choose>
		
								
	</c:forEach>
	
	<tr bgcolor=#223A5E height="30">
	<%if(session.getAttribute("loginId").equals("admin")){System.out.println("admin");}else{ %>
			<td align="right" colspan="3"><a href="userWriter.do">질문등록하기</a></td>
			<%} %>
		</tr>
		</table>
		<%
		int pageSize=(int)request.getAttribute("pageSize");
		int count=(int)request.getAttribute("count");
		int currentPage=(int)request.getAttribute("currentPage");
		
		if(count>0){
			int pageCount=count/pageSize+(count%pageSize==0? 0 : 1);
			int pageBlock=3;
			int startPage=(currentPage-1)/pageBlock * pageBlock+1;
			
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			if (startPage != 1){%>
				[<a href="oneqna_list.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="oneqna_list.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="oneqna_list.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	
</div>

</body>
<br><br><br><br><br><br>
</html>


<%@ include file="/bottom.jsp" %>