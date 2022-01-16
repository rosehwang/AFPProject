<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function checking(){

	   if(!document.f.check[0].checked) {
	      alert("이용약관에 동의를 해 주셔야 회원가입이 가능합니다.")
	      f.check[0].focus();
	
	   }else if(!document.f.check[1].checked){
	      alert("개인정보 수집에 동의를 해 주셔야 회원가입이 가능합니다.")
	        f.check[1].focus();

	   	} else {
		  // f.submit();
		   location.href = "memberCheck.do"
	   }
}
	   </script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
<link href='css/main/aos.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/main/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->
<title>약관 및 개인정보 동의</title>
</head>


<body  class="w3-container w3-light-grey">
	<form name="f" method="POST" action="memberCheck.do" class="w3-container w3-light-grey">
		<table width="100%">
			<tr>
				<!--  로고 -->
				<td><a href="index.jsp"><img src="images/logoBlack.png"
						width="150" height="40" border="0"> </a></td>
			</tr>

			<tr>
				<!-- 회원가입 단계 이미지 -->
				<td align="center"><img src="images/joinstep1.png" width="800"
					height="100"></td>
			</tr>
		</table>



		<div align="center" class="w3-container w3-light-grey">
			<p>
				<label for="memo"><font size="4" color="navy">coconut
						Bank 이용약관</font><font color="red">(필수)</font></label>
			</p>
			<textarea id="memo" name="bank" cols="120" rows="10"
				style="resize: none;" readOnly>
<제1장 총칙>
제1조(목적)
이 약관은 코코넛뱅크(이하 "회사"라고 함)가 제공하는 금융 및 제반 서비스의 이용과 관련하여 회원과 회사 간의 조건 및 절차에 관한 기본적인 사항을 정함을 목적으로 합니다.

제2조(용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용 계약: 회사가 제공하는 서비스 이용과 관련하여 회사와 이용 고객 간에 체결하는 계약을 말합니다.
2. 회원: 회사가 제공하는 절차에 따른 가입 신청 및 이용 계약 체결을 완료한 뒤, ID를 발급받아 회사의 서비스를 이용할 수 있는 자를 말합니다.
3. ID: 회원 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자, 특수문자, 숫자 등의 조합을 말합니다.
4. 체험 ID: 회원 식별과 회사가 제공하는 특정 서비스를 이용하기 위하여 회원이 선정하고 회사가 승인하는 문자, 특수문자, 숫자 등을 말합니다.
5. PASSWORD(이하 "비밀번호"라고 함): 회원이 자신의 ID 또는 체험 ID와 일치하는 이용 고객임을 확인하기 위해 선정한 문자, 특수문자, 숫자 등의 조합을 말합니다.
6. 회원 탈퇴: 회원이 이용 계약을 해지함을 의미합니다.
7. 계정 : ID에 수반하여 게임 이용을 위해 회원이 별도로 생성하는 캐릭터, 게임 ID 등을 의미합니다.
② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계 법령 및 각 서비스 별 안내에서 정하는 바에 의합니다. 관계 법령과 각 서비스 별 안내에서 정하지 않는 것은 일반적인 상관례에 의합니다.
제3조(약관의 효력 및 적용과 변경)
① 회사는 이 약관의 내용을 회원이 알 수 있도록 회사에서 운영하는 홈페이지(coconuBank.co.kr 이하 "홈페이지"라 함)에 게시하거나 연결화면을 제공하는 방법으로 회원에게 공지합니다.
② 이 약관에 동의하고 회원 가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받고 약관의 변경이 있을 경우에는 변경의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다. 이 약관에 동의하는 것은 정기적으로 홈페이지를 방문하여 약관의 변경 사항을 확인하는 것에 동의하는 것을 의미합니다.
③ 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있습니다. 회사는 약관이 변경되는 경우에 변경된 약관의 내용과 시행일을 정하여, 그 시행일로부터 7일전 홈페이지에 온라인으로 공시합니다. 다만, 이용자에게 불리하게 약관 내용을 변경하는 경우에는 시행일로부터 30일전 홈페이지에 온라인으로 공시하거나 회원이 회원 가입 시 등록한 e-mail로 전송하는 방법으로 회원에게 고지합니다. 변경된 약관은 공시하거나 고지한 시행일로부터 효력이 발생합니다.
④ 회원은 변경된 약관에 대해 거부할 권리가 있습니다. 본 약관의 변경에 대해 이의가 있는 회원은 서비스 이용을 중단하고 회원 탈퇴를 할 수 있습니다. 회원이 변경된 이용약관의 시행일 이후에도 서비스를 계속 이용하는 경우에는 변경된 약관에 동의한 것으로 봅니다.
 </textarea></p>
			<p><p> <font size="2" color="red">(당사의 개인정보수집에 대해 부당하다고 판단하시면 회원가입을
					유보하실 수 있습니다. 단, 해당 사이트의 서비스 이용이 제한될 수도 있습니다)</font></p>			
			<p><!-- 체크박스1 -->
			<input type="checkbox" name="check"  value="c1">
			<label>coconutBank 이용약관에 동의합니다.</label></input>
			</p>
			<hr width="100%">
			
			
			<p>
				<label for="memo"><font size="4" color="navy"">개인정보 수집 및 이용동의
						</font><font color="red">(필수)</font></label>
			</p>
			<p>
				<textarea id="memo2" name="bank2" cols="120" rows="10" width="400"
					style="resize: none;" readOnly>
개인정보 수집 및 이용
1. 개인정보의 수집
코코넛뱅크(이하 '회사')는 금융 서비스 운영을 위해 아래와 같이 이용자의 개인정보를 수집하고 있습니다.

1) 온라인 서비스
① 이용자 식별, 회원서비스 제공
- (필수)ID, 닉네임, 비밀번호
② 공지사항 전달
- (필수)이메일주소
- (선택)휴대폰번호
③ 본인인증
- (필수)이름, 생년월일, 성별, 내외국인정보, 이동통신사정보, 휴대폰번호, 연계정보(CI), 중복가입정보(DI)
④ 법정대리인 본인 인증
- (필수)법정대리인정보(이름, 생년월일, 성별, 내외국인정보, 이동통신사정보, 휴대폰번호, 연계정보(CI), 중복가입정보(DI))
⑤ 게임서비스 제공
- (선택)ID, 생년월일, 성별, 지역, 직장, 직업, 성격, 키, 학력사항, 출신학교, 경력사항, 자기소개, 연애상태, 소속(부대), 프로필 사진, 이메일주소, 휴대폰번호
⑥ 결제 서비스
- (필수)휴대폰번호, 컬쳐랜드/해피머니/북앤라이프 회원ID, 오픈마켓ID, 오픈마켓 닉네임
    </textarea>
			</p>
			<p>
				<font size="2" color="red">(당사의 개인정보수집에 대해 부당하다고 판단하시면 회원가입을
					유보하실 수 있습니다. 단, 해당 사이트의 서비스 이용이 제한될 수도 있습니다)</font>
			</p>

			<p><!-- 체크박스2-->
				<input type="checkbox" name="check" value="c2">
				<label>개인정보 수집에 동의합니다.</label> <br>
				<br>
			</p>
			
			
		
<p><label for="memo"><font size="4" color="navy">
	coconut Bank  금융상품 안내 관련 개인정보 위탁제공 및 활용 동의</font><font color="red">(선택)</font></label></p>
<p>	<textarea id="memo3" name="bank3" cols="120" rows="10" width="400" style="resize: none;" readOnly>
① 당행은 고객의 동의를 받아 다음 각 호와 같이 개인정보의 처리를 위탁하고 있습니다.
1. 수탁업체 : 제휴업체 및 수탁업체 명단 참조
금융거래를 위한 업무 위탁 현황
2. 수탁의 목적
(금융)거래의 설정 · 유지 · 이행 · 관리 등에 필요한 경우로서 위탁받은 업무의 수행
상품 및 서비스 홍보 및 판매 권유, 사은행사, 고객 만족도 조사 등에 필요한 경우로서 위탁받은 업무의 수행
3. 개인정보 제공항목
개인식별정보 : 성명, 주민등록번호 등 고유식별정보, 국적, 직업, 주소 · 전자우편 주소 · 전화번호 등 연락처
(금융)거래정보 : 상품종류, 거래조건(이자율, 만기, 담보 등), 거래일시, 금액 등 거래 설정 및 내역 정보
개인식별정보 외에 거래신청서에 기재된 정보 또는 고객이 제공한 정보 
주거 및 가족사항, 거주기간, 세대구성, 결혼여부 등
※ 본 동의 이전에 수집된 개인(신용)정보도 포함됩니다.
② 위탁계약 시 개인정보보호 관련 법규의 준수, 개인정보에 관한 제3자 제공 금지 및 책임부담 등을 명확히 규정하고, 당해 계약내용을 서면 및 전자 보관하고 있습니다. 업체 변경시 공지사항 및 개인정보처리방침을 통해 고지하겠습니다.
    </textarea></p>
<p>	<font size="2" color="red">(당사의 개인정보수집에 대해 부당하다고 
판단하시면 회원가입을	유보하실 수 있습니다. 단, 해당 사이트의 서비스 이용이 제한될 수도 있습니다)</font></p>

			<p><!-- 체크박스3-->
				<input type="checkbox" name="check" value="c3">
				<label>개인정보 제공 및 활용 동의</label> <br>
				<br> </p>
			<hr width="100%">
			</hr>
			<table>
				<tr>
					<td colspan="2" align="center"><input type="button" value="다음단계로" onclick="checking();" class="w3-button w3-2017-navy-peony w3-round-xxlarge"> 
					<input type="button" onClick="window.location='index.jsp'" value="메인으로" class="w3-button w3-2017-navy-peony w3-round-xxlarge"><br>
					<br>
					<br></td>
				</tr>
			</table>
		</div>
	
	</form>
</body>

	<%@ include file="/bottom.jsp"%>

