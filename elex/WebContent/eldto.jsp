<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.jsp.ex.MemberDto" scope="page" />
<jsp:setProperty property="id" name="member" value="sikk" />
<jsp:setProperty property="pw" name="member" value="sik11" />
<jsp:setProperty property="name" name="member" value="minsik" />
<jsp:setProperty property="email" name="member" value="younghotyellow@g.g" />
<jsp:setProperty property="address" name="member" value="hghr" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>eldto.jsp</title>
</head>
<body>
<%--사용 전 --%>
<h3>
ID : <jsp:getProperty property="id" name="member"/> <br>
PW : <jsp:getProperty property="pw" name="member"/> <br>
NAME : <jsp:getProperty property="name" name="member"/> <br>
</h3><hr>
<h3>
<%--el 사용 후 --%>
ID : ${member.id} <br>
PW : ${member.pw} <br>
NAME : ${member.name} <br>
</h3> 
<hr>

</body>
</html>