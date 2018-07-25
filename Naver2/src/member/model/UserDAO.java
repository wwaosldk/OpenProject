package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;



public class UserDAO {
	
	//생성자 은닉
	private UserDAO(){}
	
	//인스턴스 생성 / 한개 생성하고 공유
	private static UserDAO instance  = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	
	private Connection DatabaseUtil;

	public int loginCheck(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT ID, PASSWORD FROM NAVER_USER WHERE ID = ?";
		try {
			//conn = jdbc.DBCPInit.getConnection();
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; // 이미 존재
			}else {
				return 1; // 가입 가능
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();};
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();};
			try {if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();};
		}
		return -2;   //데이터베이스 오류
	}
	
	
	public int join(Connection conn, Userset user) throws SQLException{
		
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO NAVER_USER VALUES (naver_user_seq.NEXTVAL,?, ?, ?, ?, ?, ?, ?)";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getBirth());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getCheckemail());
			pstmt.setString(7, user.getPhone());
			return pstmt.executeUpdate();
			
		}finally {
			JdbcUtil.close(pstmt);
		}
		
	}
	
	public int registerCheck(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM NAVER_USER WHERE ID = ?";
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0; // 이미 존재
			}else {
				return 1; // 가입 가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();};
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();};
			try {if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();};
		}
		return -1;
	}
	
}
