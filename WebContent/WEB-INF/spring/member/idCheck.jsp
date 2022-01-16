<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script type="text/javascript">
function useId(id){
	var id = id
 window.opener.document.getElementById("id").value = id
 self.close()
	}
</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bistro a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- fonts -->
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /fonts -->

<!-- css -->
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="css/main/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/main/aos.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/main/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->
</head>
</head>

<body>
<form name = "f" action = "idCheck.do" method="post">
사용하실 <strong>ID</strong>를 입력 해 주세요.
<input type = "text" name = "id">
<input type = "submit" value = "검색" class="w3-button w3-2017-navy-peony w3-round w3-padding-small"><br><br>



<%
	String check = (String)request.getAttribute("check");
	if(check != null)
	{%>
		<strong>${id}는${msg}</strong>
		<%if(check.equals("false"))
		{ %>
		<input type = "button" value = "사용하기" class="w3-button w3-2017-navy-peony w3-round w3-padding-small"
		 onClick = "javascript:useId('${id}')" ><br>
		<%	}
	} %>
<input type ="button" value="닫기" class="w3-button w3-2017-navy-peony w3-round w3-padding-small">


</form>
</body>
</html>



