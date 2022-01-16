<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.util.regex.*"%>
<%@ include file="/top.jsp"%>
<link rel="stylesheet" type="text/css" href="css/oneqna/board_type1.css" />
<script type="text/javascript">
   function writeSave() {

      if (f.content.value == "") {
         alert("내용을 입력하세요");
         f.content.focus();
         return false;
      }
      var reg=confirm("글을 입력하시겠습니까?");
      if(reg){
         alert("글입력이 완료되었습니다.");
         document.f.submit();
      }

   }
</script>
<script type="text/javascript">
function email_change(){
   if(document.f.email.options[document.f.email.selectedIndex].value == '0'){
    document.f.selectEmail.disabled = true;
    document.f.selectEmail.value = "";
   }
   if(document.f.email.options[document.f.email.selectedIndex].value == '9'){
    document.f.selectEmail.disabled = false;
    document.f.selectEmail.value = "";
    document.f.selectEmail.focus();
   } else{
    document.f.selectEmail.disabled = true;
    document.f.selectEmail.value = document.f.email.options[document.f.email.selectedIndex].value;
   }
   }
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이메일 문의하기</title>
</head>
<div align="center">

   <form name="f" action="useremailPro.do" method="post" enctype="multipart/form-data" style="border-collapse: collapse;">

      <table width="600">
         <tr height="30"></tr>
         <tr height="30"></tr>
         <tr>
         <td>
         <table align="center" width="600">
            <tr>
               <td colspan="2" width="15%" height="40" align="center"
                  bgcolor=#223A5E><font color="white">Q. 이메일 문의</font></td>
            </tr>
            <tr height="30"></tr>
            <tr>
               <td width="10%" align="center">작성자</td>
               <td><input type="text" name="writer"
                  value="<%=session.getAttribute("loginId")%>" readOnly size="15"></td>
            </tr>
            <tr>
               <!-- 이메일 형식대로입력-->
               <td width="20%" align="center">e-mail</td>
               <td>
               <input type="text" name="email_id" value="이메일" onfocus="this.value='';">  @
               
      <input type="text" name="selectEmail" value="" disabled >
   <select name="email" onchange="email_change()">
    <option value="0" >선택하세요</option>
    <option value="9">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="hanmail.com">hanmail.com</option> 
    <option value="gamil.com">gmail.com</option> 
    <option value="nate.com">nate.com</option> 
   </select>
               <input type="hidden" name="writer_email">
            </tr>

            <tr>
               <td width="20%" align="center">제목</td>
               <td><input type="text" name="writer_title" size="50"></td>
            </tr>
            <tr>
               <td align="center" colspan="2"><textarea name="content"
                     rows="15" cols="70" style="resize: none;"></textarea></td>
            </tr>

            <tr align="center" height="40">
               <td colspan="2" align="center"><input type="button"
                  value="질문입력 완료" onclick="writeSave();">&nbsp;&nbsp; <input type="reset"
                  value="다시작성">
            </tr>
         </table>
         </td>
         </tr>
		</table>
         </form>
         </div>
         <br>
         <br>
         <br>
         <br>
         <br>
          </body>
         </html>
         
         <%@ include file="/bottom.jsp"%>