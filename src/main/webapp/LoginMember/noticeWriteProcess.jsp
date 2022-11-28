<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.NoticeDAO"%>
<%@ page import = "notice.NoticeDTO"%>

<%

//폼값 받기
String n_title = request.getParameter("n_title"); 
String n_content = request.getParameter("n_content");
// 폼값을 DTO 객체에 저장
NoticeDTO dto = new NoticeDTO();
dto.setN_title(n_title);
dto.setN_content(n_content); 
//dto.setId("scott");//제거
//dto.setName("scott계정");//제거
dto.setId(session.getAttribute("Id").toString());
dto.setName(session.getAttribute("Name").toString());
dto.setGrade(session.getAttribute("grade").toString());
// DAO 객체를 통해 DB에 DTO 저장
NoticeDAO dao = new NoticeDAO(); 
int iResult = dao.insertWrite(dto); 
dao.close();
// 성공 or 실패?
if (iResult == 1) { 
    response.sendRedirect("noticeList.jsp");
    //로그인했는지 체크해줘야함
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>