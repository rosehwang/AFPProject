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


<html>
<head>
<title>글내용보기</title>
</head>
<body>
   <div align = "center">
   <table width="800" >
      <tr height = "30"></tr>
      <tr><td align="left" colspan="2"><font size="6">1:1문의</font></td></tr>
      <tr height = "30" >
   </tr>
   </table>
   
   <table id ='rn2' align="center" border="0" width="800" cellpadding="3" cellspacing="0" bordercolor="#999999" style="border-collapse:collapse;" >      
      <tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
   <form name="f" action="adminWriterForm.do?no=${dto.no}"  method="post" >
   <tr height = "30"></tr>
      

   <!--regdate -->
   <td width="15%" height = "40" align="center"><font color=#223A5E size="5">문의내용. </font></td>
            <td align="center" rowspan = "2"><font size="5">${dto.content}<br><br></font></td>
         </tr>
         <tr>
            <!--질문내용 -->
            <th align="center" width = "25%" height="40"><font color="gray">작성일    ${dto.reg_date}  </font></th>
         </tr>
      
      
      <%if(session.getAttribute("loginId").equals("admin")){
                     System.out.println("admin");
                  }else{ %>
      <tr><th align="right"colspan="2"><input type = "button" value = "글수정" onclick = "window.location='oneqnaUpdate.do?no=${dto.no}'"></th></tr>
      
                  <%} %>
   <tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
</table>
      <br>
      <br>
      <br>
      <table border="0" width = "800">
      <c:set var="name" value="${dto.admin_title}"/>
   <c:choose>
   <c:when test="${name eq null}">
   <tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
      <tr><td width="15%" height = "40" align="center" ><font >관리자 글이 아직 등록되지 않았습니다.</font></td></tr>
   <tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
   </c:when> 
   <c:otherwise>
<table id ='rn2' align="center" border="0" width="800" cellpadding="3" cellspacing="0" bordercolor="#999999" style="border-collapse:collapse;">
<tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
   <tr>
   <th  align="center" width = "25%" height="40">
   <br>
   <img src="images/logoBlack.png" width="140" height="50" border="0"></th>
   <th  colspan="2' align="center" rowspan = "2">${dto.admin_title}</th>
   </tr>
   
   
   <tr>
   <th align="left" width = "25%" height="40" colspan="2" > <font color=#223A5E>작성일 ${dto.admin_regdate}</font></th>
   </tr>
   <tr><td></td></tr>
   <tr>
   
   <td colspan="2" align="left"><br><br><br>${dto.admin_content}<br><br><br></td>
   
   </tr>
   
   <tr bgcolor=#cccbcf>
            <td colspan="2"></td>
         </tr>
   </table>
   
   
   <table border="0" width = "800">
      </c:otherwise>
   </c:choose>
   
            <td colspan ="4" align = "right">
                  <c:choose>
                  <c:when test="${name eq null}">
                  <%if(session.getAttribute("loginId").equals("admin")){ %>
                  <input type="submit" value="관리자 글등록">
                  <%} %>
                  </c:when>
                  <c:otherwise>
                  <%if(session.getAttribute("loginId").equals("admin")){ %>
                  <input type="submit" value="관리자 글수정">
                  <input type = "button" value="관리자글 삭제" onclick="window.location='adminContent.do?no=${dto.no}'">
                  <%} %>
                  </c:otherwise>
                  </c:choose>
                  <%if(session.getAttribute("loginId").equals("admin")){%>
                     <input type = "button" value = "글목록" onclick = "window.location='oneqna_list.do'">
                  <%}else{ %>
                  <input type = "button" value = "글삭제" onclick = "window.location='board_delete.do?no=${dto.no}'">&nbsp&nbsp
                  
                  <input type = "button" value = "글목록" onclick = "window.location='qnalist_Id.do?writer=${dto.writer}'">
                  <%} %>
            </td>
         </tr>
      </table>
      
      </form>
   </div>
<br>
<br>
<br>
</body>

</html>
<%@ include file="/bottom.jsp" %>