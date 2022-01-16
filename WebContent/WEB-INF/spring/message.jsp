<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- message.jsp -->
<script type="text/javascript">
   alert("${msg}")
   <%if(request.getAttribute("url").equals("index.jsp")){%>
   document.location.href = "index.jsp"
   <%}%>
   location.href = "${url}"
</script>