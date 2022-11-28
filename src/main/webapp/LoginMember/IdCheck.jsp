<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.MemberDAO" %>
    <%@ page import="member.MemberDTO" %>
<%
request.setCharacterEncoding("UTF-8");   
String id = request.getParameter("id");%>      <!-- input에 입력된 팀이름 받아오기 -->



<fieldset>    <!-- 중복체크 폼 -->
<form action="IdCheck.jsp" method= "post" name="ok">            
팀 이름 : <input type="text" name= "id" value="<%=id %>"/>
<script type="text/javascript">
function result(){

	opener.document.JoinForm.id.value= document.ok.id.value;    // 폼에 중복체크 완료된 이름을 입력 
	opener.document.JoinForm.id.readOnly= true;                     // 수정 불가 처리 (읽기 전용)
	
	window.close();
}

</script>
</form>
</fieldset>

<%
MemberDAO dao = new MemberDAO();

boolean result= dao.checkId(id);     // Check() 통해서 중복된 이름이 있는지 확인.
if(result!=true){
	out.println("사용 가능한 아이디입니다.");       // DB에 같은 이름이 없을때 
	%> <input type= "button" value= "아이디 사용하기" onclick= "result();">
	<%
}else {                   // DB에 같은 이름이 있을 때 
	out.print("이미 사용중인 아이디입니다.");
}
	
%>
