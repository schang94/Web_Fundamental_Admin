package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.kic.dev1.dto.EmpDto;
import kr.co.kic.dev1.util.ConnLocator;

public class EmpDao {
	public static EmpDao single;
	private EmpDao() {}
	public static EmpDao getInstance() {
		if(single == null) {
			single = new EmpDao();			
		}
		return single;
	}
	
	public boolean insert(EmpDto d) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) "					);
			sql.append("VALUES(?,?,?,?,date_format(NOW(),'%Y/%m/%d'),?,?,?)"											);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, d.getNum());
			pstmt.setString(index++, d.getName());
			pstmt.setString(index++, d.getJob());
			pstmt.setInt(index++, d.getMgr());
			pstmt.setInt(index++, d.getSal());
			pstmt.setInt(index++, d.getComm());
			pstmt.setInt(index++, d.getD_num());
			
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
	public boolean update(EmpDto d) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt =null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE emp "																);
			sql.append("SET ENAME = ?, JOB = ?, MGR = ?, SAL = ?, COMM = ?, DEPTNO = ? "			);
			sql.append("WHERE EMPNO = ?"															);
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(index++, d.getName());
			pstmt.setString(index++, d.getJob());
			pstmt.setInt(index++, d.getMgr());
			pstmt.setInt(index++, d.getSal());
			pstmt.setInt(index++, d.getComm());
			pstmt.setInt(index++, d.getD_num());
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
			sql.append("DELETE FROM emp "			);
			sql.append("WHERE EMPNO = ?"			);
			
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
	public EmpDto select(int num){
		EmpDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,NVL(comm,0),DEPTNO "								 );
			sql.append("FROM emp "																					 );
			sql.append("WHERE EMPNO=?"																				 );
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++,num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				index = 1;
				int _num = rs.getInt(index++);
				String name = rs.getString(index++);
				String job = rs.getString(index++);
				int mgr = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				int sal = rs.getInt(index++);
				int comm = rs.getInt(index++);
				int d_num = rs.getInt(index++);
				obj = new EmpDto(_num,name,job,mgr,hiredate,sal,comm,d_num);
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
	public ArrayList<EmpDto> select(int start,int length){
		ArrayList<EmpDto> list = new ArrayList<EmpDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 1;
		
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,NVL(comm,0),DEPTNO ");
			sql.append("FROM emp ");
			sql.append("ORDER BY EMPNO ASC ");
			sql.append("LIMIT ?,? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(index++, start);
			pstmt.setInt(index++, length);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				index = 1;
				int _num = rs.getInt(index++);
				String name = rs.getString(index++);
				String job = rs.getString(index++);
				int mgr = rs.getInt(index++);
				String hiredate = rs.getString(index++);
				int sal = rs.getInt(index++);
				int comm = rs.getInt(index++);
				int d_num = rs.getInt(index++);
				
				list.add(new EmpDto(_num,name,job,mgr,hiredate,sal,comm,d_num));
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
			sql.append("SELECT COUNT(empno) ");
			sql.append("FROM emp");
			
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
