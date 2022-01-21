<%@page import="com.jsp.ex.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.ex.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberSelect.jsp</title>
</head>
<body bgcolor="#EDEEED">
<font face="Constantia">
<table border="1">
<tr bgcolor="#CCD6FF">
	<th>name</th> <th>id</th> <th>pw</th> <th>phone</th> <th>gender</th>
</tr>

<%
MemberDAO memberDao = new MemberDAO();
ArrayList<MemberDTO> dtos = memberDao.memberSelect();
for(int i = 0; i < dtos.size(); i++) {
	MemberDTO dto = dtos.get(i);
	String name = dto.getName();
	String id = dto.getId();
	String pw = dto.getPw();
	String phone1 = dto.getPhone1();
	String phone2 = dto.getPhone2();
	String phone3 = dto.getPhone3();
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String gender = dto.getGender();	
%>
<tr bgcolor="#FFFF9E">
	<td><%=name %></td> <td><%=id %></td> <td><%=pw %></td> <td><%=phone %></td> <td><%=gender %></td>
</tr>
<%
}
%>
</font>
</table>
</body>
</html>