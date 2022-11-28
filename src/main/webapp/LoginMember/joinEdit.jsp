<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "join.JoinDAO"%>
<%@ page import = "join.JoinDTO"%>
<%@ page import = "utils.JSFunction"%>

<%
String j_num = request.getParameter("j_num"); // 일련번호 받기
JoinDAO dao = new JoinDAO(); // DAO 생성
JoinDTO dto = dao.selectView(j_num); // 게시물 가져오기
//아이디 체크부분
String sessionId = session.getAttribute("Id").toString(); // 로그인 ID 얻기 
if (!sessionId.equals(dto.getId())) { // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}

dao.close(); // DB 연결 해제 %>

<script type="text/javascript">
function validateForm(form) { // 폼 내용 검증
if (form.j_title.value == "") { alert("제목을 입력하세요."); form.j_title.focus();
return false;
    }
    if (form.j_content.value == "") {
alert("내용을 입력하세요."); form.j_content.focus(); return false;
} }
</script>
<html>
<meta charset="UTF-8">
<title>모집게시글 수정하기</title>
<!-- include -->
<jsp:include page="header_NoMenu.jsp"></jsp:include>


<h2>모집게시글 수정</h2>
<form name="writeForm" method="post" action="joinEditProcess.jsp" onsubmit="return validateForm(this);">
    <input type="hidden" name="j_num" value="<%= dto.getJ_num() %>">
    <table border="1" width="90%">
        <tbody><tr> 
            <td>제목</td>
            <td>
                <input type="text" name="j_title" style="width: 90%;" value="<%= dto.getJ_title() %>">
            </td> 
        </tr>
        <tr> 
            <td>내용</td>
            <td>
                <textarea name="j_content" style="width: 90%; height: 100px;">  <%= dto.getJ_content() %></textarea>
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
               <!-- <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button> -->
                    <button type="button" onclick="location.href='joinList.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </tbody></table>
 </form>
 
 <jsp:include page="footer.jsp"></jsp:include>
 
 </html>