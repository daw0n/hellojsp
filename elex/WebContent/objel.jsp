<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>objel.jsp</title>
</head>
<body>
<form action="objelOk.jsp">
ID : <input type="text" name="id"><br>
PW : <input type="text" name="pw"><br>
<input type="submit" value="LOGIN">
</form>


<%
	application.setAttribute("count", "100");
	session.setAttribute("name", "sikk");
%>
</body>
</html>