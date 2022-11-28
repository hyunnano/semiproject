<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="member.MemberDAO" %>
    <%@ page import="member.MemberDTO" %>
<%
request.setCharacterEncoding("UTF-8");   
String name = request.getParameter("name"); 
String phone = request.getParameter("phone");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>아이디 찾기</title>

</head>
<body>
<% 
System.out.println(name);
System.out.println(phone);
if(name!=null && phone !=null){
	MemberDAO dao = new MemberDAO();
	MemberDTO result= dao.findIdByName(name,phone);
	if(result.getId()!=null){
       %>회원님의 아이디 : <%
       out.println(result.getId()); 
       
	}else{
		out.println("등록된 정보가 없습니다");
	}

}else{
	


%>
<form action="findId.jsp" name="idfindscreen" method = "POST">
<div class = "search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="name" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호</label>
				<input type="text" onKeyup = "addHypen(this);" name="phone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
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