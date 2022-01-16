<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@ include file="/top.jsp" %> 
<c:if test="${empty loginId}">
         <script>
      alert("로그인 후 이용이 가능합니다.")
      window.location = "index.jsp"
         </script>
</c:if>
<%
 // 현재 날짜 시간 구하는 함수
	 
	  SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
	  Date currentTime = new Date ( );
	  String dTime = formatter.format ( currentTime );
	 
%>
<script type="text/javascript">
	function writeSave(){
		
		if (f.admin_title.value==""){
			alert("제목을 입력하세요");
			f.admin_title.focus();
			return false;
		}
		if(f.admin_content.value==""){
			alert("내용을 입력하세요");
			f.admin_content.focus();
			return false;
		}
		
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1대1 문의하기</title>
</head>
<body>
<div align = "center">
<form name="f" action="adminWritePro.do"  method="post" onsubmit="return writeSave()">
<table id ='rn2' align="center" border="0" width="600" cellpadding="3" cellspacing="0" enctype="multipart/form-data" bordercolor="#999999" style="border-collapse:collapse;" >
		
<input type="hidden" name="no" value="${dto.no}" >

			<tr height = "30"></tr>
		
		<tr>
				<!--질문내용 -->
				<td bgcolor =#223A5E align="center" width = "25%" height="40"><font color="white">Q. 질문내용</font></td>
				<td olspan="3" align="center">${dto.content}</td>
			</tr>
			<td width="15%" height = "40" align="center" bgcolor =#223A5E><font color="white">작성일</font></td>
				<td align="left" hight="20"><font color="gray">${dto.reg_date}</font></td>
			</tr>
			
		</table>
		<table width="600">
		<tr height="30"></tr>
			<tr bgcolor=#cccbcf>
				<td colspan="2"></td>
			</tr>
		<tr>
					<td width="15%" height = "40" align="left"><font>Q. 관리자 의견 등록하세요</font></td>
		</tr>
		
		<tr>
			<td>&nbsp&nbsp&nbsp제목 :&nbsp<input type="text" name="admin_title" value="${dto.admin_title }" width="60" size="70"></td>
		</tr>
	
		<tr>
			<td><textarea name="admin_content" rows="15" cols="80" value="${dto.admin_content}" style="resize:none;">${dto.admin_content}</textarea></td>
		</tr>
			<input type=hidden name ="admin_regdate" value="<%=dTime %>">
		<tr>
			
<tr align="center" height="40">
	<td colspan="2" align="right">			
				<input type="hidden" name="writer" value="<%=session.getAttribute("loginId")%>" >
				
				<input type="submit" value="답변등록 완료">
				<input type="reset" value="다시작성">
		</tr>
		<tr bgcolor=#cccbcf>
				<td colspan="2"></td>
			</tr>
	</table>
	
	</form>

</div>
</body>
<%@ include file="/bottom.jsp" %> 