<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<!-- /css -->
<link href="css/main/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/main/aos.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/main/jQuery.lightninBox.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/pogo-slider.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- /css -->
<title>아이디 찾기</title>
</head>
<body class="w3-light-grey">
<table width="100%">
		<tr>
			<td class="w3-light-grey">
				<a href="index.jsp"><img src="images/logoBlack.png" width="150" height="40" border="0">
				</a>
			</td>
			</tr>
			</table>
	
   <div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <form name = "f" action="find_id.do" method="post">
            <div class="w3-center w3-large w3-margin-top">
               <h3>아이디 찾기</h3><br>
            </div>
            <div>
               <p>
                  <label>이름</label>　
                  <input type="text" name="name" maxlength="10">　　
                  <label>생년월일</label>　
                  <input type="text" name="ssn" maxlength="10">　　
                  <label>Email</label>　
                  <input type="text" name="email" maxlength="30">　
                  
               </p>
               <p class="w3-center w3-light-grey">
   <button type="submit" id=findIdBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">아이디 찾기</button>
   <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
   <br><br>
               </p>
            </div>
         </form>
      </div>
   </div>
   
   <hr width="100%">
   
      <div class="w3-content w3-container w3-light-grey w3-margin-top">
      <div class="w3-container w3-light-grey w3-card-4">
         <form name = "f" action="find_passwd.do" method="post">
            <div class="w3-center w3-large w3-margin-top">
               <h3>비밀번호 찾기</h3><br>
            </div>
            <div>
               <p>
                  <label>EMAIL</label>
                  <input type="text" name="email" maxlength="30">&nbsp;&nbsp;
                  <label>ID</label>
                  <input type="text" name="id" maxlength="10">&nbsp;&nbsp;
                  <label>이름</label>
                  <input type="text" name="name" maxlength="10">&nbsp;&nbsp; 
               </p>
               <p class="w3-center">
                  <button type="submit" id=findPasswdBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 찾기</button>
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
                     <br><br>
               </p>
            </div>
         </form>
      </div>
   </div>
   <br><br><br>
    <hr width="100%">
     <hr width="100%">
  
</body>
</html>

<%@ include file="/bottom.jsp" %>
