<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html lang="ko">
<script type="text/javascript">
   var isLogin = '<c:out value="${loginId}"/>';
   if(isLogin == null || isLogin.trim()=="") {
      alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
      location.href = "index.jsp"
   }
   function deleteMember(num){
      window.open("prod_delete.do?num="+num, "delete", "width=500, height=300");
   }
   
   function cocoList(){
      window.open("coconut_list.do", "list", "width=600, height=300");      
   }
   
   function cocoLists(){
      window.open("coconuts_list.do", "list", "width=600, height=300");      
   }
   
   function mapLocation(num){
      window.open("map_location.do?num="+num, "list", "width=800, height=600");
   }
   
   function check(){
      if (f.kind.value==""){
         alert("상품 종목을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.bank.value==""){
         alert("판매 은행을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.location.value==""){
         alert("위치를 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.name.value==""){
         alert("상품명을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.content.value==""){
         alert("상품특징을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.member.value==""){
         alert("가입대상을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.duration.value==""){
         alert("가입기간을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.money.value==""){
         alert("가입금액을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.interest.value==""){
         alert("금리안내 및 우대금리를 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.method.value==""){
         alert("적립방법 및 이자지급방법을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.join.value==""){
         alert("가입 및 해지안내를 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.note.value==""){
         alert("유의사항을 입력해 주세요!")
         f.id.focus()
         return
      }
      document.f.submit()
   }
   
   function check2(){
      if (f.money.value==""){
         alert("가입 금액을 입력해 주세요!")
         f.id.focus()
         return
      }
      if (f.interest.value==""){
         alert("적용 금리를 입력해 주세요!")
         f.id.focus()
         return
      }
      document.f.submit()
   }
</script>

 <c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>

<script>
   function logout() {
      if (confirm("로그아웃 하시겠습니까?") == true) {
         window.location="logout.do"
         self.close()
      } else {

         return;
      }
   }
   function botGo()
   {
      window.open("bot.do", "get", "height = 450, width = 600");
   }
</script>



<!-- 시간초과 로그아웃 기능 -->
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
                + " : " + Lpad(rSecond, 2) + " ";
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
<!-- / 시간초과 로그아웃 기능 -->

<head>
<title>COCONUT BANK::HOME::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bistro a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<!-- css -->
<link href="<%=request.getContextPath()%>/css/main/cloudflare.css" rel="stylesheet" type='text/css'
   media="all" />
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
   media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
   media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
   media="all" />

<link href="css/main/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/main/aos.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/main/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->

<style>

td {width:100px; height:30px;}

.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}

</style>
</head>
<body class = "w3-light-gray">
<!-- top -->
<!-- Links (sit on top) -->
<div class="w3-top">
   <div style="hight:150px"class="w3-bar w3-border w3-light-grey w3-center">
         
         <div style="width:25%" class="w3-dropdown-hover w3-2017-navy-peony">
         <button class="w3-button w3-2017-navy-peony" style="width:100%;height:50px">코코넛 인증</button>
         <div style="width:25%" class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="coconut_make.do?id=<%=session.getAttribute("loginId")%>" class="w3-bar-item w3-button">코코넛 생성하기</a>
               <a href="javascript:cocoList()" class="w3-bar-item w3-button">내 코코넛 보기</a>
               <c:if test='${loginId eq "admin" }'>
               <a href="javascript:cocoLists()" class="w3-bar-item w3-button">코코넛 리스트</a>
               </c:if>
            </div>
            </div>
      
            <div style="width:25%" class="w3-dropdown-hover w3-2017-navy-peony">
         <button class="w3-button w3-2017-navy-peony" style="width:100%;height:50px">금융 상품 센터</button>
         <div style="width:25%" class="w3-dropdown-content w3-bar-block w3-card-4">
            <a href="findFinProd.do" class="w3-bar-item w3-button">금융 상품 검색</a>
            <c:if test='${loginId eq "admin" }'>
               <a href="prod_insert.do" class="w3-bar-item w3-button">금융 상품 등록</a>
               </c:if>
               <a href="prod_list.do" class="w3-bar-item w3-button">금융 상품 목록</a>
            </div>
            </div>
            
            <div style="width:25%" class="w3-dropdown-hover w3-2017-navy-peony">
         <button class="w3-button w3-2017-navy-peony" style="width:100%;height:50px" onclick="window.location='account_list.do'">비대면 계좌 개설</button>
            </div>
            
            <div style="width:25%" class="w3-dropdown-hover w3-2017-navy-peony">
         <button class="w3-button w3-2017-navy-peony" style="width:100%;height:50px" onclick="javascript:botGo();">도와줘요 코코봇</button>
            </div>
          </div> 


</div>

<!-- //top -->
<!--logo, account-->
<div class="w3-content" style="max-width:1300px;margin-top:80px;margin-bottom:80px">
   <div class="w3-panel w3-left w3-light-gray">
    <img src="images/logoBlack.png" width="200" height="50" border="0">
   </div>
   <div class="w3-panel w3-right w3-light-gray">
    <font color="black"><%=session.getAttribute("loginId")%>님 환영합니다.</font>
    
     <script type="text/javascript" charset="utf-8" src="/js_std/kor/util/timeoutchk.js" 
              class="btn_bgtd_timeout" align="right" ></script>
             <span id="timer"></span>
             <a href="javascript:refreshTimer();"><img src="images/time.PNG" width="65" height="23"></a>
             &nbsp;&nbsp;&nbsp;
    
    
    <input type="button" class="w3-button w3-white w3-border w3-tiny"
            value="로그아웃" onClick="javascript:logout()">
   <br>
   <div class="w3-dropdown-hover">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="w3-button w3-white w3-border" style="width:200%" onClick="window.location='memberMypage.do'">마이페이지</button>
  <div class="w3-dropdown-content w3-bar-block w3-border">
    <a href="#" class="w3-bar-item w3-button" onClick="window.location='memberUpdate.do'">내 정보 관리</a>
<%String id=(String)session.getAttribute("loginId");
            if(id.equals("admin")){%>
               <a href="oneqna_list.do" class="w3-bar-item w3-button">1:1 문의하기</a>
                <a href="email_adminlist.do" class="w3-bar-item w3-button">이메일 상담</a>
                <a href="admin_list.do" class="w3-bar-item w3-button">전화 예약 문의 내역</a>
               <%}else{ %>
         
               <a href="qnalist_Id.do?writer=<%=session.getAttribute("loginId")%>"
               class="w3-bar-item w3-button">1:1문의하기</a>
               <a href="emailList_id.do?writer=<%=session.getAttribute("loginId")%>"
               class="w3-bar-item w3-button">이메일 상담</a>
               <a href="member_list.do?call_writer=<%=session.getAttribute("loginId") %>"
               class="w3-bar-item w3-button">전화 상담 예약</a>
                     <%} %>  </div>
</div>
            
  </div>
  </div>
<!--logo -->
<!-- banner -->
<!-- Slideshow -->
  <div class="w3-content" style="max-width:1300px;margin-top:80px;margin-bottom:80px">
  <img class="mySlides" src="images/banner1.jpg" style="width:100%">
      <div class="w3-display-topleft w3-container w3-padding-32">
      </div>
   <img class="mySlides" src="images/banner2.jpg" style="width:100%; height:80%;">
      <div class="w3-display-topleft w3-container w3-padding-32">
      </div>
   <img class="mySlides" src="images/banner3.jpg" style="width:100%">
      <div class="w3-display-topleft w3-container w3-padding-32">
      </div>
      
    <!-- Slideshow next/previous buttons -->
    <div class="w3-container w3-light-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
    
      <div class="w3-center">
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>
  </div>
<!-- banner -->
<!-- about section -->
<section class="about-w3l" id="about">
   <div class="container-fluid">
      <div class="col-lg-6 col-md-6 col-sm-6 about-agileinfo1" data-aos="flip-right">
         <div class="pogoSlider" id="js-main-slider">
            <div class="pogoSlider-slide" data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/about1.jpg);background-position:center;"></div>
            <div class="pogoSlider-slide" data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/about2.jpg);background-position:center;"></div>
            <div class="pogoSlider-slide" data-transition="shrinkReveal" data-duration="1000"  style="background-image:url(images/about3.jpg);background-position:center;"></div>
         </div><!-- .pogoSlider -->
      </div>
      
      <div class="col-lg-6 col-md-6 col-sm-6 about-agileinfo2" data-aos="flip-left">
         <div class="aboutinfo">
            <h2>About Us</h2><br>
            <p>1. 전사(All Enterprise)의 금융 상품 정보를 제공하여 전 범위적 금융 서비스를 제공합니다.</p><br>
            <P>2. 자체 공인인증 시스템 도입으로 보안성이 뛰어납니다.</P><br>
            <P>3. 온라인을 통한 비대면 계좌 개설 서비스를 제공합니다.</P><br>
            <p>4. 선택한 금융 상품을 판매 하는 지점을 지도를 통해 안내합니다.</p><br><br><br>
           
         </div>
      </div>
      <div class="clearfix"></div>
   </div>
</section>
<!-- /about section -->
<!---728x90--->
<!-- services section -->
<section class="services-w3l" id="services">
   <div class="container">
      <table width = "500" style='float:left;'>
         <tr>
         <td align = "left" colspan = "4"><h2>새 소식</h2></td>
         </tr>
         
         <tr>
         <td align = "right" colspan = "4"><a href = "news_list.do">더 보기</a></td>
         </tr>
         
         <c:if test="${empty mainNews}">
            <tr>
               <td colspan="3">등록된 새 소식이 없습니다.</td>
            </tr>
         </c:if>
      
         <c:forEach var="dto" items="${mainNews}">
         <tr>
         <td width = "90%" colspan = "2"><a href="news_content.do?news_no=${dto.news_no}"><font color = "black">${dto.news_title}</font></a></td>
         <td></td>
         <td width = "10%" align = "right">${dto.news_regdate}</td>
         </tr>
         </c:forEach>
      </table>
      <!-- 공지사항 -->
      <table width = "500" style='float:right;'>
         <tr>
         <td align = "left" colspan = "4"><h2>공지사항</h2></td>
         </tr>
         
         <tr>
         <td align = "right" colspan = "4"><a href = "notice_list.do">더 보기</a></td>
         </tr>
         
         <c:if test="${empty mainNotice}">
            <tr>
               <td colspan="3">등록된 공지사항이 없습니다.</td>
            </tr>
         </c:if>
      
         <c:forEach var="dto" items="${mainNotice}">
         <tr>
         
         <td width ="90%" colspan = "2"><a href="notice_content.do?notice_no=${dto.notice_no}"><font color = "black">${dto.notice_title}</font></a></td>
         <td></td>
         <td width = "10%" align = "right">${dto.notice_regdate}</td>
         
         </tr>
         </c:forEach>
      </table>
      <!-- 공지사항 끝 -->
   </div>
</section>
<!-- /services section -->
<div align = "center" class = "w3-light-grey">
<table  width = "1200">
<tr align = "left"><td colspan = "7"><font size = "5">코코넛 뱅크의 추천상품을 확인해 보세요</font></td></tr>
<tr><td height = "20"></td></tr>
<tr height = "300">
<td width =30%><img src="<%=request.getContextPath()%>/images/신한.png" width ="80%"></td>
<td width =30%><img src="<%=request.getContextPath()%>/images/기업.png" width ="80%"></td>
<td width =30%><img src="<%=request.getContextPath()%>/images/하나.png" width ="80%"></td>
<td width =30%><img src="<%=request.getContextPath()%>/images/우리.png" width ="80%"></td>
</tr>
<tr><td height = "30"></td></tr>
</table>
</div>
<!-- map -->
<div class="map-agileits-w3layouts" data-aos="zoom-in">
   <iframe class="googlemaps" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d42226.79609935308!2d126.95618846828516!3d37.595841174472426!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca326b1899577%3A0x9bb64b099a31d3cc!2zS0fslYTsnbTti7DrsYXtgaw!5e0!3m2!1sko!2skr!4v1521201633989" style="border:0" allowfullscreen></iframe>
</div>
<!-- /map -->
<!-- footer -->
<section class="footer-agileits-w3layouts" id="contact">
   <div class="container">
      <div class="col-lg-3 col-md-3 col-sm-6 footer-w3-agile1" data-aos="flip-left">
         <h4>Links</h4>
         <ul class="links-w3ls">
            <li><p><a href="finIndex.do"><i class="fa fa-home" aria-hidden="true"></i> Home</a></p></li>
            <li><p><a href="#about" class="page-scroll"><i class="fa fa-universal-access" aria-hidden="true"></i> about coconutBank</a></p></li>
            <li><p><a href="#services" class="page-scroll"><i class="fa fa-file-text-o" aria-hidden="true"></i> 새소식 & 공지사항</a></p></li>
         </ul>
      </div>
      
      <div class="col-lg-3 col-md-3 col-sm-6 footer-w3-agile1" data-aos="flip-left">
         <h4>Q & A</h4>
         <ul class="links-w3ls">
        <% if(id.equals("admin")){%><!-- admin!!!1 -->
         <li><p><a href = "oneqna_list.do"><i class="fa fa-male"></i> 1 : 1문의</a></p></li>
            <li><p><a href = "admin_list.do"><i class="fa fa-phone"></i> 전화 상담 예약</a></p></li>
            <li><p><a href="email_adminlist.do"><i class="fa fa-envelope-o" aria-hidden="true"></i> 이메일 상담</a></p></li>
         </ul>
        <%}else{ %><!-- 일반user!!!! -->
        <li><p><a href = "qnalist_Id.do?writer=<%=session.getAttribute("loginId")%>"><i class="fa fa-male"></i> 1 : 1문의</a></p></li>
            <li><p><a href = "member_list.do?call_writer=<%=session.getAttribute("loginId") %>"><i class="fa fa-phone"></i> 전화 상담 예약</a></p></li>
            <li><p><a href="emailList_id.do?writer=<%=session.getAttribute("loginId")%>"><i class="fa fa-envelope-o" aria-hidden="true"></i> 이메일 상담</a></p></li>
         </ul>
         <%} %>
      </div>
      
      <div class="col-lg-3 col-md-3 col-sm-6 footer-w3-agile1" data-aos="flip-left">
         <h4>SOCIAL</h4>
         <ul class="links-w3ls">
         <li><p><a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i> 페이스북</a></p></li>
            <li><p><a href="https://www.twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i> 트위터</a></p></li>
            <li><p><a href="https://www.instagram.com/coconut_bank/"><i class="fa fa-instagram" aria-hidden="true"></i> 인스타그램</a></p></li>
         </ul>
      </div>
      
   

    <div class="col-lg-3 col-md-3 col-sm-6 footer-w3-agile1" data-aos="flip-left">
         <h4>DOWNLOAD </h4>
         <ul class="links-w3ls">
         <li><p><a href="https://play.google.com/store/"><i class="fa fa-google" aria-hidden="true"></i> Google play</a></p></li>
            <li><p><a href="https://itunes.apple.com/kr/genre/ios/id36"><i class="fa fa-apple" aria-hidden="true"></i> App Store</a></p></li>
            <li><p><a href="https://www.microsoft.com/ko-kr/"><i class="fa fa-windows" aria-hidden="true"></i> microSoft Store</a></p></li>
         </ul>
      </div>
      
      
      
      <div class="clearfix"></div>
   </div>
</section>
<!-- /footer -->
<!-- last section -->
<div class="copyright-w3-agile">
   <p>© Copyright by 시트콤</p>
   <p>© 2017 Bistro. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
</div>
<!-- /last section -->
<!-- back to top -->
<a href="#0" class="cd-top">Top</a>
<!-- /back to top -->
<!-- js files -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/SmoothScroll.min.js"></script>
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.easing.min.js"></script>
<script src="js/grayscale.js"></script>
<script src="js/top.js"></script>
<script src="js/jarallax.js"></script>
<script type="text/javascript">
    /* init Jarallax */
    $('.jarallax').jarallax({
        speed: 0.5,
        imgWidth: 1366,
        imgHeight: 768
    })
</script>
<script src='js/aos.js'></script>
<script src="js/aos2.js"></script>
<!-- contact section -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>
<!-- /contact section -->
<!-- menu section -->
<script src="js/jQuery.lightninBox.js"></script>
<script type="text/javascript">
   $(".lightninBox").lightninBox();
</script>
<!-- /menu section -->
<!-- about section -->
<script src="js/jquery.pogo-slider.min.js"></script>
<script src="js/main.js"></script>
<!-- /about section -->
<!-- banner section -->
<script src="js/osSlider.js"></script>
<script type="text/javascript">
    var slider = new osSlider({ 
        pNode:'.slider', 
        cNode:'.slider-main li', 
        speed:3000,
        autoPlay:true 
    });
</script>
<!-- /banner section -->

<!-- /js files -->
<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>

</body>
</html>