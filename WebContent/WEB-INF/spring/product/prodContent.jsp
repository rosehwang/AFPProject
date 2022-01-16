<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %> 
<style type="text/css">
   .hidden { display:none; }
</style>
<script src="js/jquery-1.9.0.js" type="text/javascript"></script>
<!-- 계산기 start -->
<script type="text/javascript">
$(document).ready(function () { // 계산기 보이기/숨기기
   $('#calShowAndHide').click(function () {
      var bt = document.getElementById("calShowAndHide")
      $('#calLayer').toggleClass('hidden');
      if (bt.value == "숨기기") {
         bt.value = "보이기"
      }else {
         bt.value = "숨기기"
      }
   });
});

function cal() { // 계산기 기능
      var cal_res = document.getElementById("cal_res")
      var kind = '<c:out value="${dto.kind}"/>'
      var month = document.getElementById("cal_month").value
      var money = document.getElementById("cal_money").value
      var interest = document.getElementById("cal_int").value
      //interest = interest.toFixed(3) // 소숫점 세번째자리까지 허용
      var res = 0
      
      if(isNaN(month) || month==0) { // 개월에 올바른 값이 들어갔는지 확인
         alert("개월을 정확히 입력해야 합니다.")
         cal_month.value = ""
         document.c.cal_month.focus();
         return
      }
      if(isNaN(money) || money==0) { // 금액에 올바른 값이 들어갔는지 확인
         alert("금액을 정확히 입력해야 합니다.")
         cal_money.value = ""
         document.c.cal_money.focus();
         return
      }
      if(isNaN(interest) || interest==0) { // 금리에 올바른 값이 들어갔는지 확인
         alert("금리를 정확히 입력해야 합니다.")
         cal_int.value = ""
         document.c.cal_int.focus()
         return
      }
      
      money = parseInt(money)
      month = parseInt(month)
      interest = parseFloat(interest)
      
      if(kind=="예금") { // 결과값 계산
         res = money + (money * interest * 0.01 * month/12)
      }else if(kind=="적금") {
         res = money * month
         for(var i=0;i<month;i++) {
            res += money * (interest * 0.01) * ((month - i) / month)
         }
      }
      
      cal_res.value = addCommas(res)
   }

function addCommas(nStr) { // 결과금액 세자리씩 끊어서 표시
   nStr += '';
   x = nStr.split('.');
   x1 = x[0];
   var rgx = /(\d+)(\d{3})/;
   while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
   }
   return x1;
}

$(document).ready(function () { // 금리 제한(50%)
   $('#cal_int').keyup(function () {
      if ($('#cal_int').val() > 50) {
         alert("금리는 50%를 넘지 않습니다.")
         document.getElementById("cal_int").value = ""
      }
   });
});

function onlyNumber(){ // 숫자만 입력 가능
   if((event.keyCode<48)||(event.keyCode>57)) {
      event.returnValue=false;
   }
}
function onlyFloat(){ // 숫자와 .만 입력 가능
   if((event.keyCode<48)||(event.keyCode>57)) {
      if(event.keyCode!=46)
         event.returnValue=false;
   }
}
function deleteMember(num){
	   window.open("prod_delete.do?num="+num, "delete", "width=500, height=300");
	}
</script>
<!-- 계산기 end -->
<html>

<body>
<div align = "center">
<table width = "1000"><!-- 바깥 테이블 -->
<tr>
<td>
<form name="f" action="prod_list.do" method="post" style='float:left;'>
   <table width="600" align="center">
      <tr height = "30"></tr>
         <tr>
            <td align = "left" colspan="2"><font size = "6">상품 상세보기</font></td>
         </tr>
         <tr height = "30"></tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">은행</font></td>
         <td>&nbsp;&nbsp;${dto.bank }은행</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">위치</font></td>
         <td>&nbsp;&nbsp;${dto.location }</td>
      </tr>
      <tr height = "30">
         <td  bgcolor= #223A5E align = "center"><font color = "white">상품 종목</font></td>
         <td>&nbsp;&nbsp;${dto.kind }</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">상품명</font></td>
         <td>&nbsp;&nbsp;${dto.name }</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">상품특징</font></td>
         <td colspan="3"><textarea name="content" rows="10"
               cols="50" readOnly>${dto.content }</textarea></td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">가입대상</font></td>
         <td>&nbsp;&nbsp;${dto.member }대</td>
      </tr>
      <%-- <tr>
         <th width="15%" class="m2">상품이미지</th>
   <%   String upPath = config.getServletContext().getRealPath("/myshop/images");
      String filename = upPath + "\\" + ${dto.filename};%>         
         <td align="center" colspan="3">
            <img src="<%=filename%>" border="0" width="40" height="40">
         </td>
      </tr> --%>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">가입기간</font></td>
         <td>&nbsp;&nbsp;${dto.duration }년</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">가입금액</font></td>
         <td>&nbsp;&nbsp;${dto.money }원</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">금리안내</font></td>
         <td>&nbsp;&nbsp;${dto.interest }%</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center" width="40%"><font color = "white">적립 및 이자지급방법 </font></td>
         <td>&nbsp;&nbsp;${dto.method }</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">가입/해지안내</font></td>
         <td>&nbsp;&nbsp;${dto.join }</td>
      </tr>
      <tr height = "30">
         <td bgcolor= #223A5E align = "center"><font color = "white">유의사항</font></td>         
         <td colspan="3"><textarea name="note" rows="10" cols="50" readOnly>${dto.note }</textarea></td>
      </tr>
      <tr><td height = "30"></td></tr>
      <tr height = "30">
         <td colspan="4" class="m1" align="center">
         <input type = "button"  id = "back" class="w3-button w3-small w3-black" value = "목록으로">
         <!-- <input type="submit" value="상품 리스트"> -->&nbsp&nbsp
         <c:if test='${loginId eq "admin"}'>
         <a href="prod_update.do?num=${dto.num }"><input type = "button" class="w3-button w3-small w3-black" value = "수정하기"></a>&nbsp;&nbsp;
         <a href="javascript:deleteMember(${dto.num })"><input type = "button" class="w3-button w3-small w3-black" value = "삭제하기"></a>
         </c:if>
         </td>
      </tr>
   </table>
</form>
</td>
<td>
<div style='float:left;'>
<c:if test="${dto.kind == '예금' || dto.kind == '적금'}">
         <font size = "6">금리 계산기</font>
         <br>
         <input type="button" id="calShowAndHide" value="숨기기">
         
         <div id="calLayer">
         
            <form name="c" mothod="post">
            <table class = "w3-2017-navy-peony" width = "300" height = "180">
               <tr align="center">
                  <td>이 상품을 <input type="text" id="cal_month" name="cal_month" style="text-align:right;"
                  size="1" maxlength="3" value="12" title="신청기간 입력" onkeypress="onlyNumber();">개월
                     <input type="text" id="cal_money" name="cal_money" style="text-align:right;" 
                     size="7" maxlength="9" title="신청금액 입력" onkeypress="onlyNumber();">원 으로</td>
               <tr align="center">
                  <td align="center">금리 연 <input type="text" id="cal_int" name="cal_int" style="text-align:right;"
                  size="5" maxlength="6" title="금리 입력" onkeypress="onlyFloat();">%를 적용하면?</td>
               </tr>
               <tr align="center">
                  <td><input type="button" value="결과보기" onclick="cal();"></td>
               </tr>
               <tr align="right">
                  <td align = "center">세전: <input type="text" id="cal_res" style="text-align:right;" readonly>원</td> <!-- dir="rtl" -->
               </tr>
            </table>
            </form>
      
         </div>
         
         </c:if>
   </div>
   </td>
   </tr>   
   </table><!-- //바깥 테이블 --> 
   </div>
</body>
</html>
<script type="text/javascript">
/* window.onload = function() { */ // 예금, 적금에 따른 기본 금액 설정
	   var setMoney = document.getElementById("cal_money")
	   var kind = '<c:out value="${dto.kind}"/>'
	   if(kind=="예금") {
	      setMoney.value = 10000000
	   }else if(kind=="적금") {
	      setMoney.value = 100000
	      
	   }
	   
	   document.getElementById("back").onclick = function() { // 뒤로가기 기능(캐시값 유지를 위해)
	      history.back();
	   }
	/* } */
</script>

<%@ include file="/bottom.jsp" %> 