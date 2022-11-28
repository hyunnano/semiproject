<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="member.MemberDAO" %>
    <%@ page import="member.MemberDTO" %>
<%
request.setCharacterEncoding("UTF-8");   
String id = request.getParameter("id"); 
String name = request.getParameter("name");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 찾기</title>

</head>
<body>
<% 
System.out.println(id);
System.out.println(name);
if(name!=null && id !=null){
	MemberDAO dao = new MemberDAO();
	MemberDTO result= dao.findPassById(id,name);
	if(result.getId()!=null){
       %>회원님의 비밀번호 : <%
       out.println(result.getPass()); 
       
	}else{
		out.println("회원을 찾을 수 없습니다.");
	}

}else{
	




%>
<form action="findPass.jsp" name="idfindscreen" method = "POST">
<div class = "search-title">
				<h3> 비밀번호 찾기</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>아이디</label>
				<input type="text" name="id" class = "btn-id" placeholder = "등록한 아이디">
			<br>
			</div>
			<div class = "find-name">
				<label>이름</label>
				<input type="text"  name="name" class = "btn-name" placeholder = "실명 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="submit" name="enter" value="찾기" >
		<input type="button" name="cancle" value="취소" onClick="window.close()">
 	</div>
 </form>
 <%}%>
</body>
</html>