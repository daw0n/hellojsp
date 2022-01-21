<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join.jsp</title>
<script>
function infoConfirm(){
	var regform = document.reg_frm;
	//regform.id.value == ""이렇게 해줄 수도 있다.
	
	if(regform.id.value.length == 0){ //결국엔 같은 의미임
		alert("Id를 넣어주세요."); //경고창 띄우는거임
		regform.id.focus();
		return;
	}
	if(regform.id.value.length < 4){ 
		alert("Id를 네글자 이상 해주세요."); 
		regform.id.focus();
		return;
	}
	if(regform.pw.value == ""){
		alert("PW를 넣어주세요.");
		regform.pw.focus();
		return;
	}
	var pw1=regform.pw.value;
	var pw2=regform.pw_check.value;
	if(pw1 != pw2){
		alert("PW가 일치하지 않습니다.");
		regform.pw.focus();
		return;
	}
	if(regform.name.value == ""){
		alert("이름을 입력해 주세요.");
		regform.name.focus();
		return;
	}

	if(regform.email.value == ""){
		alert("E-mail을 입력해주세요.");
		regform.email.focus();
		return;
	}
	regform.submit();
}
</script>
</head>
<body>
<form action="joinOk.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <input type="text" name="name" size="20"><br />
		메일 : <input type="text" name="email" size="20"><br />
		주소 : <input type="text" name="address" size="50"><br />
		<input type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">
	</form>
</body>
</html>
