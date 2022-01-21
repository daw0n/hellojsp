package com.jsp.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO { 
	/*
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "root";
	String password = "maria";
	*/
	private DataSource dataSource = null;
	
	public MemberDAO() {
		/*
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
		
	try {
		Context context = new InitialContext();
		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/maria");
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	public ArrayList<MemberDTO> memberSelect() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from member";
		
		try {
			// conn = DriverManager.getConnection(url, user, password);
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String name = rs.getString("NAME");
				String id =  rs.getString("ID");
				String pw =  rs.getString("PW");
				String phone1 =  rs.getString("PHONE1");
				String phone2 =  rs.getString("PHONE2");
				String phone3 =  rs.getString("PHONE3");
				String gender =  rs.getString("GENDER");
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender); 
				dtos.add(dto);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
}
