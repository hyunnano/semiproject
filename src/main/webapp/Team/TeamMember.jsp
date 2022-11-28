<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "team.TeamDAO" %>
<%@ page import = "team.TeamDTO" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import="java.util.List"%>
<%@ page import ="java.util.Map" %>
<%@ page import ="java.util.HashMap" %>

<%

TeamDAO dao = new TeamDAO();	//서버연결

String t_name = request.getParameter("t_name");

Map<String, Object> param = new HashMap<String, Object>();
MemberDTO dto = dao.teamMemberList(t_name);
List<TeamDTO> tdto = dao.selectTeamList(param);


dao.close();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 명단</title>
<link rel="stylesheet" href="TeamMember.css">

<script>

function del(){
  var is = confirm("강퇴하시겠습니까?");  
  if(is){   
    var form = document.tmemform;
	form.method = "post" 
	form.action = "DeleteMember.jsp"
	form.submit();   
 }
 
</script>
</head>
<body>
<div> 
<form name="tmemform">
	<input type="hidden" name="t_name" value="<%=t_name %>"/>
	<h1>회원 명단</h1>
	<!-- 회원명단 검색기능 -->
	<form method="get">
	<select name="searchField"> 
    	<option value="t_name">이름</option>
    	<option value="t_local">지역</option>    	
	</select>
		<input type="text" name="searchWord" />
    	<input type="submit" value="검색하기" />
	 </form> 
 	 <table >
 		 <tr>
  			<td>No.</td>
  			<td>이름</td>
		    <td>지역</td>
		    <td>연락처</td>
		    <td>성별</td>
		 </tr>
<% 
	if(t_name == null){
%>

        <tr>
            <td colspan="5" align="center">
                회원이 없습니다!
            </td>
        </tr>
<%
	}else{
		//게시물이 있을때
		int resultNum = 1 ; //화면상의 게시물 번호
		for (int i=0 ; i<dto.getT_name().length();i++) { 
			int virtualNum = 0;
		
			resultNum = virtualNum+i;
		
		%>
        <tr>
        	<td><%= resultNum %>
        	<%} %>
            <td><a onclick="del()" style="cursor: pointer;" ><%= dto.getName() %></a></td>
            <td><%= dto.getM_loc() %></td>
            <td><%= dto.getPhone() %></td>
            <td><%= dto.getGender() %></td>
        </tr>
    
	<% }		
%>  
  
</table>
</form>
</div>
</body>
</html>