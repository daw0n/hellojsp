<%@page import="com.jsp.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.jsp.ex.MemberDto" scope="page" />
<jsp:setProperty property="*" name="dto" />

<%
String id = (String)session.getAttribute("id"); 
dto.setId(id);
MemberDao dao = MemberDao.getInstance();
int ri= dao.updateMember(dto);

if(ri == 1) {
	//성공
%>

<script>
	alert("정보 수정 완료!");
	document.location.href="main.jsp"; //sendRedirect
</script>

<%} else { %>

<script>
	alert("정보 수정 실패!");
	history.go(-1);
</script>

<%} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>

</body>
</html>