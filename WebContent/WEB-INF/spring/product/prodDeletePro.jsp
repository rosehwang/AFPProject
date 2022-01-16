<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${res>0}">
	<script type="text/javascript">
		alert("삭제를 완료하였습니다.")
		opener.location.href="prod_list.do";
		self.close();
	</script>
</c:if>
<c:if test="${res<=0}">
	<script type="text/javascript">
		alert("비밀번호가 틀립니다. 삭제에 실패하였습니다.")
		history.back()
	</script>
</c:if>
