<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list.jsp</title>
</head>
<body bgcolor="F8F8F8">

<table width="500" cellpadding="0" cellspacing="0" border="1" color="#F8F8F8">
<tr>
	<td>번호</td>
	<td>이름</td>
	<td>제목</td>
	<td>날짜</td>
	<td>히트</td>
</tr>
<c:forEach items="${list}" var="dto">
<tr>	
	<td>${dto.bId}</td>
	<td>${dto.bName}</td>
	<td>${dto.bTitle}</td>
	<td>${dto.bDate}</td>
	<td>${dto.bHit}</td>
</tr>
</c:forEach>
<tr>
	<td colspan="5"><a href="write_view.do">글쓰기</td> <!-- controller가 받는거라서 전부 .do로 -->
</tr>

</table>

</body>
</html>