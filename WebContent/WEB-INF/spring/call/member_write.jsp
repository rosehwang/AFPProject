<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 쓰기 </title>
</head>
<body>
  <div align = "center">
     <form name = "f" action = "member_write.do" method = "post">
    
       <table width ="600" height = "500">
           <tr height = "30"></tr>
       <tr><td align ="left" colspan = "5"><font size = "6">전화 상담 예약 작성</font></td></tr>
         <tr height = "30"></tr> 
          <tr>
           <td bgcolor =#223A5E width = "20" align ="center">
              <font color = "white">            
                         문의 종류
              </font>           
           </td>
           <td width = "20" align = "left">
             <select name = "call_type" >
               <option value = "예금문의">예금 문의</option>
               <option value = "펀드문의">펀드 문의</option>
               <option value = "대출문의">대출 문의</option>
               <option value = "외환문의">외환 문의</option>
               <option value = "모바일뱅킹문의">모바일뱅킹 문의</option>
             </select>
           </td>
           </tr>
           <tr>
            <td bgcolor =#223A5E width = "20" align = "center">
             <font color = "white">           
                        전화 가능 시간 
             </font>           
             </td>
             <td width = "150">
             <select name ="call_time">
              <option value ="10시">10:00</option>
              <option value ="11시">11:00</option>
              <option value ="12시">12:00</option>
              <option value ="13시">13:00</option>
              <option value ="14시">14:00</option>
              <option value ="15시">15:00</option>
              <option value ="16시">16:00</option>
              <option value ="17시">17:00</option>
             </select>
             </td>  
          </tr>
          
         <tr>
            <td width="20%" align="center" bgcolor =#223A5E><font color = "white">전화 번호 </font></td>
		    <td><input type="text" name="call_hp" size="48"></td>
         </tr> 
          
         <tr>
             <td width="20%" align="center" bgcolor =#223A5E><font color = "white">문 의 제 목</font></td>
		     <td><input type="text" name="call_title" size="48"></td>
         </tr> 
         <tr>
		     <td width="20%" align="center" bgcolor =#223A5E><font color = "white">내 용</font></td>
			 <td><textarea name="call_content" rows="10" cols="50" border = "1"></textarea></td>
		 </tr>
		 
		 <tr>
		    <td width = "20%" align = "center" bgcolor =#223A5E><font color = "white">작성자</font></td>
		    <td><input type= "text" name = "call_writer" value = "<%=session.getAttribute("loginId") %>" readonly></td>
		 </tr>
		 <tr><td height = "30"></td></tr>
		 <tr align ="right">
		   <td colspan="2" align="center">
		    <input type="submit" value="글쓰기">&nbsp;&nbsp;
			<input type="reset" value="다시작성">
		   </td>	
		 </tr>
        </table>
     </form>
  </div>
</body>
</html>
<%@ include file="/bottom.jsp" %>