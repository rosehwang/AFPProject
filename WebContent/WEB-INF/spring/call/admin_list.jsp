<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>전화 상담 예약[관리자]</title>
</head>
<body>
<div align = "center">
      
<%
   int number = (int)request.getAttribute("number");
%>      
      <!-- <tr height = "30"></tr> -->
      <table  width = "1000" >
       <tr height = "30"></tr>
		 <tr><td align ="left" colspan = "5"><font size = "6">전화 상담 문의 내역</font></td></tr>
        
        <tr height = "30"></tr>
	   <tr bgcolor =#223A5E align ="center" height = "30">
         <td width ="8%"><font color = "white">번호</font></td>
         <td width ="10%"><font color = "white">문의 종류</font></td>
         <td width ="12%"><font color = "white">통화 가능 시간</font></td>
         <td width ="45%"><font color = "white">문의 제목</font></td>
         <td width ="10%"><font color = "white">작성자</font></td>
         <td width ="15%"><font color = "white">통화 가능 번호</font></td>
       </tr>   
      
     <c:if test = "${empty callList}"> 
       <tr>
         <td colspan = "5"> 전화 상담 예약 목록이 없습니다.</td>
       </tr>
     </c:if> 
      <c:forEach var ="dto" items = "${callList}">
      <tr>
        <td align = "center" width ="150" height = "20"><%=number--%></td>
        <td align = "center" width ="200" height = "20">${dto.call_type}</td>
        <td align = "center" width ="200" height = "20">${dto.call_time}</td>
       	<td aling=  "center">
        <c:choose>  
       	<c:when test="${dto.call_check > 0}">
		<img src="<%=request.getContextPath()%>/images/check.png" width ="50" height = "20" border="0">
		<a href="content.do?call_no=${dto.call_no}">${dto.call_title}</a>
       	</c:when>
       	<c:otherwise>
        <a href="content.do?call_no=${dto.call_no}">${dto.call_title}</a> 
       	</c:otherwise>
      </c:choose></td>
        <td align = "center" width ="150" height = "20">${dto.call_writer}</td>
        <td align = "center" width ="200" height = "20">${dto.call_hp}</td>   
     </tr>
    </c:forEach> 
     <tr  bgcolor=#cccbcf>
	  <td colspan="8"></td> 
	 </tr> 
   </table>
<%
       int pageSize = (int)request.getAttribute("pageSize");
       int count =(int)request.getAttribute("count");      
       int currentPage = (int)request.getAttribute("currentPage");
       
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			if (startPage != 1){%>
				[<a href="admin_list.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="admin_list.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="admin_list.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	   
      
   </div>
 </body>
</html>
<%@ include file="/bottom.jsp" %>