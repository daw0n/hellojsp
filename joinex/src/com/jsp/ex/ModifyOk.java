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
import javax.servlet.http.HttpSession;

@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn = null;
	private Statement stmt = null;
	private String name, id, pw, phone1, phone2, phone3, gender;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "root";
	String password = "maria"; // 본인이 설정한 pass
	HttpSession httpSession = null;

	public ModifyOk() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/jspdb";
		String user = "root";
		String password = "maria";

		request.setCharacterEncoding("UTF-8");
		httpSession = request.getSession();

		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");

		if (pwConfirm()) {
			System.out.println("pw ok");
			String sql = "update member set name'" + name +"'";
			sql = sql + ", phone1='" + phone1 + "'";
			sql = sql + ", phone2='" + phone2 + "'";
			sql = sql + ", phone3='" + phone3 + "'";
			sql = sql + ", gender='" + gender + "'";
			sql = sql + " where id ='" + id + "'"; //where 앞 공백 필수
			// System.out.println(sql);
			
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
				int i = stmt.executeUpdate(sql);
				if(i == 1) {
					System.out.println("update OK");
					response.sendRedirect("modifyResult.jsp");
					
				} else {
					System.out.println("update FAIL");
					response.sendRedirect("modify.jsp");
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

			//-----
		} else {
			System.out.println("pw fail");
			response.sendRedirect("modify.jsp");
		}
	}

	private boolean pwConfirm() {
		boolean rs = false;
		String sessionPw = (String) httpSession.getAttribute("pw");
		if (sessionPw.equals(pw)) {
			rs = true;
		} else {
			rs = false;
		}
		return rs;
	}

}
