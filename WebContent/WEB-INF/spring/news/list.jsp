<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/top.jsp" %>
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
			<tr><td align ="left" colspan = "5"><font size = "6">새 소식</font></td></tr>
			<!--allList 시작  -->
			<%
				if (request.getAttribute("mode").equals("allList")) {
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
			<c:if test="${empty newsList}">
				<tr height = "30">
					<td colspan="5">등록된 새 소식이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${newsList}">
				<tr height = "30">
					<td align="center"><%=number--%></td>
					<td><a href="news_content.do?news_no=${dto.news_no}">&nbsp;${dto.news_title}</a>
					</td>
					<td align="center">${dto.news_regdate}</td>
					<td align="center"><c:choose>
							<c:when test="${dto.news_filesize > 0}">
								<!-- 파일이 있으면 -->
								<img src="<%=request.getContextPath()%>/images/folder.gif">
							</c:when>
							<c:otherwise>
								<!-- 파일이 없으면 -->
								<img src="<%=request.getContextPath()%>/images/level.gif">
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">${dto.news_readcount}</td>
				</tr>
			</c:forEach>
				<tr  bgcolor=#cccbcf>
				<td colspan="5"></td>
			</tr>
			<tr>
			<td align="center" colspan="5">
			<%
			
			int count = (int)request.getAttribute("count");
			int pageSize = (int)request.getAttribute("pageSize");
			int currentPage = (int)request.getAttribute("currentPage");
		if (count>0){
			int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);//ex 30/5 => 6 31/5 => 7 
			int pageBlock = 3;//보여지는 페이징 갯수
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;// 1, 4. . . 
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			if (startPage != 1){//1페이지 아니면 이전 보여주기%>
				[<a href="news_list.do?pageNum=<%=startPage-pageBlock%>">이전</a>]
<%		}				
			for(int i=startPage; i<=endPage; ++i){%>
				[<a href="news_list.do?pageNum=<%=i%>"><%=i%></a>]
<%		}
			if (endPage<pageCount){%>
				[<a href="news_list.do?pageNum=<%=startPage+pageBlock%>">다음</a>]
<%		}
		}	
%>	
			</td>
			</tr>
		</table>
		<br>

		<table border="0" width="800">
			<tr>
				<td align="center">
					<form name="f" action="news_find.do" method="post">
						<select name="searchMode">
							<option value="news_title">제목</option>
							<option value="news_content">내용</option>
						</select>&nbsp; <input type="text" size="50" name="word"> <input
							type="submit" value="검색">
					</form>
				</td>
				<td align="right">
				<c:if test='${(loginId eq "admin") }'>
				<a href="news_insert.do"><input
						type="button" value="글 쓰기"></a>
				</c:if>
				</td>
			</tr>
			
		</table>
		<!-- allList 끝 -->
		<%
			} else {
		%>
		<!-- 검색 결과 시작-->
		<tr height = "30"></tr>
		<tr bgcolor =#223A5E  height = "30" align = "center">
				<td width="60%"><font color = "white">제목</font></td>
				<td width="20%"><font color = "white">작성일</font></td>
				<td width="10%"><font color = "white">파일</font></td>
				<td width="10%"><font color = "white">조회 수</font></td>
			</tr>
		<c:if test="${empty findList}">
			<tr height = "30">
				<td colspan="4">검색된 글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${findList}">
			<tr height = "30">
				<td><a href="news_content.do?news_no=${dto.news_no}">&nbsp;${dto.news_title}</a>
				</td>
				<td align="center">${dto.news_regdate}</td>
				<td align="center"><c:choose>
						<c:when test="${dto.news_filesize > 0}">
							<!-- 파일이 있으면 -->
							<img src="<%=request.getContextPath()%>/images/folder.gif">
						</c:when>
						<c:otherwise>
							<!-- 파일이 없으면 -->
							<img src="<%=request.getContextPath()%>/images/level.gif">
						</c:otherwise>
					</c:choose></td>
				<td align="center">${dto.news_readcount}</td>
			</tr>
		</c:forEach>
		<tr bgcolor=#cccbcf>
				<td colspan="4"></td>
		</tr>
		<tr height = "30"></tr>
		<tr>
			<td align="center" colspan = "5">
				<%
					String searchMode = request.getParameter("searchMode");
					String word = request.getParameter("word");

						if (searchMode.equals("news_title")) {

							searchMode = "제목";
						} else if (searchMode.equals("news_content")) {
							searchMode = "내용";
						} 
				%> 검색 조건 '<%=searchMode%>'으로 '<%=word%>'이 포함된 검색 결과입니다.
			</td>
		</tr>

		<tr align = "right">
		<td colspan = "5"><a href = "news_list.do"><input type = "button" value = "전체 목록으로 돌아가기"></a></td>
		</tr>
		</table>
		<%
			}
		%>
		
	</div>

</body>
</html>
<%@ include file="/bottom.jsp" %>