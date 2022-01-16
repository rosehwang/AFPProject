<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<script type ="text/javascript">
function check() {
   if (confirm("처리 완료 하시겠습니까?") == true) {
       window.location = "admin_list.do?call_no=${cdto.call_no}&call_check=${cdto.call_check}"
      self.close()
   } else {

      return;
   }
}

function deleteConfirm() {
   if (confirm("정말 삭제하시겠습니까?") == true) {
      window.location = "member_delete.do?call_no=${cdto.call_no}"
      self.close()
   } else {

      return;
   }
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>상세 내용 보기 </title>
</head>
<body>
<!-- getCall을  통해 들고온다. -->
  <div align ="center">
    <table  width = "700" >
       <tr height = "30"></tr>
       <tr><td align ="left" colspan = "5"><font size = "6">전화 상담 문의 내역</font></td></tr>
         <tr height = "30"></tr>  
    </table>
     <table width = "700" border = "0">        
        <tr >
          <td width="20%" height = "50" bgcolor =#223A5E align="center"><font color = "white" > 문의 종류 </font></td>
          <td align ="center" width="30%" height ="30%">${cdto.call_type}</td>
           
          <td height = "50" bgcolor =#223A5E  align="center" width="20%"> <font color = "white">통화 가능 시간 </font></td>
          <td align ="center"  >${cdto.call_time}</td> 
        </tr>
       
        <tr>   
          <td height = "20" bgcolor =#223A5E  align="center"><font color = "white"> 작성자</font> </td>
          <td align = "center" width="30%">${cdto.call_writer}</td>
          
          <td height = "50" bgcolor =#223A5E  align="center"><font color = "white"> 통화 가능  번호  </font></td>
          <td align ="center" width ="70%">${cdto.call_hp}</td>
        </tr>
        
        <tr>   
          <td height = "50" bgcolor =#223A5E align="center"><font color = "white"> 문의 제목 </font> </td>
          <td align ="left" width ="100%" colspan="3">${cdto.call_title}</td>
        </tr>
        
        <tr>
          <td height = "50" bgcolor =#223A5E><font color = "white"> 문의 상세 내용 </font></td>
          <td colspan="3">${cdto.call_content}</td>
        </tr>
        <tr align = "right" bgcolor =#cccbcf>
            <td colspan ="4">
<% if (session.getAttribute("loginId").equals("admin")){ %>          
        
         
         <c:if test = "${cdto.call_check < 1}">
            <input type="button" value="처리 완료"
          onclick="return check()" class="w3-button w3-small w3-black" >&nbsp;&nbsp;
         </c:if>
            <input type="button" value="글목록"
          onclick="window.location='admin_list.do'" class="w3-button w3-small w3-black" ></td>
          
<% }else{ %>
           
         <input type="button" value="삭제"
         onclick="return deleteConfirm()" class="w3-button w3-small w3-black" >&nbsp;&nbsp;
               
           <input type="button" value="글목록"
          onclick="window.location='member_list.do'" class="w3-button w3-small w3-black" ></td>
<%} %> 
      </tr>
   </table>  
  </div>
</body>
</html>
<%@ include file="/bottom.jsp" %>