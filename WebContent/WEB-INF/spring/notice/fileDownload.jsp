<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLDecoder"%>
<c:if test="${empty loginId}">
			<script>
		alert("로그인 후 이용이 가능합니다.")
		window.location = "index.jsp"
			</script>
</c:if>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String fileName = URLDecoder.decode((String)request.getAttribute("notice_file"), "utf-8");
	System.out.println(fileName);
%>

<%
	/* 다운로드 : 파일 내용을 읽어서 클라이언트에게 내용만 전송, 
	     클라이언트 쪽에서 읽어들인 내용으로 새로운 파일 생성 */
	out.clear(); // 버퍼 비우기
	out = pageContext.pushBody(); // 버퍼 새로 생성
	String upPath = config.getServletContext().getRealPath("/files");  // 읽어올 파일 경로 지정
	String file = upPath + "/" + fileName; // 경로 내 파일 지정

	/* 웹브라우저는 contentType을 알 때, 브라우저에서 열고, 모를때 파일을 다운로드 한다.
	   때문에 응답시 contentType을 모르는 타입으로 지정해서 보낸다. */
	response.setContentType("text/unknown");

	// 생성될 파일이름 지정
	response.setHeader("content-disposition",
			"attachment;fileName=" + URLEncoder.encode(fileName, "utf-8") + ";");

	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

	byte[] buffer = new byte[1024]; // 1kb로 파일 읽기
	int length = 0; // 읽은 길이 확인위해
	while ((length = bis.read(buffer, 0, buffer.length)) != -1) { // 파일쓰기 
		/* bis를 읽는다. buffer에 0부터 buffer의 길이만큼, 
		   다 읽으면 while문 빠져나오게, read : 얼마나 읽었는지 알려준다. */
		bos.write(buffer, 0, length);
	}
	if (bis != null)
		bis.close();
	if (bos != null)
		bos.close();
%>

