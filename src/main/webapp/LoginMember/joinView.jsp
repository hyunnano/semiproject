<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="join.JoinDAO"%>
<%@ page import="join.JoinDTO"%>
<%
String j_num = request.getParameter("j_num");

JoinDAO dao = new JoinDAO();
dao.updateVisitCount(j_num);
JoinDTO dto = dao.selectView(j_num);
dao.close();
%>



<!DOCTYPE html>
<html>
<meta charset="UTF-8"> <title>모집 게시판 글</title>

<!-- include -->
<jsp:include page="header_NoMenu.jsp"></jsp:include>



 <script>
function deletePost() {
	 var confirmed = confirm("정말로 삭제하겠습니까?"); 
	    if (confirmed) {
	        var form = document.writeForm;       // 이름(name)이 "writeForm"인 폼 선택
	        form.method = "post";               // 전송 방식 
	        form.action = "joinDeleteProcess.jsp";  // 전송 경로
	        form.submit();                      // 폼값 전송
	    }
}
</script>



<h2>모집게시글 보기</h2> 
<form name="writeForm">
    <input type="hidden" name="j_num" value="<%= j_num %>" /> 
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getJ_num() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getJ_date() %></td>
            <td>조회수</td>
            <td><%= dto.getJ_visitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getJ_title() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
            <%= dto.getJ_content() %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            <%
                if (session.getAttribute("Id") != null
                    && session.getAttribute("Id").toString().equals(dto.getId())) {
                %>
                <button type="button"
                    onclick="location.href='joinEdit.jsp?j_num=<%= dto.getJ_num() %>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button>
                <%
                   }
                %>
                <button type="button" onclick="location.href='joinList.jsp';"> 
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>

<jsp:include page="footer.jsp"></jsp:include>

</html>