<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.NoticeDAO"%>
<%@ page import = "notice.NoticeDTO"%>
<%@ page import = "utils.JSFunction"%>
<%
// 수정 내용 얻기
String n_num = request.getParameter("n_num");
String n_title = request.getParameter("n_title");
String n_content = request.getParameter("n_content");
// DTO에 저장 ❷
NoticeDTO dto = new NoticeDTO();
dto.setN_num(n_num);
dto.setN_title(n_title);
dto.setN_content(n_content);
// DB에 반영
NoticeDAO dao = new NoticeDAO(); 
int affected = dao.updateEdit(dto);
dao.close();
// 성공/실패 처리
if (affected == 1) {
    // 성공 시 상세 보기 페이지로 이동
    response.sendRedirect("noticeView.jsp?n_num=" + dto.getN_num());
}
else {
    // 실패 시 이전 페이지로 이동
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
    
    
}
%>