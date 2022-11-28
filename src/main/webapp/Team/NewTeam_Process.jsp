<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO" %>
<%@ page import= "team.TeamDAO" %>
<%
String t_name =request.getParameter("t_name");
String t_loc1 = request.getParameter("h_area1");
String t_loc2= request.getParameter("h_area2");
String t_loc= t_loc1+" "+ t_loc2;
String t_type = request.getParameter("t_type");
String t_level = request.getParameter("t_level");
String t_info = request.getParameter("t_info");
//String id = session.getAttribute("id").toString();
String id= "sojin";
String grade= "s";

TeamDTO dto = new TeamDTO();
dto.setId(id);
dto.setT_name(t_name);
dto.setT_local(t_loc);
dto.setT_type(t_type);
dto.setT_level(t_level);
dto.setT_info(t_info);

TeamDAO dao = new TeamDAO();
int result= dao.createTeam(dto);


if(result==1){         // insert 됐을때 ==> 팀 개인 페이지 생성되면서 열기, 회원 등급이 팀리더(tl)로 바뀌도록
	dao.directTeam(t_name);
}else{
	request.getRequestDispatcher("TeamList.jsp").forward(request, response);   // 팀게시판으로 이동 
}



%>