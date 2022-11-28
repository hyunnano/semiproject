<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>모집게시글 쓰기</title>
<!-- include -->
<jsp:include page="header_NoMenu.jsp"></jsp:include>


<script type="text/javascript">
function validateForm(form) { // 폼 내용 검증
    if (form.j_title.value == "") { 
        alert("제목을 입력해주세요."); 
        form.j_title.focus();
        return false;
    }
    if (form.j_content.value == "") {
        alert("내용을 입력해주세요."); 
        form.j_content.focus(); 
        return false;
    }
}
</script>
</head>

<%
Date now = new Date();
SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd");
%>

<h2>모집 글쓰기</h2>
<form name="join_WriteForm" method="post" action="joinWriteProcess.jsp"
	onsubmit="return validateForm(this);">
	<table border="1" width="90%">
		<tbody>
			<tr>
				<td>제목</td>
				<td><input type="text" name="j_title" placeholder="제목을 입력하세요."
					style="width: 95%;"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=session.getAttribute("Id") %></td>
			</tr>
			<tr>
			<td>작성날짜</td>
			<td><%= nowtime.format(now)%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="j_content" placeholder="내용을 입력하세요." 
				style="width: 95%; height: 500px; resize: none;"></textarea>
				<br>
					<button type="submit"> 글등록 </button>
					<button type="reset">다시쓰기</button>
						<button type="button" onclick="location.href='joinList.jsp';"
						style="float: right;">돌아가기</button></td>
			</tr>
		</tbody>
	</table>
</form>


<jsp:include page="footer.jsp"></jsp:include>

</html>