%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<body>

	<c:if test="${res > 0}">
		<script type="text/javascript">
				alert("Coconut 인증 페이지로 이동합니다.")
				location.href="new_accountForm.do"
		</script>
	</c:if>	
	<c:if test="${res < 0}">	
		<script type="text/javascript">
				alert("코코넛을 먼저 생성해주세요! 코코넛 등록페이지로 이동합니다.")
				location.href="coconut_make.do?id=<%=session.getAttribute("loginId")%>"
			</script>
	</c:if>
</body></html>