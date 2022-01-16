
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
      response.setHeader("Pragma","no-cache"); //HTTP 1.0
      response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
      response.setDateHeader("Expires", 0); //prevents caching at the proxy server
      response.setHeader("Cache-Control", "private"); // HTTP 1.1 
      response.setHeader("Cache-Control", "no-store"); // HTTP 1.1 
      response.setHeader("Cache-Control", "max-stale=0"); // HTTP 1.1 
%>



<head>
<title>COCONUT BANK::LOGIN::</title>
<!-- fonts -->
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /fonts -->
<link rel="stylesheet" type="text/css" href="css/index/indexStyle.css">
</head>
<br>
&nbsp;&nbsp;<img src="images/logoBlack.png" width="200" height="50" border="0">
<br>
<div class="main" align = "center">
   <div class="login">
      <h1>로그인</h1>
      <div class="login-bottom">
         <form name="f" method="post" action="login.do">
            <input type="text" placeholder="Id" name = "id" required=" "> 
            <input type="password" class="password" name="passwd" placeholder="Password" required=" "> 
            <input type="submit" value="login">
         </form>
         <p>아이디 또는 패스워드를 잊으셨습니까?<a href="find_idpasswd_form.do"> Click Here</a></p>
         
         <p>새로운 계정을 만드시겠습니까?<a href="memberAgree.do"> Click Here</a><p>
      </div>
   </div>
</div>
<div class="footer">
   <p><!--여기부터 -->
      &copy 2015 Flat Portal Login Form . All rights reserved | Design by <a
         href="http://w3layouts.com">W3layouts.</a>
         <!-- 여기까지 지우면 안됨. -->
   </p>
</div>
</body>
</html>