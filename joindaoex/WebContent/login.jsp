
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(session.getAttribute("ValidMem") != null) {
%>
<jsp:forward page="main.jsp"></jsp:forward>     
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>

<script>
function infoConfirm(){
	var regform = document.reg_frm;
	
	if(regform.id.value.length == 0){ 
		alert("Id를 넣어주세요."); 
		regform.id.focus();
		return;
	}

	if(regform.pw.value == ""){
		alert("PW를 넣어주세요.");
		regform.pw.focus();
		return;
	}

	regform.submit();
}
</script>
</head>
<BODY bgcolor="#F8F8F8"><font face="포천 오성과 한음 Regular">
<hr>
<form action="LoginOk.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		<input type="button" value="로그인" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; 
</form>
<hr>
</body>
</html>