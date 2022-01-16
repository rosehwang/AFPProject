<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/top.jsp" %>
<html>
<head>
<title>금융 상품 검색</title>
<!--Stylesheet-->
<link href="css/finProd/style.css?ver=6" rel='stylesheet' type='text/css' />
<!--//Stylesheet-->
</head>
<body>
	<div class="bg-agile">
	<font size = "6">금융 상품 검색</font>
		<div class="book-appointment">
			<div class="book-form agileits-login">
				<form action="findFinProdOk.do" method="post">
					<!-- 종목 start -->
					<div class="wthree-text">
						<ul class="side-agileits">
							<table>
							<tr height = "30"></tr>
								<tr>	
									<td bgcolor = #223A5E width = "100" height = "30" align = "center"><font color = "white">종목</font></td>
								<td>
								<li><label class="anim"></label></li>
								<li><label class="anim"> <input type="checkbox" class="checkbox" name="kind" value="예금"> <span>예금</span>
								</label></li>
								<li><label class="anim"> <input type="checkbox" class="checkbox" name="kind" value="적금"> <span>적금</span>
								</label></li>
								<li><label class="anim"> <input type="checkbox" class="checkbox" name="kind" value="펀드"> <span>펀드</span>
								</label></li>
								<li><label class="anim"> <input type="checkbox" class="checkbox" name="kind" value="기타"> <span>기타</span>
								</label></li>
								</td>
								</tr>
							</table>
						</ul>
						<div class="clear"></div>
					</div>
					<!-- 종목 end -->
					
					<!-- 은행 start -->
					<div class="wthree-text">
						<ul class="side-agileits">
						<table>
								<tr>	
									<td bgcolor = #223A5E width = "100" height = "30" align = "center"><font color = "white">은행</font></td>
								<td>
								<li><label class="anim"></label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="bank" value="농협"> <span>농협</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="bank" value="신한"> <span>신한</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="bank" value="우리"> <span>우리</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="bank" value="sc제일"> <span>SC제일</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="bank" value="하나"> <span>하나</span>
							</label></li>
							</td>
							</tr>
							</table>
						</ul>
						<div class="clear"></div>
					</div>
					<!-- 은행 end -->
					
					<!-- 기간 start -->
					<div class="wthree-text">
						<ul class="side-agileits">
						<table>
								<tr>	
									<td bgcolor = #223A5E width = "100" height = "30" align = "center"><font color = "white">기간</font></td>
								<td>
								<li><label class="anim"></label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="duration" value="0 and 1"> <span>1년 이하</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="duration" value="1 and 3"> <span>1~3년</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="duration" value="3 and 5"> <span>3~5년</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="duration" value="5 and 100"> <span>5년 이상</span>
							</label></li>
							</td>
							</tr>
							</table>
						</ul>
						<div class="clear"></div>
					</div>
					<!-- 기간 end -->
					
					<!-- 수익률 start -->
					<div class="wthree-text">
						<ul class="side-agileits">
							<table>
								<tr>	
									<td bgcolor = #223A5E width = "100" height = "30" align = "center"><font color = "white">수익률</font></td>
								<td>
								<li><label class="anim"></label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="interest" value="0 and 3"> <span>3% 이하</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="interest" value="3 and 6"> <span>3~6%</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="interest" value="6 and 9"> <span>6~9%</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox" class="checkbox" name="interest" value="9 and 50"> <span>9% 이상</span>
							</label></li>
							</td>
							</tr>
							</table>
						</ul>
						<div class="clear"></div>
					</div>
					<!-- 수익률 end -->

					<!-- 연령 start -->
					<div class="wthree-text">
						<ul class="side-agileits">
						<table>
							<tr>	
									<td bgcolor = #223A5E width = "100" height = "30" align = "center"><font color = "white">연령</font></td>
								<td>
								<li><label class="anim"></label></li>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" name="member" value="0 and 19"> <span>10대</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" name="member" value="20 and 29"> <span>20대</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" name="member" value="30 and 39"> <span>30대</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" name="member" value="40 and 49"> <span>40대</span>
							</label></li>
							<li><label class="anim"> <input type="checkbox"
									class="checkbox" name="member" value="50 and 150"> <span>50대 이상</span>
							</label></li>
							</td>
							</tr>
							</table>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<!-- 연령 end -->
					
					<!-- 키워드 start -->
					<ul class="side-agileits">
						<table>
							<tr>	
									<td width = "100" height = "30" align = "center"><font color = "black">▼키워드</font></td>
								<td>
								<li><label class="anim"></label></li>
								</td>
								</tr>
								</table>
					</ul>
					<div class="phone_email">
						<input type="text" id="keyword" name="keyword" placeholder="keyword">&nbsp;&nbsp;    <!-- value="${dto.keyword}" -->
					</div>
					<!-- 키워드 end -->
					
					<!-- 검색 start -->
				<input type="submit" class="w3-button w3-small w3-black" value="확인">&nbsp;
				<input type="reset" class="w3-button w3-small w3-black" value="초기화">
					<div class="clear"></div>
					<!-- 검색 end -->
					
				</form>
				
				<!-- 검색 결과 테이블 start -->
				<div class="wthree-text">
					<input type="button" id="compareForm" class="w3-button w3-small w3-black w3-right" value="비교하기"><br><br>
					<table width="100%">
						<tr height = "30">
							<th width="5%" class="w3-2017-navy-peony">비교</th>
							<th width="8%" class="w3-2017-navy-peony">번호</th>
							<th width="40%" class="w3-2017-navy-peony">상품명</th>
							<th width="9%" class="w3-2017-navy-peony">종목</th>
							<th width="11%" class="w3-2017-navy-peony">은행</th>
							<th width="9%" class="w3-2017-navy-peony">기간</th>
							<th width="9%" class="w3-2017-navy-peony">수익률</th>
							<th width="9%" class="w3-2017-navy-peony">연령</th>
						</tr>
						<c:if test="${empty plist}">
							<tr align="center" height = "30">
								<td colspan="8">등록된 상품이 없습니다.
							</tr>
						</c:if>
						<% int i = 1; %>
						<c:forEach var="dto" items="${plist}">
							<tr align="center"  height = "30" bgcolor = "white">
								<td><input type="checkbox" id="compare" name="compare" value="${dto.num}"></td>
								<td><%=i%></td> <%i++; %>
								<td><a href="prod_content.do?num=${dto.num}">${dto.name}</a></td>
								<td>${dto.kind}</td>
								<td>${dto.bank}은행</td>
								<td>${dto.duration}년</td>
								<td>${dto.interest}%</td>
								<td>${dto.member}대</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 검색 결과 테이블 end -->
			</div>
		</div>
	</div>

	<!---728x90--->
	<!--copyright-->
	<!-- <div class="copy w3ls">
		<p>
			&copy; 2017. Nuptial Photography Order Form . All Rights Reserved |
			Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a>
		</p>
	</div> -->
	<!--//copyright-->
</body>
</html>
<!-- checkbox 검색 후 유지 start -->
<script type="text/javascript">
		kind = document.getElementsByName("kind")
		kindStr = '<c:out value="${dto.kind}"/>'
		for(var i=0;i<kind.length;i++) {
			if(kindStr.includes(kind[i].value)) {
				kind[i].checked = true
			}
		}
		bank = document.getElementsByName("bank")
		bankStr = '<c:out value="${dto.bank}"/>'
		for(var i=0;i<bank.length;i++) {
			if(bankStr.includes(bank[i].value)) {
				bank[i].checked = true
			}
		}
		duration = document.getElementsByName("duration")
		durStr = '<c:out value="${dto.duration}"/>'
		for(var i=0;i<duration.length;i++) {
			if(durStr.includes(duration[i].value)) {
				duration[i].checked = true
			}
		}
		interest = document.getElementsByName("interest")
		intStr = '<c:out value="${dto.interest}"/>'
		for(var i=0;i<interest.length;i++) {
			if(intStr.includes(interest[i].value)) {
				interest[i].checked = true
			}
		}
		member = document.getElementsByName("member")
		memStr = '<c:out value="${dto.member}"/>'
		for(var i=0;i<member.length;i++) {
			if(memStr.includes(member[i].value)) {
				member[i].checked = true
			}
		}
		document.getElementById("keyword").value = '<c:out value="${dto.keyword}"/>' // 검색 후 keyword값 유지 
		
		var compare = document.getElementById("compareForm")
		compare.addEventListener("click", function(event){
			compare = document.getElementsByName("compare")
			var url = "compareFinProd.do?";
			var target = ""
			var cnt = 0;
			
			for(var i=0;i<compare.length;i++) {
				if(compare[i].checked) {
					if(target=="") {
						target += "num="+compare[i].value
					}else {
						target += "&num="+compare[i].value
					}
					cnt++
				}
			}
			
			if(cnt > 3 || cnt < 1) {
				alert("비교는 1개 이상 3개 이하만 가능합니다")
				return
			}
			
			window.open(url+target, "compare", "width=1500, height=500");
		})
</script>
<!-- checkbox 검색 후 유지 end -->
<%@ include file="/bottom.jsp" %>