<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.MemberDAO" %>
    <%@page import="member.MemberDTO" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 JSP</title>
</head>
<body>
<% //로그인 
String uid= request.getParameter("id");
String upass = request.getParameter("pass");
out.print("uid");
out.print("upass");

//회원테이르 DAO를 통해 회원정보 DTO회독

MemberDAO dao = new MemberDAO();
MemberDTO member = dao.getMemberDTO(uid,upass);
dao.close();

out.print(member.getId());
//로그인 성공여부에 따른 처리

if(member.getId()!= null){
	//로그인 성공
	session.setAttribute("Id", member.getId());
	session.setAttribute("Name", member.getName());
	session.setAttribute("t_name",member.getT_name());
	session.setAttribute("grade",member.getGrade());
	
	response.sendRedirect("First2.jsp");
	


}else{
	
	
	request.setAttribute("LoginErrMsg", "로그인 오류 아이디, 비번 확인");
	System.out.println("noMember");
	request.getRequestDispatcher("LogForm.jsp").forward(request,response);
	
}


%>


</body>
</html>