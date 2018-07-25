package register.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jdbc.connection.ConnectionProvider;
import register.service.ServiceException;
import member.model.UserDAO;
import member.model.Userset;

public class JoinService {
	private static JoinService instance = new JoinService();
	
	public static JoinService getInstance() { 
		return instance;
	}

	private JoinService() {
	}

	public int join(Userset user) throws ServiceException {
		Connection conn = null;
		try {
			System.out.println("1111111111111111");
			conn = ConnectionProvider.getConnection();
			System.out.println("??????????");
			UserDAO dao = UserDAO.getInstance();

			int resultCnt = dao.join(conn, user);

			return resultCnt;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new ServiceException("회원가입 실패: " + e.getMessage(), e);

		}
	}
}
