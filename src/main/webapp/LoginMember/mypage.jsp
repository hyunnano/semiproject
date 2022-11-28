<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="mypage.MypageDAO"%>
<%@ page import="member.MemberDTO"%>

<%
String id = session.getAttribute("Id").toString();
MypageDAO dao = new MypageDAO();
MemberDTO dto = dao.selectView(id);
dao.close();
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<title>마이 페이지 </title>
<link rel="stylesheet" href="css/style2.css">

<script>
	function deleteUser() {
		var confirmed = confirm("탈퇴하시겠습니까?");
		if (confirmed) {
			var form = document.i;
			form.method = "post";
			form.action = "delete.jsp";
			form.submit();
		}
	}
</script>

</head>

<body>

	<jsp:include page="header.jsp" />

	<div id="maingrid">
		<!--/*메인친구*/-->
		<div id="menu">
			<!--메뉴친구-->
			
		</div>

		<div>
        	<form name="i" id="mypage">
			<fieldset id="my">
				<legend id="h1">
					<h1>마이페이지</h1>
				</legend>

					
					아이디&nbsp;<%=dto.getId()%>
					<br><br>
					비밀번호&nbsp;<%=dto.getPass()%>
					<button onclick="window.open('pass.jsp', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=no');">수정</button>
					<br><br>
					이름&nbsp;<%=dto.getName()%>
					<br><br>
					이메일&nbsp;<%=dto.getMail()%>
					<br><br>
					전화번호&nbsp;<%=dto.getPhone()%>
					<button onclick="window.open('phone.jsp', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=no');">수정</button>
					<br><br>
					성별&nbsp;<%=dto.getGender()%>
					<br><br>
					멤버활동지역&nbsp;<%=dto.getM_loc()%>
					<br><br>
					등급(권한)&nbsp;<%=dto.getGrade()%>
					<br><br>
					팀이름&nbsp;<%=dto.getT_name()%>
					<button type="button" onclick="location='TeamList.jsp'">팀이동</button>
					<br><br><br>
					<div>
						<button type="button" id="msg" style="width: 50px; height: 30px;"
							onclick="window.open('msg.jsp', 'window_name', 'width=500, height=500, location=no, status=no, scrollbars=no');">
							<i class="bi bi-envelope-check-fill"></i>
						</button>
						<button type="button" id="delete"
							style="width: 50px; height: 30px;" onclick="deleteUser();">
							<i class="bi bi-person-x-fill"></i>
						</button>
					</div>
					
			</fieldset>
		</form>
		</div>

	</div>

	<jsp:include page="footer.jsp" />

</body>

</html>
