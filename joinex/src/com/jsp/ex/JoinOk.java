package com.jsp.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// + 
	private Connection conn = null;
	private Statement stmt = null;
	private String name,id,pw,phone1,phone2,phone3,gender;	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "root";
	String password = "maria"; // 본인이 설정한 pass

    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	// + 
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		
		String sql = "insert member(NAME,ID,PW,PHONE1,PHONE2,PHONE3,GENDER)";
		sql = sql + "values('" + name + "',";
		sql = sql + "'" + id + "',";
		sql = sql + "'" + pw + "',";
		sql = sql + "'" + phone1 + "',";
		sql = sql + "'" + phone2 + "',";
		sql = sql + "'" + phone3 + "',";
		sql = sql + "'" + gender + "')";

		// insert member(NAME,ID,PW,PHONE1,PHONE2,PHONE3,GENDER)values('null','null','null','null','null','null','null')
		// System.out.println(sql);

		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			int i = stmt.executeUpdate(sql);
			if(i == 1) {
				System.out.println("insert OK");
				response.sendRedirect("joinResult.jsp");
				
			} else {
				System.out.println("insert FAIL");
				response.sendRedirect("join.html");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn !=null) conn.close(); // 역순으로
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
