package com.jsp.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXITENT = 0;
	public static final int MEMBER_EXITENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static MemberDao instance = new MemberDao(); 
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() {
		Context context = null;
		DataSource datasource = null;
		Connection conn = null;
		try {
			context = new InitialContext();
			datasource = (DataSource)context.lookup("java:comp/env/jdbc/maria");
			conn = datasource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// insertMember()
	public int insertMember(MemberDto dto) {
		String id,pw,name,email,address;
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members (id,pw,name,email,address)  values(?,?,?,?,?) ";
		id = dto.getId();
		pw = dto.getPw();
		name = dto.getName();
		email = dto.getEmail();
		address = dto.getAddress();
		System.out.printf("%s,%s,%s,%s,%s",id,pw,name,email,address);	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, address);
			ri = MemberDao.MEMBER_JOIN_SUCCESS;
			pstmt.executeUpdate();
		} catch (Exception e) {
			ri = MemberDao.MEMBER_JOIN_FAIL;
			e.printStackTrace();
		} finally { 
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
				
		return ri;		
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " select id from members where id = ? ";
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ri = MemberDao.MEMBER_EXITENT;
			} else {
				ri = MemberDao.MEMBER_NONEXITENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
				
		return ri;		
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " select pw from members where id = ? ";
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPw = rs.getString("pw");
				if(dbPw.equals(pw)) {
					ri = MemberDao.MEMBER_LOGIN_SUCCESS; 
				} else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
				
		return ri;		
	}
	
	public MemberDto getMember(String id) {
		int ri = 0;
		
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " select * from members where id = ? ";
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				
				ri = MemberDao.MEMBER_EXITENT;
				} else {
				ri = MemberDao.MEMBER_NONEXITENT;
				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
				
		return dto;		
	}
	

	public int updateMember(MemberDto dto) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update members set pw=?, email=?,address=? where id=? ";
		System.out.println(dto.getEmail());
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			ri = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
				
		return ri;		
	}
	
	public ArrayList<MemberDto> memberAll() {
		int ri = 0;
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " select * from members order by name asc ";
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dtos.add(dto);
				} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally { 
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
				
		return dtos;		
	}
	
	
}
