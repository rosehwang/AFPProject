<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>

<c:if test="${empty loginId}">
			<script>
		alert("로그인 후 이용이 가능합니다.")
		window.location = "index.jsp"
			</script>
</c:if>

 <script>
	function logout() {
		if (confirm("로그아웃 하시겠습니까?") == true) {
			window.location = "logout.do"
			self.close()
		} else {

			return;
		}
	}
</script>

<div align="center">
	<table width="800">
	<tr height = "30"></tr>
			<tr><td align ="left" colspan = "5"><font size = "6">공지사항</font></td></tr>
<%
   
	int number = (int)request.getAttribute("number");
%>		
	<tr height = "30"></tr>
		<tr bgcolor =#223A5E align ="center" height = "30">
				<td width ="10%"><font color = "white">번호</font></td>
				<td width="60%"><font color = "white">제목</font></td>
				<td width ="10%"><font color = "white">작성일</font></td>
				<td width ="10%"><font color = "white">파일</font></td>
				<td width ="10%"><font color = "white">조회수</font></td>
		</tr>

		<c:if test = "${empty noticeList}">
		   <tr height = "30">
		      <td colspan ="5">등록된 공지사항이 없습니다. </td>
		   </tr>
		</c:if>
		<c:forEach var ="dto" items = "${noticeList}">
			<tr height = "30">
				<td align="center"><%=number--%></td>
				<td>
					<a href = "notice_content.do?notice_no=${dto.notice_no}">&nbsp;${dto.notice_title}</a>
           		</td>	
				<td align = "center">${dto.notice_regdate}</td>
				<td align = "center">
			<c:choose>
				<c:when test="${dto.notice_filesize > 0}"><!-- 파일이 있으면 -->
					<img src="<%=request.getContextPath()%>/images/folder.gif">
				</c:when>
				<c:otherwise><!-- 파일이 없으면 -->
					<img src="<%=request.getContextPath()%>/images/level.gif">
				</c:otherwise>
			</c:choose>	
			</td>
			<td align = "center">${dto.notice_readcount}</td>
		</tr>							
	</c:forEach>
	<tr bgcolor=#cccbcf>
				<td colspan="5"></td>
	</tr>	
	<tr>
	<td align="center" colspan="5">
	

<%
       int pageSize = (int)request.getAttribute("pageSize");
       int count =(int)request.getAttribute("count");      
       int currentPage = (int)request.getAttribute("currentPage");
       
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			if (startPage != 1){%>
				[<a href="notice_list.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="notice_list.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="notice_list.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	
			</td>
			</tr>
		</table>
		<br>
		
        <table border="0" width="800">
		<tr>
		  <form name ="find" action = "notice_find.do" method = "post">
		    <td align="center">
			    <select name ="type"> <!-- 제목 ,내용 -->
			      <option value = "notice_title">제목</option>
			      <option value = "notice_content">내용</option>
			    </select>&nbsp; <input type="text" size="50" name="word"> <input
							type="submit" value="검색">
		   	</td>
		   <td align="right">
			<%	if(session.getAttribute("loginId").equals("admin")){%>
				<a href="notice_insert.do"><input
						type="button" value="글 쓰기"></a>
			<%} %>
			</td>
         </form>  		
		</tr>
	</table>
</div>
<%@ include file="/bottom.jsp" %>
</body>
</html>