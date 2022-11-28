<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "join.JoinDAO"%>
<%@ page import = "join.JoinDTO"%>

<%
//폼값 받기
String j_title = request.getParameter("j_title"); 
String j_content = request.getParameter("j_content");
// 폼값을 DTO 객체에 저장
JoinDTO dto = new JoinDTO();
dto.setJ_title(j_title);
dto.setJ_content(j_content); 
//dto.setId("scott");//제거
//dto.setName("scott계정");//제거
dto.setId(session.getAttribute("Id").toString());
dto.setName(session.getAttribute("Name").toString());
dto.setGrade(session.getAttribute("grade").toString());
// DAO 객체를 통해 DB에 DTO 저장
JoinDAO dao = new JoinDAO(); 
int iResult = dao.insertWrite(dto); 
dao.close();
// 성공 or 실패?
if (iResult == 1) { 
    response.sendRedirect("joinList.jsp");//로그인했는지 체크
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>