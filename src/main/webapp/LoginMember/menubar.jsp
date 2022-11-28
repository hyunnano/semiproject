<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team.TeamDAO" %>
<%@ page import = "team.TeamDTO" %>
<%@ page import="java.util.List"%>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>
 <%


TeamDAO dao = new TeamDAO();

String t_name = request.getParameter("t_name");

Map<String, Object> param = new HashMap<String, Object>();
List<TeamDTO> teamLists = dao.selectTeamList(param); 
dao.close();
%>

<div id="maingrid"><!--/*메인친구*/-->
<div id ="menu"><!--메뉴친구-->
   <ul>
    <li><a href="TeamMember.jsp?t_name=<%= t_name%>"> 팀원명단 </a></li>
    <li><a href="Schedule.jsp?t_name=<%= t_name%>"> 경기일정 </a></li>
    <li><a href="team_BoardList.jsp?t_name=<%= t_name%>"> 팀게시판 </a></li>
   </ul>
</div>

    <div><!--영상 or 개인파트-->