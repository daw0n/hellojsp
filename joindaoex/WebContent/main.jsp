<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(session.getAttribute("id") == null) {
	response.sendRedirect("login.jsp");
}

String name = (String)session.getAttribute("name");
String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main.jsp</title>
</head>
<body>
<h1><font color="blue"><%=name %>님 환영합니다!</font></h1>
<hr>

<form action="logout.jsp" method="post">
	<input type="submit" value="로그아웃">
	&nbsp;&nbsp;&nbsp; 
	<input type="button" value="정보수정" onclick="window.location='modify.jsp'">
</form>
</body>
</html>