<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<!-- 로고이미지 넣는 곳 -->
  <table width="100%">
      <tr> <!--  로고 -->
         <td><a href="finIndex.do"><img src="images/logoBlack.png"
               width="150" height="40" border="0"> </a></td>
         <td align="right"> 
<script type="text/javascript" charset="utf-8" src="/js_std/kor/util/timeoutchk.js" 
              class="btn_bgtd_timeout" align="right" >
              
              
              </script>
             <span id="timer"></span>
             <a href="javascript:refreshTimer();"><img src="images/time.PNG" width="65" height="23"></a>
</td>
      </tr>
   </table>
<script  type="text/javascript">
   var isLogin = '<c:out value="${loginId}"/>';
	if(isLogin == null || isLogin.trim()=="") {
		alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
		location.href = "index.jsp"
	}
         </script>
<head>
<title>W3.CSS Template</title>




<script>
var iSecond; //초단위로 환산
var timerchecker = null;
window.onload = function() {
    fncClearTime();
    initTimer();
}
 
 
function fncClearTime() {
    iSecond = 600;    //시간조정
}

 
Lpad = function(str, len) {
    str = str + "";
    while (str.length < len) {
        str = "0" + str;
    }
    return str;
}
 

initTimer = function() {
    var timer = document.getElementById("timer");
   /*  rHour = parseInt(iSecond / 3600);
    rHour = rHour % 60; */
 
    rMinute = parseInt(iSecond / 60);
    rMinute = rMinute % 60;
 
    rSecond = iSecond % 60;
 
    if (iSecond > 0) {
        timer.innerHTML = "&nbsp;" + Lpad(rMinute, 2)
                + ":" + Lpad(rSecond, 2) + " ";
        iSecond--;
        timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
    }     
    else {
        logoutUser();
    }
}
 
function refreshTimer() {
    var xhr = initAjax();
   // xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
    xhr.open("POST", "top.jsp", false);
    xhr.send();
    fncClearTime();
}
 
 
 function logoutUser() {        //로그아웃기능 
    clearTimeout(timerchecker);
    var xhr = initAjax();
    //xhr.open("POST", "/mail/user.public.do?method=logout", false);
   
    xhr.open("GET", "logout.do", false);
    alert("로그인 시간이 만료되어 로그아웃됩니다.");
    xhr.send();
   location.href="index.jsp";
 /*    location.reload(); */
}
 
 
 
function initAjax() { // 브라우저에 따른 AjaxObject 인스턴스 분기 처리
    var xmlhttp;
    if (window.XMLHttpRequest) {    //IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {   // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}


</script>




</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- fonts -->
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /fonts -->
<!-- css -->
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->
<body class="w3-content" style="max-width:1300px" bgcolor=#ececec>

<!-- First Grid: Logo & About -->
<div class="w3-row">
  <div class="w3-half w3-black w3-container w3-center" style="height:700px">
    <div class="w3-padding-64">
      <h1>My page</h1>
    </div>
    
    
    <div class="w3-padding-64">
      <a href="finIndex.do" class="w3-button w3-black w3-block w3-hover-red w3-padding-16">Home</a>
      <a href="memberUpdate.do" class="w3-button w3-black w3-block w3-hover-yellow w3-padding-16">회원정보 수정</a>
         <c:if test='${loginId eq "admin" }'>
               <a href="oneqna_list.do" class="w3-button w3-black w3-block w3-hover-green w3-padding-16">1:1 문의하기</a>
               <a href="memberAll.do" class="w3-button w3-black w3-block w3-hover-blue w3-padding-16">회원 조회</a>
              </c:if>
              <c:if test='${! (loginId eq "admin") }'>
         
               <a href="qnalist_Id.do?writer=${loginId }" 
               class="w3-button w3-black w3-block w3-hover-green w3-padding-16">1:1 문의하기</a>
               
                    </c:if>
                     
      <a href="memberDelete.do" class="w3-button w3-black w3-block w3-hover-purple w3-padding-16">회원탈퇴</a>
     </div>
    </div>
    
    
  <div class="w3-half w3-blue-grey w3-container" style="height:700px">
    <div class="w3-padding-64 w3-center">
      <h1>About Me</h1>
      <img src="images/avatar3.png" class="w3-margin w3-circle" alt="Person" style="width:30%">
      <div class="w3-left-align w3-padding-large">        
        <p>아    이    디  :  ${loginId } </p><br>
        <p>생 년 월 일 : ${dto1.ssn}</p><br>
        <p>이 메 일  : ${dto1.email}</p><br>
        <p>생 년 월 일 : ${dto1.hp1} - ${dto1.hp2} - ${dto1.hp3}</p><br>
        <p>주 소  : ${dto1.roadAddress}</p><br>
      </div>
    </div>
  </div>
 
</div>


 
<!-- Third Grid: 은행정보  & 탈퇴 -->
<div class="w3-row" id="contact">
  <div class="w3-half w3-dark-grey w3-container w3-center" style="height:700px">
    <div class="w3-padding-64">
      <h2>coconut Bank</h2>
    </div>
    <div class="w3-padding-64">
      <p>COPYRIGHT(C) 2018 coconut Bank. ALL RIGHTS RESERVED</p><br>
      <p>Seoul, South Korea</p><br>
      <p>+82 02-1234-5678</p><br>
      <p>help@Coconut.com</p><br>
    </div>
  </div>
  
 <div class="w3-half w3-teal w3-container" style="height:700px">
    <div class="w3-padding-64 w3-padding-large">
      <h3>${dto1.name} 님의 가입 상품리스트 입니다.</h3>
      <p class="w3-opacity">내가 가입한 상품들을 확인 해 보세요!</p><br><br><br>
      <c:if test="${empty myFin}">
         <p><font size="4" color="white">가입한 상품이 없습니다. </font></p><br>
         <p><a href="account_list.do"><font size="4" color="white">가입 페이지 바로가기</font></a></p><br>
      </c:if>
      <% int a = 1; %>
      <c:forEach var="myFin" items="${myFin}">
      <p><font size="4" color="white"><%=a %>. <a href="myAccountContent.do?id=${loginId}&num=${myFin.num}">${myFin.name}</a></font></p><br>
      <% a++; %>
      </c:forEach>
      </div>
  </div>
</div>

<!-- <!-- Footer
<footer class="w3-container w3-padding-16">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer> -->

</body>
<%@ include file="/bottom.jsp" %> 
</html>