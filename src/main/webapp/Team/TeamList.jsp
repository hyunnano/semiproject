<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="team.TeamDAO" %>
<%@ page import="team.TeamDTO" %>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>

<%
TeamDAO dao = new TeamDAO();


Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}
List<TeamDTO> teamLists = dao.selectTeamList(param); 
dao.close();
%>        
    
<!DOCTYPE html>
<html lang="ko">

<head>

<title>팀리스트 출력</title>
<link rel="stylesheet" href="css/TeamList.css">
</head>
<script type= "text/javascript">
function openTeam(){
    window.open("NewTeam_Form.jsp", "a", "width=1000, height=700, left=100, top=50");    
}
</script>
<body>

<jsp:include page ="header.jsp"/>


    <div id="maingrid"><!--/*메인친구*/-->
    
		<div id ="menu"><!--메뉴친구-->
		   <ul>
		    <li>   
			<a class="pwdLink" href="#" onClick="openTeam()">팀 등록하기</a>
		    </li>
		    
		   </ul>
</div>

    <div>
    
    	<h1>팀 목록</h1>
	<!-- 팀이름 검색기능 -->
	<form method="get">
	<select name="searchField"> 
    	<option value="t_name">팀이름</option>
    	<option value="t_local">지역</option>
    	<option value="t_age">연령대</option>
    	<option value="t_type">유형</option>
    	<option value="t_level">실력</option> 
	</select>
		<input type="text" name="searchWord" />
    	<input type="submit" value="검색하기" />
	 </form> 
 	 <table>
 		 <tr>
  			<td>No.</td>
  			<td>팀이름</td>
		    <td>활동지역</td>
		    <td>연령대</td>
		    <td>유형</td>
		    <td>실력</td>    
		 </tr>
<% 
	if(teamLists.isEmpty()){
%>

        <tr>
            <td colspan="6" align="center">
                등록된 팀이 없습니다^^*
            </td>
        </tr>
<%
	}else{
		//게시물이 있을때
		int virtualNum = 0 ; //화면상의 게시물 번호
		for (TeamDTO dto : teamLists) { 
		virtualNum++;
		%>
        <tr>
        	<td><%= virtualNum %>
            <td><a href="TeamInfo.jsp?t_name=<%= dto.getT_name()%>"><%= dto.getT_name() %></a></td>
            <td><%= dto.getT_local() %></td>
            <td><%= dto.getT_age() %></td>
            <td><%= dto.getT_type() %></td>
            <td><%= dto.getT_level() %></td>
        </tr>
    <% }
	}		
%>  
  
</table>
    </div>

</div>

<jsp:include page ="footer.jsp"/>




</body>

</html>
