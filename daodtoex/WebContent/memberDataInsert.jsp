<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "root";
	String password = "maria";
	
%>
<%
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,password);
		int n;
		String sql ="insert member(NAME,ID,PW,PHONE1,PHONE2,PHONE3,gender)";
		sql = sql + " values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "kidmili1");
		pstmt.setString(2, "kidpw");
		pstmt.setString(3, "1454");
		pstmt.setString(4, "010");
		pstmt.setString(5, "5555");
		pstmt.setString(6, "9828");
		pstmt.setString(7, "female");
		n = pstmt.executeUpdate(); // return 값이 int
				
		if(n == 1) {
			out.println("Insert OK!");
		} else {
			out.println("Insert FAIL!");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
		}
	}
	
%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberDataInsert.jsp</title>
</head>
<body>
<h1><a href="memberDataView.jsp">회원 정보 보기</a></h1>
</body>
</html>