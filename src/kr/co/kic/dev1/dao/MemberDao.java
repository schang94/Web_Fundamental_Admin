package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.kic.dev1.dto.MemberDto;
import kr.co.kic.dev1.util.ConnLocator;

public class MemberDao {
	private static MemberDao single;
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if(single == null) {
			single = new MemberDao();
		}
		return single;
	}
	
	public boolean insert(MemberDto m) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO member(m_seq,m_id,m_email,m_name,m_pwd,m_phone,m_regdate) ");
			sql.append("VALUES(NULL,?,?,?,PASSWORD(?),?,NOW()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++,m.getId());
			pstmt.setString(index++,m.getEmail());
			pstmt.setString(index++,m.getName());
			pstmt.setString(index++,m.getPassword());
			pstmt.setString(index++,m.getPhone());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		
		return isSuccess;
	}
	public boolean update(MemberDto m) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE member ");
			sql.append("SET m_id=?, m_email=?,m_name=?,m_phone=?,m_regdate=NOW() ");
			sql.append("WHERE m_seq=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++,m.getId());
			pstmt.setString(index++,m.getEmail());
			pstmt.setString(index++,m.getName());
			pstmt.setString(index++,m.getPhone());
			pstmt.setInt(index++,m.getSeq());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		
		return isSuccess;
	}
	public boolean delete(int seq) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM member ");
			sql.append("WHERE m_seq=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,seq);
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		
		return isSuccess;
	}
	public MemberDto select(int seq) {
		MemberDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq,m_id,m_email,m_name,m_phone,date_format(m_regdate,'%Y-%m-%d') m_regdate ");
			sql.append("FROM member ");
			sql.append("WHERE m_seq=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,seq);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				seq= rs.getInt(index++);
				String id = rs.getString(index++);
				String email = rs.getString(index++);
				String name = rs.getString(index++);
				String phone = rs.getString(index++);
				String regdate = rs.getString(index++);
				obj = new MemberDto(seq,id,email,name,phone,regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		return obj;
	}
	public ArrayList<MemberDto> select(int start,int length){
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq,m_id,m_email,m_name,m_phone,date_format(m_regdate,'%Y/%m/%d') m_regdate ");
			sql.append("FROM member ");
			sql.append("ORDER BY m_seq DESC ");
			sql.append("LIMIT ?,? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,start);
			pstmt.setInt(index++,length);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				index = 1;
				int seq= rs.getInt(index++);
				String id = rs.getString(index++);
				String email = rs.getString(index++);
				String name = rs.getString(index++);
				String phone = rs.getString(index++);
				String regdate = rs.getString(index++);
				list.add(new MemberDto(seq,id,email,name,phone,regdate));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	public int getRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) FROM member ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				count = rs.getInt(index++);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		return count;
	}
	public String selectJson(int start,int length){
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;		
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq,m_id,m_email,m_name,m_phone,date_format(m_regdate,'%Y/%m/%d') m_regdate ");
			sql.append("FROM member ");
			sql.append("ORDER BY m_seq DESC ");
			sql.append("LIMIT ?,? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,start);
			pstmt.setInt(index++,length);
			
			rs = pstmt.executeQuery();
			JSONObject item = null;
			
			while(rs.next()) {
				index = 1;
				item = new JSONObject();
				int seq= rs.getInt(index++);
				String id = rs.getString(index++);
				String email = rs.getString(index++);
				String name = rs.getString(index++);
				String phone = rs.getString(index++);
				String regdate = rs.getString(index++);
				
				item.put("seq", seq);
				item.put("id", id);
				item.put("email", email);
				item.put("name", name);
				item.put("phone", phone);
				item.put("regdate", regdate);
				
				jsonArray.add(item);
			}
			jsonObj.put("items",jsonArray);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return jsonObj.toString();
	}
	public boolean isCheck(String id) {
		boolean isExisted = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_id ");
			sql.append("FROM member ");
			sql.append("WHERE m_id = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++,id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				isExisted = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		return isExisted;
	}
	
	public MemberDto isMember(MemberDto m) {
		MemberDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq,m_id,m_email,m_name,m_phone,date_format(m_regdate,'%Y/%m/%d') m_regdate ");
			sql.append("FROM member ");
			sql.append("WHERE m_email=? AND m_pwd=PASSWORD(?);");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++,m.getEmail());
			pstmt.setString(index++,m.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				index = 1;
				int seq= rs.getInt(index++);
				String id = rs.getString(index++);
				String email = rs.getString(index++);
				String name = rs.getString(index++);
				String phone = rs.getString(index++);
				String regdate = rs.getString(index++);
				dto = new MemberDto(seq,id,email,name,phone,regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
		return dto;
	}
}
