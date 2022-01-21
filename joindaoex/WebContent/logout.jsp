<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션의 모든 데이터를 날리는 것
	response.sendRedirect("login.jsp");
%>    