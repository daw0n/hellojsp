<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>objelOk.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<hr>
<h3>
ID : <%=id %><br>
PW : <%=pw %><br>
</h3>
<hr>
<h3>
ID : ${param.id }<br><%-- el은 위에 getParameter와 상관x. = 필요x --%>
PW : ${param.pw }<br>
</h3>
<hr>
<h3>
ID : ${param["id"] } <br>
PW : ${param["pw"] } <br>
</h3>
<hr>
<h3>
session value<br>
${sessionScope.name }<br>
application value<br>
${applicationScope.count }<br>
</h3>
<hr>

</body>
</html>