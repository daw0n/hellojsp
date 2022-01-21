<%@page import="com.jsp.ex.MemberDto"%>
<%@page import="com.jsp.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("id");
MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getMember(id);
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify.jsp</title>
<script>
	function updateConfirm() {
		if(document.mod_frm.pw.value == "") {
			alert("패스워드를 입력하세요!");
			document.mod_frm.pw.focus(); //커서 옮기는
			return;
		}
		
		if(document.mod_frm.pw.value != document.mod_frm.pw_check.value) {
			alert("패스워드가 일치하지 않습니다!");
			document.mod_frm.pw.focus(); //커서 옮기는
			return;
		}
		
		document.mod_frm.submit();
		
		if(document.mod_frm.email.value == "") {
			alert("이메일을 입력하세요!");
			document.mod_frm.email.focus(); 
			return;
		}
		
		document.mod_frm.submit();

	}
</script>

</head>
<body>
<form action="modifyOk.jsp" method="post" name="mod_frm">
		아이디 : <%=dto.getId() %><br />
		비밀번호 : <input type="password" name="pw" size="20"><br />
		비밀번호 확인 : <input type="password" name="pw_check" size="20"><br />
		이름 : <%=dto.getName() %><br />
		메일 : <input type="text" name="email" size="20" value="<%=dto.getEmail() %>"><br />
		주소 : <input type="text" name="address" size="50" value="<%=dto.getAddress() %>"><br />
		<input type="button" value="회원정보수정" onclick="updateConfirm()">&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="취소" onclick="javascript:window.location.href='login.jsp'">
	</form>
</font>	
</body>
</html>