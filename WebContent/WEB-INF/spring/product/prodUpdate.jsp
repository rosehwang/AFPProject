<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/top.jsp" %>
<script type="text/javascript">
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

               document.getElementById('location').value = fullRoadAddr;
           }
       }).open();
   }
</script>
<html>
<body>
<div align = "center">
<!-- <table width = "1000">
<tr>
<td> -->
	<form name="f" action="prod_updatePro.do" method="post">
	<table width="1000" align="center">
		<tr height = "30"></tr>
			<tr>
            	<td align = "left" colspan="2"><font size = "6">상품 수정하기</font></td>
            </tr>
            <tr>
            <td colspan="2">은행명에선 "은행"을 제외한 은행명 입력<br>
            	가입대상,가입기간,금리안내에는 단위를 제외한 숫자만 입력</td>
         	</tr>
         <tr height = "30"></tr>
		<tr height = "30">
			<td bgcolor= #223A5E width = "30%" align = "center"><font color = "white">상품 종목</font></td>
			<td align="left"><select name="kind">
					<option value="예금">예금</option>
					<option value="적금">적금</option>
					<option value="펀드">펀드</option>
					<option value="기타">기타</option>
			</select></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">판매 은행</font></td>
			<td><input type="text" name="bank" value="${dto.bank }" size="100">
			</td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">위치</font></td>
			<td><input type="text" id="location" name="location" value="${dto.location }" size="83">
         &nbsp;<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
			</td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">상품명</font></td>
			<td><input type="text" name="name" value="${dto.name }" size="100">
			<input type="hidden" name="num" value="${dto.num }">
			</td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">상품특징</font></td>
			<td><textarea name="content" rows="5" cols="102">${dto.content }</textarea></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">가입대상(대)</font></td>
			<td><input type="text" name="member" value="${dto.member }" size="100" onkeypress="onlyNumber();"></td>
		</tr>
		<%-- <tr>
			<th width="15%" class="m2">상품이미지</th>
	<%	String upPath = config.getServletContext().getRealPath("/myshop/images");
		String filename = upPath + "\\" + ${dto.filename};%>			
			<td align="center" colspan="3">
				<img src="<%=filename%>" border="0" width="40" height="40">
			</td>
		</tr> --%>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">가입기간(년)</font></td>
			<td><input type="text" name="duration" value="${dto.duration }" size="100" onkeypress="onlyNumber();"></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font  color = "white">가입금액(원)</font></td>
			<td><input type="text" name="money" value=${dto.money } size="100" onkeypress="onlyNumber();"></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font  color = "white">금리안내(%)</font></td>
			<td><input type="text" name="interest" value="${dto.interest }" size="100" onkeypress="onlyFloat();"></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">적립 및 이자지급방법</font></td>
			<td><input type="text" name="method" value="${dto.method }" size="100"></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">가입/해지안내</font></td>
			<td><input type="text" name="join" value="${dto.join }" size="100"></td>
		</tr>
		<tr height = "30">
			<td bgcolor= #223A5E align = "center"><font color = "white">유의사항</font></td>
			<td><textarea name="note" rows="10" cols="102">${dto.note }</textarea></td>
		</tr>
		<tr height = "30">
			<td colspan="4" align="center">
			<a href="prod_list.do"><input type="button" class="w3-button w3-small w3-black" value="상품 리스트"></a>&nbsp;&nbsp;
			<a href="javascript:check()"><input type="button" class="w3-button w3-small w3-black" value="수정완료"></a>&nbsp;&nbsp;
			<input type="reset" class="w3-button w3-small w3-black" value="초기화"></td>
		</tr>
	</table>
	</form>
<!-- </td>
</tr>
</table> -->
</div>
</body>
</html>
<%@ include file="/bottom.jsp" %>