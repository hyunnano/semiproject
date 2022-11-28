<%@ page import = "team.TeamDAO" %>
<%@ page import = "team.TeamDTO" %>
<%@ page import="java.util.List"%>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


TeamDAO dao = new TeamDAO();

String t_name = request.getParameter("t_name");

Map<String, Object> param = new HashMap<String, Object>();
List<TeamDTO> teamLists = dao.selectTeamList(param); 
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 소개 게시판</title>
</head>
<body>

<jsp:include page ="header.jsp"/>
<jsp:include page ="menubar.jsp"/>

 
<div id = "teamInfo">
	<h2>TEAM <%=t_name %></h2>	
	<h5>
	<img src="#">
<% for (TeamDTO f: teamLists){ %>
	활동지역 : <%= f.getT_local() %> |
	연령대 : <%= f.getT_age() %> |
	팀유형 : <%= f.getT_type() %> |
	실력 : <%= f.getT_level() %> 
	</h5>
	
	<h5>팀 소개 : <%= f.getT_info() %> </h5>
	<br>
	<H2>새로운 소식</H2>
	<ul>
	<li>
	<a href="#"></a>
	</li>
	</ul>
<%} %>
	
	
</div>
</div>
<jsp:include page ="footer.jsp"/>
</body>
</html>