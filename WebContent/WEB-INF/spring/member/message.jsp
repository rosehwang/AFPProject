<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- message.jsp -->
<script type="text/javascript">
	alert("${msg}")
	<%if(request.getAttribute("url").equals("index.jsp")){%>
		<jsp:forward page = "index.jsp" />
	<%}else{%>
	location.href="${url}"
	<%}%>
</script>