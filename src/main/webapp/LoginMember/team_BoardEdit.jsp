<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team_board.Team_BoardDAO"%>
<%@ page import = "team_board.Team_BoardDTO"%>
<%@ page import = "utils.JSFunction"%>
<%
String tb_num = request.getParameter("tb_num"); // 일련번호 받기
Team_BoardDAO dao = new Team_BoardDAO(); // DAO 생성
Team_BoardDTO dto = dao.selectView(tb_num); // 게시물 가져오기
//아이디 체크부분
String sessionId = session.getAttribute("Id").toString(); // 로그인 ID 얻기 
if (!sessionId.equals(dto.getId())) { // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}

dao.close(); // DB 연결 해제
%>
<meta charset="UTF-8">
<title>팀전용게시글 수정하기</title>
<script type="text/javascript">
function validateForm(form) { // 폼 내용 검증
if (form.tb_title.value == "") { alert("제목을 입력하세요."); form.tb_title.focus();
return false;
    }
    if (form.tb_content.value == "") {
alert("내용을 입력하세요."); form.tb_content.focus(); return false;
} }
</script>

<!-- include -->
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menubar.jsp"></jsp:include>
<h2>팀게시글 수정</h2>
<form name="writeForm" method="post" action="team_BoardEditProcess.jsp" onsubmit="return validateForm(this);">
    <input type="hidden" name="tb_num" value="<%= dto.getTb_num() %>">
    <table border="1" width="90%">
        <tbody><tr> 
            <td>제목</td>
            <td>
                <input type="text" name="tb_title" style="width: 90%;" value="<%= dto.getTb_title() %>">
            </td> 
        </tr>
        <tr> 
            <td>내용</td>
            <td>
                <textarea name="tb_content" style="width: 90%; height: 100px;">  <%= dto.getTb_content() %></textarea>
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
              
                    <button type="button" onclick="location.href='team_BoardList.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </tbody></table>
 </form>
 <jsp:include page="footer.jsp"></jsp:include>