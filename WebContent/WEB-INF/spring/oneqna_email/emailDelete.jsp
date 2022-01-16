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
<br><br><br><br><br><br>
<div align="center">
<table border="0">
<tr align="left"><td><font size="6">&nbsp&nbsp&nbsp 이메일 문의가 삭제 되었습니다.</font></td></tr>
<div class="login-bottom">
   <%String id1=(String)session.getAttribute("loginId"); 
   if(!(id1.equals("admin"))){%>
   <form method="post" action="emailList_id.do" >
            
      <tr><td align="center"><input type="hidden" name="writer" value="<%=session.getAttribute("loginId")%>" >
               <br><br>
               
               <p><input type="submit" value="목록"></td></tr>
   </div>
   </form>
   <%} %>
   
   

</table>
</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>
      
   