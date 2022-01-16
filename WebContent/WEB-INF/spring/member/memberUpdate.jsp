<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dto" class="member.dto.MemberDTO" />
<%@ include file="/top.jsp" %> 




<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>



<script type="text/javascript">
   function writeSave(){
      if (f.id.value==""){
         alert("아이디를 입력하세요.");
         f.id.focus();
         return false;
      }
      if (f.passwd.value==""){
         alert("비밀번호를 입력하세요.");
         f.passwd.focus();
         return false;
      }
      if (f.hp1.value==""){
         alert("연락처를 입력하세요.");
         f.hp1.focus();
         return false;
      }
      if (f.hp2.value==""){
         alert("연락처를 입력하세요.");
         f.hp2.focus();
         return false;
      }
      if (f.hp3.value==""){
         alert("연락처를 입력하세요.");
         f.hp3.focus();
         return false;
      }      
      return true;
   }
   function findAddress(){
      var url = "findAddress.do"
       window.open(url, "get", "height = 300, width = 800");
      }
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
  function sample4_execDaumPostcode() {
   
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('roadAddress').value = fullRoadAddr;
               document.getElementById('jibunAddress').value = data.jibunAddress;
               //document.getElementById('jibunAddress').value = expJibunAddr;

               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               if(data.autoRoadAddress) {
                   //예상되는 도로명 주소에 조합형 주소를 추가한다.
                   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                   document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

               } else if(data.autoJibunAddress) {
                   var expJibunAddr = data.autoJibunAddress;
                   document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                   document.getElementById('jibunAddress').value = expJibunAddr;
               } else {
                   document.getElementById('guide').innerHTML = '';
               }
           }
       }).open();
   }
  </script>
  
  
  
<head> <title>정보 수정</title>
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


</head>
<body class="w3-light-grey">


<div align="center">
      <form name="f" method="POST" onsubmit="return writeSave()"
         action="memberUpdatePro.do" border="1">
       <table width="700" align="center" class="outline" border="0">
         <tr height = "30"></tr>
         <tr>
            <td align = "center" colspan="2" class="w3-center-align w3-bottombar"><font size = "5">정보 수정</font><br><br>
            </td> 　</tr>
         <tr height = "30"></tr>
     
           
            <tr>
             <th width="200" align="left"><font color="red" size="3"> * </font> 이 름</th>
             <td class="m3"><input type="text" name="name" class="box" 
               style="width:200px; height:25px;" maxlength="5" value="${dto2.name}" readOnly>
               </td>
            </tr>
            
            <tr><td> 　</td></tr>
          
            <tr>
              <th align="left"><font color="red" size="3"> * </font> 아 이 디</th>
               <td class="m3"><input type="text" name="id" id = "id" class="box" 
                style="width:200px; height:25px;" value="<%=session.getAttribute("loginId")%>"readOnly>
         
               </td>
            </tr>
            
          <tr> <!-- 안내칸 -->
            <td> 　</td><!-- 빈칸만들기 -->       
       <td><font size="1"><span name="message" style="text-shadow:1px 1px 0 #444"></td> 
            </tr>
            
            
            <tr>
               <th align="left">1차 비밀번호</th>
               <td class="m3"><input type="password" name="passwd" size="20" maxlength="10" 
               style="width:200px; height:25px;">
               </td>
            </tr>
            
            <tr><td> 　</td></tr> <!-- 항목 사이에 빈 칸 -->
            
            <tr>
               <th align="left">2차 비밀번호(coconut)</th>
               <td class="m3"><input type="password" name="passwd2" size="20" maxlength="10" 
               style="width:200px; height:25px;">
               </td>
            </tr>
            
            <tr><td> 　<hr width="100%"> </td></tr> <!-- 항목 사이에 빈 칸 -->
            
            <tr>
               <th align="left"><font color="red" size="3"> * </font> 생년월일</th>
               <td class="m3"><input type="text" name="ssn" maxlength="8" size="20" style="width:200px; height:25px;" 
                value="${dto2.ssn}" readOnly ><br>
               <!--8자리까지만, 숫자만 입력할 수 있도록-->             
            </tr>
            
          <tr> 
            <td> 　</td><!-- 빈칸만들기 -->       
          </tr>
            
            <tr>
              <th align="left"> 이 메 일</th>
               <td class="m3"><input type="text" name="email" class="box" size="20" maxlength="20"
                title="이메일 아이디 입력"  style="width:200px; height:25px;"></td>
            </tr>
        
        <tr> <!-- 안내칸 -->
            <td> 　</td><!-- 빈칸만들기 -->       
       <td><font size="1"><span name="message" style="text-shadow:1px 1px 0 #444">ex) help@coconut.com</span></font></td> 
          </tr>
            
               <tr>
              <th align="left">연 락 처</th>
               <td class="m3"><input type="text" name="hp1" class="box" maxlength="3" size="5" onKeyPress="if ((event.keyCode<46)||(event.keyCode>57)||(event.keyCode==47)) event.returnValue=false;" 
               style="ime-mode:disabled" style="text-align:center; height:25px;"> -
               <input type="text" name="hp2" class="box" maxlength="4" size="5" onKeyPress="if ((event.keyCode<46)||(event.keyCode>57)||(event.keyCode==47)) event.returnValue=false;" 
               style="ime-mode:disabled" style="text-align:center; height:25px;"> -
                <input type="text" name="hp3" class="box" maxlength="4" size="5" onKeyPress="if ((event.keyCode<46)||(event.keyCode>57)||(event.keyCode==47)) event.returnValue=false;" 
               style="ime-mode:disabled" style="text-align:center; height:25px;"><br>
                </td>
            </tr>
            
      <tr> <!-- 안내칸 -->
            <td> 　</td><!-- 빈칸만들기 -->       
       <td><font size="1" color="red"><span name="message" style="text-shadow:1px 1px 0 #444">숫자만 입력 가능합니다.</span></font></td> 
          </tr>


      <!-- 주소찾기--------------------------------- -->
         <!-- 주소찾기--------------------------------- -->
      <tr>
      <th align="left"> 주  소</th>
       <td class="m3">
                               
       <input type="text" id="postcode" name="postcode" placeholder="우편번호" readOnly>
      <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
      <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명 주소" size="36" readOnly><br>
      <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번 주소" size="36" readOnly>
      <span id="guide" style="color:#999"></span>
     </tr>
   <!-- 주소찾기--------------------------------- -->
         <!-- 주소찾기--------------------------------- -->
            
            
            <tr><td> 　</td></tr> <!-- 항목 사이에 빈 칸 -->
         

            <tr>
               <td colspan="2" class="m3" align="center">
               <font color=red size="3">* 표시가 된 항목은 수정 불가능한 항목입니다.</font><br><br></td>
            </tr>
            
            <tr>
               <td colspan="2" align="center"><input type="submit" value="수정완료" class="w3-button w3-2017-navy-peony w3-round w3-padding-small">　
                <input type="reset" value="다시작성" class="w3-button w3-2017-navy-peony w3-round w3-padding-small">　
                 <input type="button" value="메인으로" onclick="window.location='finIndex.do'" class="w3-button w3-2017-navy-peony w3-round w3-padding-small">
                <br><br><br><br><br><br><br>
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>

 <%@ include file="/bottom.jsp"%>



