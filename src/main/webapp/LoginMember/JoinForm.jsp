<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8" />
    <title>회원가입</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="LogJoin.css" />
    
    
    <script type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('pass').value) {
            input.setCustomValidity('비밀번호가 다릅니다. 다시 입력해주세요.');
        } else {
            // input is valid — reset the error message
            input.setCustomValidity('');
        }
    }
</script>


<script type='text/javascript'>
function validate(from) {

	var id = document.getElementById("id");
	var pass = document.getElementById("pass");
	var name = document.getElementById("name");
	var mail = document.getElementById("mail");
	var phone = document.getElementById("phone");
	var gender = document.getElementById("gender");
	var m_loc = document.getElementById("m_loc");
	
	
	
	/* var empAll = /\s/g; */
	var uid = /^[a-zA-Z]([0-9|a-z|A-Z]){7,11}$/; 
	var upass = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{7,15}$/;
	var umail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var uphone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	var form = document.form;

	var id = form.id.value;
	var pass = form.pass.value;
	var mail = form.mail.value;  // 얘들을 제대로 지정안해줘서 안넘어갔었음

	
	
	if(!regUid.info(id)) {
		alert(" 아이디는 영문자,숫자 8~12글자로 입력가능합니다 ");
		form.id.select();
		form.id.focus();
		return;
	}
	
	
	if(!regUpass.info(pass)){
		alert("비밀번호는 영문자로 시작, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다.");
		form.pass.select();
		form.pass.focus();
		return;
	}
	
	if(!regUmail.info(mail)){
		alert("이메일을 확인하세요.");
		form.mail.select();
		form.mail.focus();
		return;
	}
	
	 document.form.submit()
}



</script>



</head>

<body>

 <%
    if (session.getAttribute("Id") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
  <script type="text/javascript">
  function idCheck() {		
		var name = document.getElementById("idInput");
		
			if (name.value.length>12){			      //글자수확인
				alert("아이디는 12자 내로 입력해주세요.");
				cleartext();			
			} 
			else if(!name.value){                     //  필수 입력하게 체크 
				alert("아이디를 확인해주세요.")
			} else{
				
				window.open("IdCheck.jsp?id="+name.value,"", 
				"width=400px height= 250px");     //중복확인창 작게 띄우기 
			}
			
				
		}
    
    </script> 
 
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("Name") %> 회원가입을 축하합니다.<br />
        <a href="First.jsp"></a>
    <%
    }
    %>







    <form class="form" action="JoinProcess.jsp" method="post" name="JoinForm" style="width: 1000px">
        <div class="column-wrapper">
            <div class="column">
                <div class="header">회원가입</div>
            </div>
        </div>
        <div class="column-wrapper">
            <div class="column">
                <div class="field-block">
                    <div class="label">아이디</div>
                    <div class="field"><input type="text" name="id" placeholder="영문자,숫자 8~12글자로 입력가능합니다" required id="idInput" />
                     <input type="button" value="중복확인" onclick="idCheck()"></div>
                </div>

                <div class="field-block">
                    <div class="label">이  름</div>
                    <div class="field"><input type="text" name="name" placeholder="한글입력만 가능합니다." required/></div>
                </div>

                <div class="field-block">
                    <div class="label">휴대폰 번호</div>
                    <div class="field"><input type="text" name="phone" placeholder="-를 제외하고 입력하십시오." required/></div>
                </div>
                <div class="yes"></div>
                <div class="field-block">
                    <div class="label">이메일 인증</div>
                    <div class="field"><input type="email" name="mail" placeholder="@이메일 형식으로 입력하십시오." required/>
                   </div>
               </div>

            </div>
            <div class="column">
                <div class="field-block">
                    <div class="label">비밀번호</div>
                    <div class="field"><input type="password" name="pass" id="pass" placeholder="영문자,숫자포함 8-15 글자." required/></div>
                    <div class="field"><input type="password" name ="passCh" required  oninput="check(this)" placeholder="비밀번호 확인" /></div>
                </div>
                <div class="field-block">
                    <div class="label">성별</div>
                    <div class="field">
                        <select name="gender">
                            <option value="남성">남성</option>
                            <option value="여성">여성</option>

                        </select>
                    </div>
                </div>

                <div class="field-block">
                    <div class="label">주 활동지역</div>
                    <div class="field">
                        <select name="m_loc">
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="인천">인천</option>
                            <option value="대구">대구</option>
                            <option value="부산">부산</option>
                            <option value="울산">울산</option>
                            <option value="제주도">제주도</option>

                        </select>
                    </div>
                </div>

            </div>
        </div>
        <div class="column-wrapper">
            <div class="column">
                <input class="button" type="submit" value="가입하기" />
                <input class="button" value="취소하기" onclick="location.href='First.jsp'" style="text-align : center;"/>
            </div>
        </div>
    </form>
</body>

</html>