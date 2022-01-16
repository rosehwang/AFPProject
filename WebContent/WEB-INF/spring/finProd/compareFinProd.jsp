<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var isLogin = '<c:out value="${loginId}"/>';
if(isLogin == null || isLogin.trim()=="") {
	alert("로그인이 필요한 페이지 입니다. 로그인 화면으로 이동 합니다.")
	location.href = "index.jsp"
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>금융 상품 비교</title>
<link href="css/finProd/wickedpicker.css?ver=2" rel="stylesheet" type='text/css'
	media="all" />
<link href="css/finProd/style.css?ver=4" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/main/googleFont.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3css.css" rel="stylesheet" type='text/css'
	media="all" />
<link href="<%=request.getContextPath()%>/css/main/w3color.css" rel="stylesheet" type='text/css'
	media="all" />
</head>
<style>
body, table
{
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body>
<div class="w3-container">
  <div id="id01" class="w3-modal">
    <div style="width:97%"class="w3-modal-content w3-card-4">
      <header class="w3-container w3-2017-navy-peony"> 
        <font size = "6">금융 상품 비교하기</font>
      </header>
				<div class="w3-container">
					<p>금융상품 비교는 최대 3개까지 가능합니다.</p>
					<hr>
					<table class="type01" width="100%">
						<tr>
							<th width="15%">번호</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.num}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>상품명</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.name}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>종목</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.kind}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>은행</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.bank}은행</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>위치</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.location}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>상품특징</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.content}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>가입대상</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.member}대</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>가입기간</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.duration}년</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>가입금액</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.money}원</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>금리안내/우대금리</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.interest}%</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>적립방법/이자지급방법</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.method}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>가입/해지안내</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.join}</td>
							</c:forEach>
						</tr>
						<tr>	
							<th>유의사항</th>
							<c:forEach var="cl" items="${clist}">
							<td>${cl.note}</td>
							</c:forEach>
						</tr>
					</table>

				</div>
				<footer class="w3-container w3-2017-navy-peony">
        <p>coconutBank</p>
      </footer>
    </div>
  </div>
</div>

<c:if test="${!(empty clist)}">
	<script>
		document.getElementById('id01').style.display='block'
	</script>
</c:if>
</body>
</html>