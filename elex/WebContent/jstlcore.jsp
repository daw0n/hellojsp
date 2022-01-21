<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstlcore.jsp</title>
</head>
<body>
<c:set var="name" value="최원재" />
NAME : <c:out value="${name}" />
<hr>
<c:remove var="name" /> 
NAME : <c:out value="${name}" />
<c:catch var="error">
<%=2/0 %>
</c:catch>
<hr>
ERROR : <c:out value="${error }" />
<hr>
<c:if test="${1+2 == 3 }">
	1 + 2 = 3
</c:if>
<hr>
<c:forEach var="items" begin="0" end="30" step="3">
	${items }


</c:forEach>






</body>
</html>