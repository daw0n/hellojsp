<%@page import="com.jsp.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="dto" class="com.jsp.ex.MemberDto"/>
    <<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinOk.jsp</title>
</head>
<body>
<%
	MemberDao dao = MemberDao.getInstance();
	if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXITENT) {
%>
<script >
alert("ID가 이미 존재 합니다.")
history.back();
</script>
<%}else{
	int ri = dao.insertMember(dto);
	if(ri == MemberDao.MEMBER_JOIN_SUCCESS){
%>
<script >
alert("회원가입을 축하합니다.")
document.location.href="login.jsp";
</script>
<%}} %>
</body>
</html>