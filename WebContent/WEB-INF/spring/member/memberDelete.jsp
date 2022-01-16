<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <%@ include file="/top.jsp" %> 

<c:if test="${empty loginId}">
   <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>


<html> 
  <script>
 function delete2() {
      if (confirm("정말 탈퇴하시겠습니까?") == true) {
         document.f.submit();
      } else {   //취소
         return "memberDelete.do"
         }
   }
</script>


<head>
<title>회원 탈퇴</title>
<!-- /css -->
<title>회원 탈퇴</title>
</head>
<body class="w3-light-grey">
   <div align="center">
      <form name="f" action="memberDeletePro.do">
         <table width="600" align="center" class="outline" border="0">
	
         <br><br><br>
            <tr align="center">
               <td colspan="2" align=center class="m2"><h3>회원 탈퇴</h3><br><br>
                <input type="hidden" name="id" value="<%=session.getAttribute("loginId")%>" >
               </td>
            </tr>

<tr align="center">
	<td>
 회원 탈퇴를 할 경우
신청 즉시 해당 계정은 <strong>영구 삭제</strong>되며, <p>
<font color="red">어떠한 경우 </font>라도 복구되지 않습니다.<p>
본인 계정을 타인이 도용하여 회원탈퇴를 신청했을 시에는<p>
 고객센터로 문의를 해 주셔야 합니다.<p>

문의사항은 고객센터 (1600-0100)로 문의해 주시기 바랍니다.<br><br><br>
	</td>
</tr>   
  
  <tr>
  </tr>
  
   <tr>
      <td align="center" colspan="2"> 
         <input type="button" value="회원탈퇴" onClick = "javascript:delete2()" 
         class="w3-button w3-2017-navy-peony w3-round w3-padding-small">
         <input type="button" value="메인화면으로" onclick="window.location='memberMypage.do'"
         class="w3-button w3-2017-navy-peony w3-round w3-padding-small">            
      </td>
   </tr>      
         </table>
      </form>
   </div>   
</body>
<br><br><br><br><br><br>
<%@ include file="/bottom.jsp" %>





 