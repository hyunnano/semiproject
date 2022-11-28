<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team_board.Team_BoardDAO"%>
<%@ page import = "team_board.Team_BoardDTO"%>

<%
//폼값 받기
String tb_title = request.getParameter("tb_title"); 
String tb_content = request.getParameter("tb_content");
// 폼값을 DTO 객체에 저장
Team_BoardDTO dto = new Team_BoardDTO();
dto.setTb_title(tb_title);
dto.setTb_content(tb_content); 
//dto.setId("scott");//제거
//dto.setName("scott계정");//제거
dto.setId(session.getAttribute("Id").toString());
dto.setName(session.getAttribute("Name").toString());
dto.setGrade(session.getAttribute("grade").toString());
dto.setT_num(session.getAttribute("t_num").toString());
// DAO 객체를 통해 DB에 DTO 저장
Team_BoardDAO dao = new Team_BoardDAO(); 
int iResult = dao.insertWrite(dto); 
dao.close();
// 성공 or 실패?
if (iResult == 1) { 
    response.sendRedirect("team_BoardList.jsp");
    //로그인했는지 체크해줘야함
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>