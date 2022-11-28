<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="team_board.Team_BoardDAO"%>
<%@ page import="team_board.Team_BoardDTO"%>
<%

String tb_num = request.getParameter("tb_num");

Team_BoardDAO dao = new Team_BoardDAO();
dao.updateVisitCount(tb_num);
Team_BoardDTO dto = dao.selectView(tb_num);
dao.close();
%>



<!DOCTYPE html>
<html>

<meta charset="UTF-8"> <title>공지사항 게시판 글</title> 


<!-- include -->
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>


<script>
function deletePost() {
	 var confirmed = confirm("정말로 삭제하겠습니까?"); 
	    if (confirmed) {
	        var form = document.writeForm;       // 이름(name)이 "writeForm"인 폼 선택
	        form.method = "post";               // 전송 방식 
	        form.action = "team_BoardDeleteProcess.jsp";  // 전송 경로
	        form.submit();                      // 폼값 전송
	    }
}
</script>
<title>팀전용게시글 보기</title>

<h2>팀게시글 보기</h2>
<form name="writeForm">
    <input type="hidden" name="tb_num" value="<%= tb_num %>" /> 
    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= dto.getTb_num() %></td>
            <td>작성자</td>
            <td><%= dto.getName() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getTb_date() %></td>
            <td>조회수</td>
            <td><%= dto.getTb_visitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTb_title() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
            <%= dto.getTb_content() %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            <%
                if (session.getAttribute("Id") != null
                    && session.getAttribute("Id").toString().equals(dto.getId())) {
                %>
                <button type="button"
                    onclick="location.href='team_BoardEdit.jsp?tb_num=<%= dto.getTb_num() %>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button>
                <%
                   }
                %>
                <button type="button" onclick="location.href='team_BoardList.jsp';"> 
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>

<jsp:include page="footer.jsp"></jsp:include>
</html>