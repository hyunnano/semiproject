<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "join.JoinDAO"%>
<%@ page import = "join.JoinDTO"%>
<%@ page import = "utils.JSFunction"%>
<%
// 수정 내용 얻기
String j_num = request.getParameter("j_num");
String j_title = request.getParameter("j_title");
String j_content = request.getParameter("j_content");
// DTO에 저장 ❷
JoinDTO dto = new JoinDTO();
dto.setJ_num(j_num);
dto.setJ_title(j_title);
dto.setJ_content(j_content);
// DB에 반영
JoinDAO dao = new JoinDAO(); 
int affected = dao.updateEdit(dto);
dao.close();
// 성공/실패 처리
if (affected == 1) {
    // 성공 시 상세 보기 페이지로 이동
    response.sendRedirect("joinView.jsp?j_num=" + dto.getJ_num());
}
else {
    // 실패 시 이전 페이지로 이동
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
    
    
}
%>