<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코코넛 삭제</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
				alert("코코넛 삭제 완료!")
				self.close()
		</script>
	</c:if>	
	<c:if test="${check <= 0}">	
		<script type="text/javascript">
				alert("코코넛 삭제 실패!")
				self.close()
			</script>
	</c:if>
</body>
</html>