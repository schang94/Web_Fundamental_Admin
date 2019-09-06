package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.kic.dev1.dto.DeptDto;
import kr.co.kic.dev1.util.ConnLocator;

public class DeptDao {
	public static DeptDao single;
	private DeptDao() {}
	public static DeptDao getInstance() {
		if(single == null) {
			single = new DeptDao();			
		}
		return single;
	}
	
	public boolean insert(DeptDto d) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO dept(DEPTNO,DNAME,LOC) "					);
			sql.append("VALUES(?,?,?)"											);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, d.getNum());
			pstmt.setString(index++, d.getName());
			pstmt.setString(index, d.getLoc());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	public boolean update(DeptDto d) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE dept "														);
			sql.append("SET DNAME = ?, LOC = ?" 											);
			sql.append("WHERE DEPTNO = ?"													);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, d.getName());
			pstmt.setString(index++, d.getLoc());
			pstmt.setInt(index++, d.getNum());
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	public boolean delete(int num) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM dept "			);
			sql.append("WHERE DEPTNO = ?"			);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, num);
			
			pstmt.executeUpdate();
			
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	public DeptDto select(int num){
		DeptDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT DEPTNO,DNAME,LOC 																	");
			sql.append("FROM dept "																					 );
			sql.append("WHERE DEPTNO=?"																				 );
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				int _num = rs.getInt(index++);
				String name = rs.getString(index++);
				String loc = rs.getString(index++);
				obj = new DeptDto(_num,name,loc);
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
		return obj;
	}
	public ArrayList<DeptDto> select(int start,int length){
		ArrayList<DeptDto> list = new ArrayList<DeptDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT DEPTNO,DNAME,LOC ");
			sql.append("FROM dept ");
			sql.append("ORDER BY DEPTNO ASC ");
			sql.append("LIMIT ?,? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				index = 1;
				int num = rs.getInt(index++);
				String name = rs.getString(index++);
				String loc = rs.getString(index++);
				
				list.add(new DeptDto(num,name,loc));
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
	public int db_count() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(deptno) ");
			sql.append("FROM dept");
			
			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
}
