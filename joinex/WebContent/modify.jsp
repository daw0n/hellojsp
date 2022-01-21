<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String name,id,pw,phone1,phone2,phone3,gender;	
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "root";
	String password = "maria";
%>    
<%
id= (String)session.getAttribute("id");
String sql = "select * from member where id ='" + id + "'";
Class.forName(driver);
conn = DriverManager.getConnection(url, user, password);
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);
if(rs.next()) {
	name = rs.getString("NAME");
	id = rs.getString("ID");
	pw = rs.getString("PW");
	phone1 = rs.getString("PHONE1");
	phone2 = rs.getString("PHONE2");
	phone3 = rs.getString("PHONE3");
	gender = rs.getString("GENDER");
} else {
	//response.sendRedirect("loginResult.jsp");
}


%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MODIFY.JSP</title>
</head>
<body>
<form action="ModifyOk" method="post">
<h1><font color="#0057d8" face="broadway">MODIFY</font></h1>
<hr>
<input type="hidden" name="id" value="<%=id %>"> <br>
NAME : <input type="text" name="name" size="10" value="<%=name %>"> <br>
ID : <b><%=id %></b><br>
<font color="red" face="포천 오성과 한음 Regular">현재 비밀번호를 넣어주세요.</font> <br>
PW : <input type="text" name="pw" size="10"><br>
TEL : 
<select name="phone1">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="019">019</option>
</select> -
<input type="text" name="phone2" size="5" maxlength="4" value="<%=phone2 %>"> -
<input type="text" name="phone3" size="5" maxlength="4" value="<%=phone3 %>"> <br>
GENDER : 
<% if(gender.equals("male")) {%>
<input type ="radio" name="gender" value="male" checked="checked"> 남 
<input type ="radio" name="gender" value="female" > 여
<%} else { %>
<input type ="radio" name="gender" value="male"> 남 
<input type ="radio" name="gender" value="female"  checked="checked"> 여
<%} %>
<hr>
<input type="submit" value="정보수정" style="background-color:#DCDCDC; border:solid 3px #DCDCDC; color:#0057d8;">
</font>
</form> 
</body>
</html>