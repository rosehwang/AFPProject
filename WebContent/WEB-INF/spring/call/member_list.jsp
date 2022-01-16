<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>전화 상담 예약[회원]</title>
</head>
<body>

<div align = "center">
   <table  width = "1000">
      <tr height = "30"></tr>
		 <tr><td align ="left" colspan = "5"><font size = "6">전화 상담 예약</font></td></tr>
         <tr height = "20"></tr>
<%
   int number = (int)request.getAttribute("number");
%>    
      
	  <tr bgcolor =#223A5E align ="center" height = "30">
        <td width ="8%"><font color = "white">번호</font></td>
         <td width ="10%"><font color = "white">문의 종류</font></td>
         <td width ="12%"><font color = "white">통화 가능 시간</font></td>
         <td width ="45%"><font color = "white">문의 제목</font></td>
         <td width ="10%"><font color = "white">작성자</font></td>
         <td width ="15%"><font color = "white">통화 가능 번호</font></td>
      </tr> 
       <c:if test = "${empty membercallList}"> 
       <tr>
         <td colspan = "5"> 등록된 문의가 없습니다.</td>
       </tr>
     </c:if> 
       <c:forEach var ="mdto" items = "${membercallList}">
      <tr>  
        <td align = "center" width ="150" height = "20"><%=number--%></td>
        <td align = "center" width ="200" height = "20">${mdto.call_type}</td>
        <td align = "center"width ="200" height = "20">${mdto.call_time}</td>
        <td align = "left">
        <c:choose>  
       	<c:when test="${mdto.call_check > 0}">
		<img src="<%=request.getContextPath()%>/images/check.png" width ="50" height = "20" border="0">
		<a href="content.do?call_no=${mdto.call_no}">${mdto.call_title}</a>
       	</c:when>
       	<c:otherwise>
        <a href="content.do?call_no=${mdto.call_no}">${mdto.call_title}</a> 
       	</c:otherwise>
      </c:choose></td>
        </td>
        <td align = "center" width ="150" height = "20"><%=session.getAttribute("loginId") %></td>
        <td align = "center" width ="200" height = "20">${mdto.call_hp}</td>   
      </tr>
     </c:forEach>
       <tr  bgcolor=#cccbcf>
	   <td colspan="8"></td>
	 </tr>
	 <tr>
	 <td align="right" colspan="6">   
         <a href ="member_write.do"><input type = "button" value ="글 쓰기"></a>
       </td>
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
				[<a href="member_list.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="member_list.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="member_list.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	      
   
        
   </div>
   
</body>
</html>
<%@ include file="/bottom.jsp" %>