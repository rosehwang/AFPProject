<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

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

<!-- 달력부분  -->
<!-- jQuery ui 기본 CSS -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- jQuery UI 라이브러리 js파일 -->
 <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> 가장 최근 버전-->


<!-- 선택달력기능 -->
<script> 
	$(function() {
	   $("#ssn").datepicker( {
		dateFormat: 'yy-mm-dd', 	//텍스트 필드에 입력되는 날짜형식
		prevText: '이전 달', 		// 이전달 아이콘 툴팁 뜨게하는거
		nextText: '다음 달',		// 다음달 아이콘 툴팁
		monthNameShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNameMin: ['일','월','화','수','목','금','토'],
		changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,	//월, 년순의 셀렉트박스를 년,월 순으로 바꾼다
		yearRange: 'c-100:c' //년도 선택 박스를 현재 년도에서 이전, 이후의 범위(c-100 = 100년)
	});
});
</script>

<title>가입 유무 확인</title>
</head>

<body class="w3-container w3-light-grey">
<!-- 로고이미지 넣는 곳 -->
	<table width="100%">
		<tr> <!--  로고 -->
			<td><a href="index.jsp"><img src="images/logoBlack.png"
			width="150" height="40" border="0"> </a></td>
		</tr>
		
		<tr> <!-- 회원가입 단계 이미지 -->
		<td align="center"><img src="images/joinstep2.png" width="800" height="100"> </td>
		</tr>
	</table>

	<form name="f" action="memberCheckPro.do" method="post">
<br><br><br><div align="center" class="w3-container w3-light-grey">
		<h3>회원 중복확인</h3>
			<table border="0" width="1000" height="300">
			<tr align="center">
			<td width="50%">이 름 <input type="text" name="name" class="box">　
			 생 년 월 일 <input type="text"id="ssn" name="ssn" class="box" maxlength="30" readOnly> <br><br>
				
				<input type="submit" value="조 회" class="w3-button w3-2017-navy-peony w3-round-xxlarge">　
				<input type="reset" value="다시 입력하기" class="w3-button w3-2017-navy-peony w3-round-xxlarge"> 　
				<input type="button" onClick="window.location='index.jsp'" value="메인으로"
				class="w3-button w3-2017-navy-peony w3-round-xxlarge"><br></td></tr>
		
				
					<tr> <td width="50%" align="center"> <p>
						이름 및 생년월일 확인을 통해 가입 여부를 확인합니다.<p>
						아이디/비밀번호 분실 등 본인 여부 확인이 필요할<p>
						경우를 위해 가급적 신분증에 기재된 이름, 생년월일을 입력해 주세요.<p>
						허위 정보를 입력하시면 본인 확인이 어려워 도움을 드릴 수가 없습니다.<p>
						정확한 정보를 입력해 주시기 바랍니다.<p>
					</td>
			</table>
			</div>
	</form><br><br><br><br><br>
	<br><br><br>
</body>

<%@ include file="/bottom.jsp"%>


