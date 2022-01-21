<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String driver = "org.mariadb.jdbc.Driver";
	//String driver = "com.mysql.jdbc.Driver"; //mysql
	//String driver = "oracle.jdbc.driver.OrafcelDriver" //oracle

	String url = "jdbc:mariadb://localhost:3306/jspdb";
	//String url = "jdbc:mysql://localhost:3306/jspdb";
	//String url = "jdbc:oracleLthin:@localhost:1521:jspdb";

	String uid = "root";
	String upw = "maria"; // 본인이 설정한 pass
	String sql = "select * from namecard order by idx desc"; // 큰 번호부터
%>
<!DOCTYPE html PUBLIC "
-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>namecard.jsp</title>
</head>
<body>
	<%
		try {
			Class.forName(driver); // new 클래스
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int idx = rs.getInt("IDX");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				String tel = rs.getString("TEL");

				out.println("<h1>" + idx + " : " + name + " : " + address + " : " + tel + " : " + "</h1><br>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
	%>
</body>
</html>