<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
var isLogin = '<c:out value="${loginId}"/>';
if(isLogin == null || isLogin.trim()=="") {
   alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
   location.href = "index.jsp"
}
</script>
<c:if test='${! (loginId eq "admin") }'>
<script>
alert("괸리자만 이용이 가능합니다.")
location.href = "index.jsp"
</script>
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
   media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
   media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
   media="all" />
<style>
body,input[type="button"],input[type="submit"]{

   font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body bgcolor = #ececec>
<div align = "center">
<table width = "380">
      <tr>
         <td align = "left">
            <font size = "6">답변 수정</font>
         </td>
      </tr>
      <tr>
         <td bgcolor = #223A5E></td>
      </tr>
   </table>
   <form name="f" method="post" action="updateAnswerBot.do">
      <table width = "380">
         <tr>
            <td bgcolor = #223A5E align = "center" width = "30%">
            <font color = "white">번호</font>
            </td>
            <td>
                <input type="text" name="bot_no" value ="${dto.bot_no }" readonly size = "32"><br>
            </td>
         </tr>
         <tr>
            <td bgcolor = #223A5E align = "center">
               <font color = "white">답변 제목</font>
            </td>
            <td>
               <input type="text" name="bot_title" value ="${dto.bot_title }" size = "32"><br>
            </td>
         </tr>
         <tr>
            <td bgcolor = #223A5E align = "center">
               <font color = "white">답변 내용</font>
            </td>
            <td>
               <textarea name="bot_content" rows="12" cols="34">${dto.bot_content }</textarea><br>
            </td>
         </tr>
         <tr align = "center" height = "30">
            <td colspan = "2">
            <input type="submit" value="수정 완료">
            </td>
         </tr>
         <tr align = "center" height = "30">
            <td colspan = "2">
            <input type="reset" value="취소">&nbsp;
            <input type="button" value="목록으로" onClick = "window.location ='botAnswerList.do'">
            </td>
         </tr>
      </table>
   </form>
   </div>
</body>
</html>