<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String name,id,pw;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGINRESULT.JSP</title>
</head>
<BODY bgcolor="#F8F8F8"><font face="포천 오성과 한음 Regular">
<%
	name = (String)session.getAttribute("name");
	id = (String)session.getAttribute("id");
	pw = (String)session.getAttribute("pw");
%>
<%=name %>님 환영합니다. <br>
<%=id %>님 환영합니다. <br>
<hr>
<h1><a href="modify.jsp">[회원정보 수정]</a></h1>
</font>
</body>
</html>