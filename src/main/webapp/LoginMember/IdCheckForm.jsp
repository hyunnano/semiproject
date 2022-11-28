<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<style type="text/css">

#wrap{
width: 490px;
text-align: center;
margin:0 auto 0 auto;  
}

#chk{
text-aling :center;
}

#cancleBtn{
visibility: visible;
}
#useBtn{
visibility:hidden;
}

</style>

<script type="text/javascript">

var httpRequest = null;

//HttpRequest 객체생성
function getXMLHttpRequest(){
	var httpRequest = null;
	
	if(window.ActiveXObject){
		try {
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) { httpRequest = null;}
				
			}
		}
	else if(window.XMLHttpRequest){
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest;
	
	
	
	
	}
	
	// 회원가입 창의 아이디 값 가져오기
	function pValue(){
		document.getElementById("uid").value = opener.document.userInfo.id.value;
	}
	//아이디 중복체크
function idCheck(){
		var id = document.getElementById("uid").value;
		if(!id){
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		else if(id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")
		alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
		return false;
		
	}
	else
    }

	var param ="id="+id
	httpRequest = getXMLHttpRequest();
	httpRequest.onreadystatechange = callback;
	httpRequest.open("POST", "MemberIdCheckAction.do", ture);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	httpRequest.send(param);
	
	
}


}

function callback(){
	if(httpRequest.readyState == 4){
		//결과값을 가져온다
		var resultText = httpRequest.reponseText;
		if(resultText == 0){
			alert("사용할 수 없는 아이디입니다.");
			document.getElementById("cancleBtn").style.visibility='visible';
			document.getElementById("useBtn").style.visibility='hidden';
			document.getElementById("msg").innerHTML = "";
		}
		else if(resultText == 1){
			document.getElementById("useBtn").style.visibility='hidden';
			document.getElementById("cancleBtn").style.visibility='visible';
			document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
		}
	}
}

//사용하기 클릭시 부모창으로 값 전달
function sendCheckValue(){
	//중복체크 결과인 idCheck 값 전달
	opener.document.userInfo.idDuplication.value ="idCheck";
	//회원가입 화면의 Id입력값에 값 전달
	opener.document.userInfo.id.value = document.getElementById("uid").value;
	
	if(opener !=null){
		opener.chkForm = null;
		self.close();
	}
}



</script>

</head>

<body onload="pValue()">
<div id="wrap">
<br>
<b><font size="4" color="gray">아이디 중복확인</font></b>
<hr size="1" whith="460">
<br>
<div id="chk">
<form id="checkForm">
<input type="text" name="idinput" id="uid">
<input type="button" value="중복확인" onclick="idCheck()">
</form>
<div id="msg"></div>
<br>
<input id="cancleBtn" type="button" value="취소" onclick="window.close()"><br>
<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
</div>

</div>

</body>
</html> --%>