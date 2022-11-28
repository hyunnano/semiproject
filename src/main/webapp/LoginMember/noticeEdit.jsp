<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.NoticeDAO"%>
<%@ page import = "notice.NoticeDTO"%>
<%@ page import = "utils.JSFunction" %>
<%
String n_num = request.getParameter("n_num"); // 일련번호 받기
NoticeDAO dao = new NoticeDAO(); // DAO 생성
NoticeDTO dto = dao.selectView(n_num); // 게시물 가져오기
//아이디 체크부분
String sessionId = session.getAttribute("Id").toString(); // 로그인 ID 얻기 
if (!sessionId.equals(dto.getId())) { // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}

dao.close(); // DB 연결 해제
%>



<script type="text/javascript">
function validateForm(form) { // 폼 내용 검증
if (form.n_title.value == "") { alert("제목을 입력하세요."); form.n_title.focus();
return false;
    }
    if (form.n_content.value == "") {
alert("내용을 입력하세요."); form.n_content.focus(); return false;
} }
</script>

<html>
<meta charset="UTF-8">
<title>공지사항 게시판</title>

<!-- include -->
<jsp:include page="header_NoMenu.jsp"></jsp:include>


<h2>공지글 수정</h2>
<form name="writeForm" method="post" action="noticeEditProcess.jsp" onsubmit="return validateForm(this);">
    <input type="hidden" name="n_num" value="<%= dto.getN_num() %>">
    <table border="1" width="90%">
        <tbody><tr> 
            <td>제목</td>
            <td>
                <input type="text" name="n_title" style="width: 90%;" value="<%= dto.getN_title() %>">
            </td> 
        </tr>
        <tr> 
            <td>내용</td>
            <td>
                <textarea name="n_content" style="width: 90%; height: 100px;">  <%= dto.getN_content() %></textarea>
            </td> 
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
               <!-- <button type="button" onclick="location.href='List.jsp';">
                    목록 보기</button> -->
                    <button type="button" onclick="location.href='noticeList.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </tbody></table>
 </form>
 
 
  <jsp:include page="footer.jsp"></jsp:include>
   
 </html>
  