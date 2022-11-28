<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO" %>
<%@ page import= "team.TeamDAO" %>
<%@ page import= "member.MemberDTO" %>
<%
String t_name =request.getParameter("t_name");
String t_loc1 = request.getParameter("h_area1");
String t_loc2= request.getParameter("h_area2");
String t_loc= t_loc1+" "+ t_loc2;
String t_age= request.getParameter("t_age");
String t_type = request.getParameter("t_type");
String t_level = request.getParameter("t_level");
String t_info = request.getParameter("t_info");
String id = session.getAttribute("Id").toString();               //세션에서 아이디와 등급 가져오기 
String grade = session.getAttribute("grade").toString();
//String id= "sojin";
//String grade= "s";



TeamDTO dto = new TeamDTO();
dto.setId(id);
dto.setT_name(t_name);
dto.setT_local(t_loc);
dto.setT_type(t_type);
dto.setT_level(t_level);
dto.setT_info(t_info);
dto.setGrade(grade);
dto.setT_age(t_age);

MemberDTO mdto= new MemberDTO(); // 회원 등급 변경을 위해 회원 정보에 


TeamDAO dao = new TeamDAO();
int result= dao.createTeam(dto);   //createTeam 결과 가져오기

if(result==1){         // 새로운 팀 생성 됐을때   
	response.sendRedirect("TeamInfo.jsp?"+dto.getT_name());  //팀 개인 페이지 생성되면서 열기
	mdto.setGrade("tl");       //회원 등급이 팀리더(tl)로 바뀌도록

}else{
	request.getRequestDispatcher("TeamList.jsp").forward(request, response);   // 팀게시판으로 이동 
}



%>