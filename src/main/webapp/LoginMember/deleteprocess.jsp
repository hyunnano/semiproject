<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="mypage.MypageDAO"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="utils.JSFunction"%>

<%
String id = request.getParameter("id");
%>

<%
MemberDTO dto = new MemberDTO();
MypageDAO dao = new MypageDAO();
dto = dao.selectView(id);
%>

<%
String sessionId = session.getAttribute("UserId").toString();
int result = 0;
%>

<%
if (sessionId.equals(dto.getId())) {
	dto.setId(id);
	result = dao.deleteUser(dto);
	dao.close();

	if (result == 1) {
		JSFunction.alertLocation("탈퇴 되었습니다", "First.html", out);
	}
}
%>