<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 



<head>
<!-- fonts -->
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /fonts -->

<!-- css -->
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /css -->

<title>ID 찾기</title>
</head>

<body class="w3-light-grey">
   <!-- <form name="f" method="POST" action="memberCheck.do" class="w3-light-grey">
      <table width="100%"> -->
         <tr>
            <!--  로고 -->
            <td><a href="index.jsp"><img src="images/logoBlack.png"
                  width="150" height="40"> </a></td>
         </tr>
<table align="center" height="880" border="0">
      <c:if test="${findId==null or findId.isEmpty()}">
      <tr>
         <td>입력정보에 맞는 아이디가 없습니다.</td>
      </tr>         
      </c:if>
      <c:forEach var="dto" items="${findId}">
      <tr align="center">
      <td><font size="5">ID 찾기 결과는  <strong> ${findId} </strong> 입니다. </font><br><br>
      <input type="button" value="로그인" onclick="window.location='index.jsp'"
       class="w3-button w3-2017-navy-peony w3-round w3-padding-small" size="10"><br><br>
       <br><br><br></td>
      </tr>

      </c:forEach>
      </table>

</body>
<%@ include file="/bottom.jsp"%>