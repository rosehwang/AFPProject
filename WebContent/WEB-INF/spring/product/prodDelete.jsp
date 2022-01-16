<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fonts -->
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /fonts -->
<!-- css -->
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
<!-- /css -->
<html>
<head>
	<title>상품 삭제</title>
</head>
<body bgcolor = #ececec>
	<div align="center">
		<form name="f" action="prod_deletePro.do" method="post">
			<table width="400" align="center">
				<tr height = "30">
					<td colspan="2" align="center">상품 삭제하기</td>
				</tr>
				<tr height = "30">
					<td bgcolor= #223A5E align="center"><font color = "white">비밀번호</font></td>
					<td><input type="password" name="passwd">
					<input type="hidden" name="num" value="${param.num }"/>
					<input type="hidden" name="id" value=<%=session.getAttribute("loginId") %>>
					</td>
				</tr>
				<tr height = "30">
					<td colspan="2" align="center">
						<input type="submit" class="w3-button w3-small w3-black" value="삭제하기">
						<input type="reset" class="w3-button w3-small w3-black" value="초기화">
					</td>
				</tr>
			</table>
		</form>	
	</div>
</body>
</html>
