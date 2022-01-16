<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/top.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
      int number = (int)request.getAttribute("number");
   %>
   <div align = "center">
   <table width="800" border="0">
         <tr height = "30"></tr>
         <tr>
            <td align = "left" colspan="2"><font size = "6">회원 조회</font></td>
         </tr>
         <tr height = "30"></tr>
         
         <tr class = "w3-2017-navy-peony" align ="center" height = "30">
            <td width = "10%">번호</td>
            <td width = "10%">이름</td>
            <td width = "15%">ID</td>
            <td width = "20">생년월일</td>
            <td width = "25%">이메일</td>
            <td width = "25%">전화번호</td>
         </tr>
      <c:if test="${listMember eq null}">
            <tr height = "30">
               <td colspan="5">등록된 회원이 없습니다.</td>
            </tr>
      </c:if>
      
      
      
      <c:forEach var="dto" items="${listMember}">
      <c:if test="${dto.id != 'admin'}">
            <tr height = "30">
            </tr>
   
            <tr height = "30" align ="center">
               <td align="center"><%=number--%></td>
               <td>${dto.name}</td>
               <td><a href = "memberProdView.do?id=${dto.id }">${dto.id}</a></td>
               <td>${dto.ssn}</td>
         <c:choose>
            <c:when test="${empty dto.email}">
               <td>없음</td>
            </c:when>
            <c:otherwise>
               <td>${dto.email}</td>
            </c:otherwise>
         </c:choose>
               
         <c:choose>
            <c:when test="${empty dto.hp1}">
               <td>없음</td>
            </c:when>
            <c:otherwise>
               <td>${dto.hp1}-${dto.hp1}-${dto.hp1}</td>
            </c:otherwise>
         </c:choose>
            </tr>
               </c:if>
      </c:forEach>
      <tr bgcolor=#cccbcf>
         <td colspan="6"></td>
      </tr>
      
      <tr>
         <td align="center" colspan="6">
         <%
         
         int count = (int)request.getAttribute("count");
         int pageSize = (int)request.getAttribute("pageSize");
         int currentPage = (int)request.getAttribute("currentPage");
      if (count>0){
         int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);//ex 30/5 => 6 31/5 => 7 
         int pageBlock = 3;//보여지는 페이징 갯수
         int startPage = (currentPage-1)/pageBlock * pageBlock + 1;// 1, 4. . . 
         int endPage = startPage + pageBlock - 1;
         if (endPage>pageCount) endPage = pageCount;
         if (startPage != 1){//1페이지 아니면 이전 보여주기%>
            [<a href="memberAll.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
         <%      }            
         for(int i=startPage; i<=endPage; ++i){%>
            [<a href="memberAll.do?pageNum=<%=i%>"><%=i%></a>]
         <%      }
         if (endPage<pageCount){%>
            [<a href="memberAll.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
         <%      }
         }%>   
         </td>
         </tr>
   </table>
   <br>
   <table border="0" width="800">
         <tr>
            <td align="center">
               <form name="f" action="memberFind.do" method="post">
                  <select name="searchMode">
                     <option value="name">이름</option>
                     <option value="ID">ID</option>
                  </select>&nbsp; 
                  <input type="text" size="20" name="word"> 
                  <input type="submit" value="검색">
               </form>
            </td>
         </tr>
         
   </table>
   </div>
   <br><br><br>
</body>
</html>
<br><br><br><br><br><br>
<%@ include file="/bottom.jsp" %> 