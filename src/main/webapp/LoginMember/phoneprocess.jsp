<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="mypage.MypageDAO"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="utils.JSFunction"%>

<%
String id = request.getParameter("id");
String phone = request.getParameter("phone");
%>

<%
MemberDTO dto = new MemberDTO();
dto.setPass(id);
dto.setPhone(phone);
%>

<%
MypageDAO dao = new MypageDAO();
int result = dao.updatePhoneEdit(dto);
%>

<%
if (result == 1) {
	response.sendRedirect("mypage.jsp?id=" + dto.getId());
} else {
	JSFunction.alertBack("다시 확인해주세요", out);
}
%>