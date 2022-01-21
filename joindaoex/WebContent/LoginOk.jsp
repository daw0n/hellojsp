<%@page import="com.jsp.ex.MemberDto"%>
<%@page import="com.jsp.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
MemberDao dao = MemberDao.getInstance();
int checkNum = dao.userCheck(id, pw);
if(checkNum == -1) {
%>
<script>
	alert('존재하지 않는 ID 입니다.');
	history.go(-1);
</script>
<%} else if(checkNum == 0) {%>
<script>
	alert('비밀번호가 틀렸습니다.');
	history.back();
</script>
<%} else {
	MemberDto dto = dao.getMember(id);
	if(dto == null){%>
<script>
	alert('존재하지 않습니다.');
	history.go(-1);
</script>
<%
} else {
		String name  = dto.getName();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("ValidMem", "yes");
		response.sendRedirect("main.jsp");
}
}%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginOk.jsp</title>
</head>
<body>
</body>
</html>