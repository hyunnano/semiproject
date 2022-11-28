<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*" %>

    <!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8" />
    <title>회인가입처리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="LogJoin.css" />
</head>

<body>
   <% //로그인 
String uid= request.getParameter("id");
String upass = request.getParameter("pass");
String upassCh = request.getParameter("passCh");
String uname = request.getParameter("name");
String umail = request.getParameter("mail");
String uphone = request.getParameter("phone");
String ugender = request.getParameter("gender");
String um_loc = request.getParameter("m_loc");


MemberDAO dao = new MemberDAO();

if(dao.checkId(uid)){
	
	out.print("이 아이디는 사용할 수 없습니다.");
	
}else{
	
	
	MemberDTO dto = new MemberDTO();
	
	dto.setId(uid);
	dto.setPass(upass);
	dto.setName(uname);
	dto.setMail(umail);
	dto.setPhone(uphone);
	dto.setGender(ugender);
	dto.setM_loc(um_loc);
	
	
	int ok = dao.JoinMember(dto);
	
	
	
	if(ok>0){
		session.setAttribute("Id", dto.getId());
		session.setAttribute("Name", dto.getName());
		response.sendRedirect("First2.jsp");
	
		
	}
	
}
dao.close();
   %>
   
   
   
   
</body>

</html>