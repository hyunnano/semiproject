<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO" %>
<%@ page import="team.TeamDAO" %>
<%@ page import="member.MemberDTO" %>    

<%
MemberDTO dto = new MemberDTO();
String name = request.getParameter("name");


TeamDAO dao = new TeamDAO();
int result = dao.deleteTeamMember(dto);

if(result==1){
	JSFunction.alertLocation("해당 회원이 강퇴되었습니다.", "TeamMember.jsp", out);
	
}
else{
	JSFunction.alertBack("강퇴가 실패하였습니다.", out);
}




%>