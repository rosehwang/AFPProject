<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bistro a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
<link href="css/main/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/main/aos.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/main/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->
<title>아이디 찾기</title>
</head>
<body>
   <div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <form name = "f" action="find_id.do" method="post">
            <div class="w3-center w3-large w3-margin-top">
               <h3>비밀번호 찾기</h3>
            </div>
            <div>
            <c:choose>
            <c:when test="${updatePasswd > 0}">
               <p>
                  <label>메일로 임시 비밀번호를 전송했습니다.</label>
               </p>
            </c:when>
            <c:otherwise>
               <p>
                  <label>메일 발송에 실패하였습니다.</label>
               </p>
            </c:otherwise>
            </c:choose>
              <%--  <c:forEach var="dto" items="${updatePasswd}">
               <P>
               	<label>메일로 비밀번호를 보냈습니다.</label>
               </P>
               </c:forEach> --%>
               <p class="w3-center">
        
   <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">뒤로가기</button>
               </p>
            </div>
         </form>
      </div>
   </div>
</body>
</html>
