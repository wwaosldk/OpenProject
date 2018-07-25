package login;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginAction
 */
@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie = null;
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String id_rem = request.getParameter("id_keep");
		
		if(id_rem != null) {	//아이디 기억체크박스 체크면
			//쿠키생성
			cookie= new Cookie("id",URLEncoder.encode(id,"utf-8"));	//쿠키 생성
			//쿠키의 유통기한
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
		}else {
			cookie= new Cookie("id",null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		//세션저장
		HttpSession session =request.getSession();
		session.setAttribute("MEMBERID", id);
		System.out.println("세션값" + session.getAttribute("MEMBERID"));
		response.sendRedirect("Main.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
