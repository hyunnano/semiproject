<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "team_board.Team_BoardDAO"%>
<%@ page import = "team_board.Team_BoardDTO"%>
<%@ page import = "utils.JSFunction"%>
<%
// 수정 내용 얻기
String tb_num = request.getParameter("tb_num");
String tb_title = request.getParameter("tb_title");
String tb_content = request.getParameter("tb_content");
// DTO에 저장
Team_BoardDTO dto = new Team_BoardDTO();
dto.setTb_num(tb_num);
dto.setTb_title(tb_title);
dto.setTb_content(tb_content);
// DB에 반영
Team_BoardDAO dao = new Team_BoardDAO(); 
int affected = dao.updateEdit(dto);
dao.close();
// 성공/실패 처리
if (affected == 1) {
    // 성공 시 상세 보기 페이지로 이동
    response.sendRedirect("team_BoardView.jsp?tb_num=" + dto.getTb_num());
}
else {
    // 실패 시 이전 페이지로 이동
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
    
    
}
%>