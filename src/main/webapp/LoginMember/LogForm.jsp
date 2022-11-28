<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="LogJoin.css"/>
</head>
<body>
<% //로그인 에러
if(request.getAttribute("LoginErrMsg")!=null){
	%> <script>alert("<%out.print(request.getAttribute("LoginErrMsg"));%>");</script> 
<% };%>
    <%
    if (session.getAttribute("Id") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
    <script>
    function validateForm(form) {
        if (!form.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
    }
    </script>
 
    <%
    } else { // 로그인된 상태
    %>
        <a href="First.jsp"></a>
    <%
    }
    %>

<form action="LoginProcess1.jsp" method="post" onsubmit="return validateForm(this);" name="LogForm"  class="form"  style="width: 500px">
    <div class="column-wrapper">
        <div class="column">
            <div class="header">로그인</div>
        </div>
    </div>
    <div class="column-wrapper">
        <div class="column">
            <div class="field-block">
                <div class="label">아 이 디 </div>
                <div class="field"><input type="text" name="id" /></div>
            </div>
            <div class="field-block">
                <div class="label">비밀번호</div>
                <div class="field"><input type="password" name="pass" /></div>
            </div>
        </div>
    </div>
    <div class="column-wrapper">
        <div class="column">
            <input class="button" type="submit" value="로그인"/>
            <input class="button" value="회원가입" onclick="location.href='agr.jsp'" style="text-align : center;">
            
            
            
            
          
            
            <div class ="btnSearch">
             <ul>
                <li><a href="#" title="id" onClick='window.open("findId.jsp", "", "width=400px height= 250px")'>아이디 찾기</a></li>
               
                <li><a href="#" title="pass" onClick='window.open("findPass.jsp", "", "width=400px height= 250px")'>비밀번호 찾기</a></li>
               
             </ul> 
        </div>
</div>
</div>
</form>
</body>
</html>
