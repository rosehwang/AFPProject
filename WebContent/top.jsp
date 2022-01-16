<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
      //window.open("coconuts_list.do", "list", "width=600, height=300");      
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


<script>
var iSecond; //초단위로 환산
var timerchecker = null;
window.onload = function() {
    fncClearTime();
    initTimer();
}
 
 
function fncClearTime() {
    iSecond = 600; //시간조정
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
    document.location.href = "index.jsp"
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>COCONUT BANK</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<style>
table
{
   font-family: 'Nanum Gothic', sans-serif;
}
a:link{
   text-decoration:none;
}
a:visited{/* 한번방문 */
   text-decoration:none;
}
</style>
</head>
<body bgcolor = #ececec>
   <table width="100%">
      <tr>
         <td>
            <a href="finIndex.do"><img src="images/logoBlack.png" width="150" height="40" border="0">
            </a>
         </td>
         
         <td align="right">
            <font color="black"><%=session.getAttribute("loginId")%>님 환영합니다.</font>
             <script type="text/javascript" charset="utf-8" src="/js_std/kor/util/timeoutchk.js" 
              class="btn_bgtd_timeout" align="right" ></script>
             <span id="timer"></span>
             <a href="javascript:refreshTimer();"><img src="images/time.PNG" width="65" height="23"></a>
             &nbsp;&nbsp;&nbsp;
             
            <div style="width:15%; float:right; margin-right :30px" class="w3-dropdown-hover">
                <button class="w3-button w3-border w3-white w3-tiny" style="width:100%" 
                onClick="window.location='memberMypage.do'"> 마이페이지</button>
                <div style="width:100%" class="w3-dropdown-content w3-bar-block w3-card-4">
                  <a href="#" class="w3-bar-item w3-button w3-small" onClick="window.location='memberUpdate.do'">내 정보 관리</a>

                <c:if test='${loginId eq "admin" }'>
               <a href="oneqna_list.do" class="w3-bar-item w3-button w3-small">1:1 문의하기</a>
                <a href="email_adminlist.do" class="w3-bar-item w3-button w3-small">이메일 상담</a>
                <a href= "admin_list.do" class="w3-bar-item w3-button w3-small">전화 예약 문의 내역 보기</a>
               </c:if>
         <c:if test='${! (loginId eq "admin") }'>
               <a href="qnalist_Id.do?writer=<%=session.getAttribute("loginId")%>
               "class="w3-bar-item w3-button w3-small">1:1 문의하기</a>
               <a href="emailList_id.do?writer=<%=session.getAttribute("loginId")%>
               "class="w3-bar-item w3-button w3-small">이메일 상담</a>
               <a href="member_list.do?call_writer=<%=session.getAttribute("loginId")%>
               "class="w3-bar-item w3-button w3-small">전화 상담 예약</a>
          </c:if>
               </div>
            </div>
            <input type="button" class="w3-button w3-white w3-border w3-tiny" value="로그아웃" onClick="javascript:logout()">
         </td>
      </tr>
      <tr>
         <td colspan = "2">
         <div class="w3-bar w3-border w3-center">
         
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
      </tr>
              
   
      <tr valign = "top">
         <td colspan = "2" height = "600">
</body>
</html>

