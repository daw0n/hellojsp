<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>el.jsp</title>
</head>
<body>
<h3>
<%=10 %><br>
<%=99.99 %><br>
<%="ABC" %><br>
<%=true %><br>
</h3>
<hr>
<h3>
${10} <br>
${99.99} <br>
${"ABC"} <br>
${true} <br>
</h3>
<hr>
<h1>연산자 test</h1><hr>
<h3>
<%=1+2 %><br>
<%=1-2 %><br>
<%=1*2 %><br>
<%=1>2 %><br>
<%=1<2 %><br>
<%=(1>2) ? 1: 2%><br>
<%=(1>2)||(1<2) %><br>
</h3>
<hr>
<h3>
${ 1+2 }<br>
${ 1-2 }<br>
${ 1*2 }<br>
${ 1>2 }<br>
${ 1<2 }<br>
${ (1>2) ? 1: 2 }<br>
${ (1>2)||(1<2) }<br>
</h3>

</body>
</html>