<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="team.TeamDAO" %>
    <%@ page import="team.TeamDTO" %>
<%
request.setCharacterEncoding("UTF-8");   
String name = request.getParameter("t_name");%>      <!-- input에 입력된 팀이름 받아오기 -->



<fieldset>    <!-- 중복체크 폼 -->
<form action="NameCheck.jsp" method= "post" name="ok">            
팀 이름 : <input type="text" name= "t_name" value="<%=name %>"/>
<script type="text/javascript">
function result(){

	opener.document.newTeam.t_name.value= document.ok.t_name.value;    // 폼에 중복체크 완료된 이름을 입력 
	opener.document.newTeam.t_name.readOnly= true;                     // 수정 불가 처리 (읽기 전용)
	opener.document.newTeam.idDuplication.value= "NameChecked";        // 히든 버튼을 중복체크 완료된 상태로 바꿔줌
	opener.document.newTeam.check.disabled="disabled";                 // 중복체크가 완료되면 중복확인 버튼 비활성화
	window.close();
}

</script>
</form>
</fieldset>

<%
TeamDAO dao = new TeamDAO();

int result= dao.Check(name);     // Check() 통해서 중복된 이름이 있는지 확인.
if(result==0){
	out.println("사용 가능한 이름입니다.");       // DB에 같은 이름이 없을때 
	%> <input type= "button" value= "이름 사용하기" onclick= "result();">
	<%
}else if(result==1){                   // DB에 같은 이름이 있을 때 
	out.print("이미 사용중인 이름입니다.");
}else{
	out.print("에러");
}
%>
